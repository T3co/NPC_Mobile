library ieee;
use ieee.std_logic_1164.all;

entity fb2bin is
port ( number : in integer range 0 to 4;
	   Ma0: buffer bit;
		Ma1: buffer bit;
		Mb0: buffer bit;
		Mb1: buffer bit);
end;

architecture behave of fb2bin is 
begin 
	process (number)
	begin
	
	------------------------------------- 0000 stop
	if number = 0 then Ma0 <= '0'; end if;
	if number = 0 then Ma1 <= '0'; end if;
	if number = 0 then Mb0 <= '0'; end if;
	if number = 0 then Mb1 <= '0'; end if;
	------------------------------------- 0101 forwards
	if number = 1 then Ma0 <= '0'; end if;
	if number = 1 then Ma1 <= '1'; end if;
	if number = 1 then Mb0 <= '0'; end if;
	if number = 1 then Mb1 <= '1'; end if;
	------------------------------------- 1010 backwards
	if number = 2 then Ma0 <= '1'; end if;
	if number = 2 then Ma1 <= '0'; end if;
	if number = 2 then Mb0 <= '1'; end if;
	if number = 2 then Mb1 <= '0'; end if;
	------------------------------------- 0110 right
	if number = 3 then Ma0 <= '0'; end if;
	if number = 3 then Ma1 <= '1'; end if;
	if number = 3 then Mb0 <= '1'; end if;
	if number = 3 then Mb1 <= '0'; end if;
	------------------------------------- 1001 left
	if number = 4 then Ma0 <= '1'; end if;
	if number = 4 then Ma1 <= '0'; end if;
	if number = 4 then Mb0 <= '0'; end if;
	if number = 4 then Mb1 <= '1'; end if;
 end process;

end behave;