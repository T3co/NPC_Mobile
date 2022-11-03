library ieee;
use ieee.std_logic_1164.all;

entity MT is
port ( number : in bit_vector (7 downto 0);
	   Ma0: buffer bit;
		Ma1: buffer bit;
		Mb0: buffer bit;
		Mb1: buffer bit);
end;

architecture behave of MT is 
begin 


MA0<=NUMBER(0);
MA1<=NUMBER(1);
MB0<=NUMBER(2);
MB1<=NUMBER(3);


end behave;