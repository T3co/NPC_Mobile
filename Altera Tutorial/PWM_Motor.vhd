library ieee;
use ieee.std_logic_1164.all;
entity PWM_Motor is
port ( clk: in bit;
       pOut : out STD_LOGIC);
end;
architecture RTL of PWM_Motor is
  signal pulse : STD_LOGIC := '1';
  signal count : integer range 1 to 50000 := 1;  

begin 
  process (clk)
begin 

  if clk'event and clk = '1' then
  
  count <= count + 1;
		
  
    if(count < 40000) then 
      pulse <= '1';
		end if;
		
	 
	 if(count > 40000) then
		pulse <= '0';
		end if;
		
	if(count = 50000) then
		count <= 1;
		end if;
		
  end if;
  
  pOut <= pulse;
  
end process;


	
end RTL;

