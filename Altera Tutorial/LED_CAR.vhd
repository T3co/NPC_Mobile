Library ieee;
use ieee.std_logic_1164.all;

entity LED_CAR is 
port( checkBox: in bit_vector(7 downto 0);
		Lout: out bit);
end;
architecture behave of LED_CAR is 
begin 
process(checkBox)
begin
if checkBox <= "00000001" then Lout <= '0'; else Lout <= '1';
end if;
end process;
end behave;
					