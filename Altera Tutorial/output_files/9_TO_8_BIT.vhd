library ieee;
use ieee.std_logic_1164.all;
entity 9_TO_8_BIT is
port(temp: in bit_Vector(8 downto 0);
		tout: buffer bit_Vector(7 downto 0));
end;

architecture behave of 9_TO_8_BIT is 
begin
process(temp)
tout <= temp;
end process;
end behave;
