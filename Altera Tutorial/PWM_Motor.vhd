library ieee;
use ieee.std_logic_1164.all;
entity PWM_Motor is
port ( clk: in bit;
		 motorInput : in bit_vector(2 downto 0);
		 speed : in bit;
		 pOut : out bit;
		 motorOutput : out bit_vector(2 downto 0));
end;
architecture RTL of PWM_Motor is
  signal pulse : bit ;
  signal cnt,cntChange : integer range 0 to 5000 ;
  signal cntMax : integer range 0 to 5000 := 5000;
  
begin 
--checks if the car is going left or right to reduce the speed by half(aka making the pwm 40% and not 80%

cntChange <= 4000 when speed = '1' else
			3000 when speed = '0' else
			2500 when motorInput = "011" else
			2500 when motorInput = "100";

  process (clk)
  begin 
  if clk'event and clk = '1' then --clock if
		if(cnt < cntMax) then   cnt <= cnt + 1; else cnt<=0; end if; --ends same line
    if(cnt < cntChange) then -- 80% pwm if
      pulse <= '1';
	 else
		pulse <= '0';
		end if;--end 80% pwm if
  end if;--end clock if
  
end process;


  motorOutput <= motorInput;
  pOut <= pulse;

	
end RTL;

