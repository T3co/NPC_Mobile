library ieee;
use ieee.std_logic_1164.all;
entity BOUD_RATE is
port (clk : in bit;
	  fout : buffer bit);
end;
architecture behave of BOUD_RATE is
signal cnt : integer range 0 to 162; --
begin
process (clk)
begin
if clk'event and clk='1' then
	if cnt<162 then --
		cnt<=cnt+1; 
	else 
		cnt<=0; 
		fout<=not fout; 
	end if;
end if;
end process;
end behave;