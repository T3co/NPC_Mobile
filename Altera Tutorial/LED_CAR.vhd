Library ieee;
use ieee.std_logic_1164.all;

entity LED_CAR is 
port( Leds: in bit_vector(4 downto 3);
		Lout: out bit);
end;
architecture behave of LED_CAR is 
begin 
process(Leds)
begin
if Leds <= "1" then Lout <= '0'; else Lout <= '1';
end if;
end process;
end behave;
					