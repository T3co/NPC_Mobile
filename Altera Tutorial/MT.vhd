library ieee;
use ieee.std_logic_1164.all;

entity MT is
port (s1: in bit;
		s2: in bit;
		s3: in bit;
		s4: in bit;
	   Ma0: buffer bit;
		Ma1: buffer bit;
		Mb0: buffer bit;
		Mb1: buffer bit);
end;

architecture behave of MT is 
begin 

	MA0<=s1;
	MA1<=s2;
	
	MB0<=s3;
	MB1<=s4;

end behave;