Library ieee;
use ieee.std_logic_1164.all;

entity Laser_Bit is 
port( Leds: in bit;
		Lout: out bit);
end;
architecture behave of Laser_Bit is 
begin 
process(Leds)
begin
if Leds = '1' then Lout <= '1'; else Lout <= '0';
end if;
end process;
end behave;
					