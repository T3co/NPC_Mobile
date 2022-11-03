library ieee;
use ieee.std_logic_1164.all;
entity bit_9_to_8 is
port(temperature : in STD_LOGIC_VECTOR(8 DOWNTO 0);
		tout: buffer STD_LOGIC_VECTOR( 7 downto 0));
end;

architecture behave of bit_9_to_8 is 
begin
process(temperature)
begin
tout(0) <= temperature(0);
tout(1) <= temperature(1);
tout(2) <= temperature(2);
tout(3) <= temperature(3);
tout(4) <= temperature(4);
tout(5) <= temperature(5);
tout(6) <= temperature(6);
tout(7) <= temperature(7);

end process;
end behave;
