library ieee;
use ieee.std_logic_1164.all;
entity PWM_Motor is
port ( clk: in bit;
       pOut : out BIT);
end;
architecture RTL of PWM_Motor is
  signal pulse : BIT ;
  signal count : integer range 0 to 50000 ;  

begin 
  process (clk)
begin 

  if clk'event and clk = '1' then
  
		if(count < 5000) then   count <= count + 1; ELSE COUNT<=0; END IF;
	
  
    if(count < 4000) then 
      pulse <= '1';
	 ELSE
		pulse <= '0';
		end if;
		
		  

  end if;
  
  
end process;

  pOut <= pulse;

	
end RTL;

