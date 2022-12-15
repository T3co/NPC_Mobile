library ieee;
use ieee.std_logic_1164.all;
entity data_spliter is
port (data : in bit_vector(7 downto 0);
	  motor : out bit_vector(3 downto 0);
		servo : out bit_vector(7 downto 5);
		Laser : out bit);
end;
architecture behave of data_spliter is
begin
motor<=data(3 downto 0);
servo<=data(7 downto 5);
Laser<=data(4);

end behave;
