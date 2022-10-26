library ieee;
use ieee.std_logic_1164.all;

entity fb2bin is
port ( number : in bit_vector (7 downto 0);
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
	if number = "00000000" then Ma0 <= '0'; end if;
	if number = "00000000" then Ma1 <= '0'; end if;
	if number = "00000000" then Mb0 <= '0'; end if;
	if number = "00000000" then Mb1 <= '0'; end if;
	------------------------------------- 0101 forwards
	if number = "00000101" then Ma0 <= '0'; end if;
	if number = "00000101" then Ma1 <= '1'; end if;
	if number = "00000101" then Mb0 <= '0'; end if;
	if number = "00000101" then Mb1 <= '1'; end if;
	------------------------------------- 1010 backwards
	if number = "00001010" then Ma0 <= '1'; end if;
	if number = "00001010" then Ma1 <= '0'; end if;
	if number = "00001010" then Mb0 <= '1'; end if;
	if number = "00001010" then Mb1 <= '0'; end if;
	------------------------------------- 0110 right
	if number = "00000110" then Ma0 <= '0'; end if;
	if number = "00000110" then Ma1 <= '1'; end if;
	if number = "00000110" then Mb0 <= '1'; end if;
	if number = "00000110" then Mb1 <= '0'; end if;
	------------------------------------- 1001 left
	if number = "00001001" then Ma0 <= '1'; end if;
	if number = "00001001" then Ma1 <= '0'; end if;
	if number = "00001001" then Mb0 <= '0'; end if;
	if number = "00001001" then Mb1 <= '1'; end if;
 end process;

end behave;