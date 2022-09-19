library ieee;
use ieee.std_logic_1164.all;
entity bin2hex is
port ( number : in integer range 0 to 15;
	   seg : out bit_vector ( 6 downto 0 ) );
end;
architecture behave of bin2hex is
signal temp : bit_vector ( 6 downto 0 );
begin
with number select
temp <= "1111110" when 0,
		"0110000" when 1,
		"1101101" when 2,
		"1111001" when 3,
		"0110011" when 4,
		"1011011" when 5,
		"1011111" when 6,
		"1110000" when 7,
		"1111111" when 8,
		"1111011" when 9,
		"1110111" when 10,
		"0011111" when 11,
		"1001110" when 12,
		"0111101" when 13,
		"1001111" when 14,
		"1000111" when 15;

seg<=  not temp;
end behave;
