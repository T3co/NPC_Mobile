library ieee;
use ieee.std_logic_1164.all;
entity servo_control  is
port (clk:in  bit;
		degree: in bit_vector(2 downto 0);
		fOut: out bit);
end;
architecture b of servo_control  is
signal cnt , cntMax : integer range 0 to 1000000 ;  --50hz to servo
begin

cntMax<=56250 when degree="000" else
		  62500 when degree="001" else 
		  68750 when degree="010" else 
		  75000 when degree="011" else 
		  81250 when degree="100" else 
		  87500 when degree="101" else 
		  93750 when degree="110" else
		  100000 when degree="111";
	 
process (clk)
begin
	if clk'event and clk='1' then
		if cnt<1000000 then cnt<=cnt+1; else cnt<=0;
		end if;
		
		if cnt<cntMax then fOut<='1'; else fOut<='0';
		end if;
	end if;
end process;
end b;

