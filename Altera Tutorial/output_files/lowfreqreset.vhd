library ieee;
use ieee.std_logic_1164.all;


entity lowfreqreset is
port(clk : in bit;
     ledOUT : out STD_LOGIC);
end;

architecture behave of lowfreqreset is 
  signal pulse : STD_LOGIC := '0';
  signal count : integer range 0 to 500000000 := 0;  

begin 
  process (clk)
begin 
  if clk'event and clk = '1' then
    if(count > 450000000) then 
       count <= 0;
       pulse <= '0';
    else
    count <= count + 1;
	 pulse <= '1';
    end if;
  end if;
end process;

ledOUT <= pulse;

end behave;