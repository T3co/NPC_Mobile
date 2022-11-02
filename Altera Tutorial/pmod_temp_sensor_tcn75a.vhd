--------------------------------------------------------------------------------
--הקוד לקוח מאתר בשם DIGIKEY

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pmod_temp_sensor_tcn75a IS --מוצג בבלוק ליד הsymbol של החיישון בדיאגרמת בלוקים
  GENERIC(
    sys_clk_freq     : INTEGER := 50_000_000;                      --כניסת שעון מערכת
    resolution       : INTEGER := 9;                               --רזולוציה רצויה של הטמפרטורה בביט
    temp_sensor_addr : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001000"); --כתובת הI2C של החיישן
  PORT(
    clk         : IN    STD_LOGIC;                                 --שעון מערכת
    reset_n     : IN    STD_LOGIC;                                 --מאפס את החיישן שיהיה לו הפסקה מידי פעם, בגבוה החיישן ימדוד בנמוך החיישן לא פעיל
    scl         : INOUT STD_LOGIC;                                 --I2C serial clock
    sda         : INOUT STD_LOGIC;                                 --I2C serial data
    i2c_ack_err : OUT   STD_LOGIC;                                 --מודיע כשיש שגיאה בחיישן משמש כדגל
    temperature : OUT   STD_LOGIC_VECTOR(resolution-1 DOWNTO 0));  --מידע הטמפרטורה בסיבית
END pmod_temp_sensor_tcn75a;

ARCHITECTURE behavior OF pmod_temp_sensor_tcn75a IS
  TYPE machine IS(start, set_resolution, set_reg_pointer, read_data, output_result); --מצבים של החיישן
  SIGNAL state       : machine;                       --מכונת מצבים
  SIGNAL config      : STD_LOGIC_VECTOR(7 DOWNTO 0);  --ערך כדי להגדיר את רישום תצורת החיישן
  SIGNAL i2c_ena     : STD_LOGIC;                     --i2c משתמש עזר להפעלה
  SIGNAL i2c_addr    : STD_LOGIC_VECTOR(6 DOWNTO 0);  --i2c משתמש עזר לכתובת החיישן
  SIGNAL i2c_rw      : STD_LOGIC;                     --i2c משתמש עזר לפקודה של קריאה וכתיבה
  SIGNAL i2c_data_wr : STD_LOGIC_VECTOR(7 DOWNTO 0);  --i2c כותב מידע
  SIGNAL i2c_data_rd : STD_LOGIC_VECTOR(7 DOWNTO 0);  --i2c קורא מידע
  SIGNAL i2c_busy    : STD_LOGIC;                     --i2c משתמש עזר כשהקו תפוס
  SIGNAL busy_prev   : STD_LOGIC;                     --ערך קודם כאשר הקו תפוס בתקשורת I2C
  SIGNAL temp_data   : STD_LOGIC_VECTOR(15 DOWNTO 0); --חוצץ מידע הטמפרטורה

  COMPONENT i2c_master IS
    GENERIC(
     input_clk : INTEGER;  --מידע כניסת השעון
     bus_clk   : INTEGER); --מהירות בה רגל SCL תרוץ
    PORT(
     clk       : IN     STD_LOGIC;                    --שעון מערכת
     reset_n   : IN     STD_LOGIC;                    --ריסט בקצב נמוך כדי לא להעמיס על החיישן
     ena       : IN     STD_LOGIC;                    --מאפשר פעולת החיישן
     addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --כתובת העבד של החיישן
     rw        : IN     STD_LOGIC;                    --'0' זה כותב '1' זה קורא
     data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --מידע לרשום לעבד I2C
     busy      : OUT    STD_LOGIC;                    --מודיע על העברת מידע בפעולתה
     data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --קריאת מידע מהעבד I2C
     ack_error : BUFFER STD_LOGIC;                    --דגל מידע שגוי מהחיישן\עבד
     sda       : INOUT  STD_LOGIC;                    --יציאת מידע סדרתי מהחיישן בתקשורת I2C
     scl       : INOUT  STD_LOGIC);                   --יציאת שעון סדרתי מהחיישן בתקשורת I2C
  END COMPONENT;

BEGIN

  --מאתחל את התוכנית I2C_MASTER
  i2c_master_0:  i2c_master
    GENERIC MAP(input_clk => sys_clk_freq, bus_clk => 400_000)
    PORT MAP(clk => clk, reset_n => reset_n, ena => i2c_ena, addr => i2c_addr,
             rw => i2c_rw, data_wr => i2c_data_wr, busy => i2c_busy,
             data_rd => i2c_data_rd, ack_error => i2c_ack_err, sda => sda,
             scl => scl);

  --מגדיר את סיביות הרזולוציה עבור ערך רישום תצורת החיישן
  WITH resolution SELECT
    config <= "00100000" WHEN 10,     --10 סיביות
              "01000000" WHEN 11,     --11 סיביות
              "01100000" WHEN 12,     --12 סיביות
              "00000000" WHEN OTHERS; --9 סיביות(ברירת מחדל)

  PROCESS(clk, reset_n)
    VARIABLE busy_cnt : INTEGER RANGE 0 TO 2 := 0;               --סופר את מעברי האות התפוסים במהלך העברה אחת
    VARIABLE counter  : INTEGER RANGE 0 TO sys_clk_freq/10 := 0; --סופר 100ms לחכות לפני תקשורת
  BEGIN
    IF(reset_n = '0') THEN               --כאשר reset_n מופעל
      counter := 0;                        --מאפס את המונה של העצירה
      i2c_ena <= '0';                      --מאפס i2c enable
      busy_cnt := 0;                       --מאפס busy counter
      temperature <= (OTHERS => '0');      --מאפס את המידע של הטמפרטורה
      state <= start;                      --מאפס את מכונת המצבים
    ELSIF(clk'EVENT AND clk = '1') THEN  --בודק אם השעון בגבוה
      CASE state IS                        --מכונת מצבים
      
        --נותן לחיישן טמפ' 100ms להפעלה לפני התקשורת
        WHEN start =>
          IF(counter < sys_clk_freq/10) THEN   --100ms עוד לא ספר
            counter := counter + 1;              --מוסיף למונה
          ELSE                                 --100ms הגיע ל
            counter := 0;                        --מאפס מונה
            state <= set_resolution;             --ממשיך לקביעת הרזולוציה של החיישן
          END IF;
      
        --קביעת הרזולוציה של החיישן
        WHEN set_resolution =>            
          busy_prev <= i2c_busy;                       --לוכד את הערך של האות התפוס הקודם של i2c
          IF(busy_prev = '0' AND i2c_busy = '1') THEN  --i2c busy עבר לגבוה
            busy_cnt := busy_cnt + 1;                    --סופר את הפעמים busy הפך מנמוך לגבוה במהלך ההעברה
          END IF;
          CASE busy_cnt IS                             --busy_cnt עוקב אחר איזו פקודה אנחנו נמצאים
            WHEN 0 =>                                    --אין שום פקודה נועחלת כרגע
              i2c_ena <= '1';                              --התחל את העברה
              i2c_addr <= temp_sensor_addr;                --קביעת הכתובת של החיישן טפמ'
              i2c_rw <= '0';                               --הפקודה '1' זה כתיבה
              i2c_data_wr <= "00000001";                   --הגדר את מצביע הרשמה ל-Register Configuration
            WHEN 1 =>                                    --קודם busy גבוה אחר כך פקודה 1 ננעלת ואפשר להמשיך לפקודה 2
              i2c_data_wr <= config;                       --כתוב את ערך התצורה החדש ל-Configuration Register
            WHEN 2 =>                                    --עכשיו busy גבוה ולכן פקודה 2 ננעלת
              i2c_ena <= '0';                              --כאשר deassert מופעל ניתן להפסיק את העברה לאחר פקודה 2
              IF(i2c_busy = '0') THEN                      --העברה הושלמה
                busy_cnt := 0;                               --מאפס את busy_cnt  להעברה הבאה
                state <= set_reg_pointer;                    --ממשיך להגדרת מצביע הרשמה לקריאות נתונים
              END IF;
            WHEN OTHERS => NULL;
          END CASE;
          
        --הגדר את מצביע האוגר למאגר טמפרטורת הסביבה  
        WHEN set_reg_pointer =>
          busy_prev <= i2c_busy;                       --ללכוד את הערך של האות busy הקודם של i2c
          IF(busy_prev = '0' AND i2c_busy = '1') THEN  --i2c busy עלה לגבוה
            busy_cnt := busy_cnt + 1;                    --סופר את הפעמים שbusy הפך מנמוך לגבוה במהלך ההעברה
          END IF;
          CASE busy_cnt IS                             --busy_cnt עוקב אחר איזו פקודה אנחנו נמצאים
            WHEN 0 =>                                    --אין פקודה נעולה כרגע
              i2c_ena <= '1';                              --התחלת העברת המידע
              i2c_addr <= temp_sensor_addr;                --הגדרת  הכתובת של החיישן
              i2c_rw <= '0';                               --פקודה '1' זה כתיבה
              i2c_data_wr <= "00000000";                   --הגדר את מצביע ה-Register ל-Ambient Temperature Register
            WHEN 1 =>                                    --1st busy גבוה: פקודה אחת נעולה
              i2c_ena <= '0';                              --deassert אפשר לעצור את ההעברה לאחר פקודה 1
              IF(i2c_busy = '0') THEN                      --העברה הושלמה
                busy_cnt := 0;                               --מאפס את busy_cnt להעברה הבאה
                state <= read_data;                          --ממשיך לקריאת מידע
              END IF;
            WHEN OTHERS => NULL;
          END CASE;
        
        --קורא את הטמפ' של הסביבה
        WHEN read_data =>
          busy_prev <= i2c_busy;                       --ללכוד את הערך של האות busy הקודם של i2c
          IF(busy_prev = '0' AND i2c_busy = '1') THEN  --i2c busy עלה לגבוה
            busy_cnt := busy_cnt + 1;                    --סופר את הפעמים  שbusy הפך מנמוך לגבוה במהלך ההעברה
          END IF;
          CASE busy_cnt IS                             --busy_cnt עוקב אחר איזו פקודה אנחנו נמצאים
            WHEN 0 =>                                    -- --אין פקודה נעולה כרגע
              i2c_ena <= '1';                              ----התחלת העברת המידע
              i2c_addr <= temp_sensor_addr;                ----הגדרת  הכתובת של החיישן
              i2c_rw <= '1';                               --פקודה '1' זה קריאה
            WHEN 1 =>                                    --קודם busy : אחר כך פקודה 1 ננעלת, ניתן להוציא את פקודה 2
              IF(i2c_busy = '0') THEN                      --מודיע שמידע הנקרא בפקודה 1 זמין
                temp_data(15 DOWNTO 8) <= i2c_data_rd;       --מחזיר את MSB מפקודה 1
              END IF;
            WHEN 2 =>                                    --קודם busy 2 גבוה, פקודה 2 ננעלת
              i2c_ena <= '0';                              --deassert אפשר לעצור אץ ההעברה לאחר פקודה 2
              IF(i2c_busy = '0') THEN                      --מודיע שהמידע בפקודה 2 זמין
                temp_data(7 DOWNTO 0) <= i2c_data_rd;        --מחזיר את LSB מפקודה 2
                busy_cnt := 0;                               --מאפס את busy_cnt לפקודה הבאה
                state <= output_result;                      --ממשיך להוצאת הטמפ, לאחר כל התהליך
              END IF;
           WHEN OTHERS => NULL;
          END CASE;

        --הוצאת מידע הטמפ,
        WHEN output_result =>
          temperature <= temp_data(15 DOWNTO 16-resolution);  --רושם את הטמפ, למוצא
          state <= read_data;                                 --מחזיר את המידע הבא מהשלב הקודם של קריאת המידע

        --חוזר להתחלה ומאפס הכל
        WHEN OTHERS =>
          state <= start;

      END CASE;
    END IF;
  END PROCESS;   
END behavior;
