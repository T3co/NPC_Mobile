Library ieee;
use ieee.std_logic_1164.all;

entity LED_CAR is 
port( Leds: in bit;
		Lout: out bit);
end;
architecture behave of LED_CAR is 
begin 
process(Leds)
begin
if Leds = '1' then Lout <= '1'; else Lout <= '0';
end if;
end process;
end behave;
					