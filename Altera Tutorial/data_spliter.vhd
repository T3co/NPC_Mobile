library ieee;
use ieee.std_logic_1164.all;
entity data_spliter is
port (data : in bit_vector(7 downto 0);
	  motor : out bit_vector(3 downto 0);
		led : out bit_vector(4 downto 3);
		TBA : out bit_vector(7 downto 4));
end;
architecture behave of data_spliter is
begin
motor<=data(3 downto 0);
led<=data(4 downto 3);
TBA<=data(7 downto 4);

end behave;
