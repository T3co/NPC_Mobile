library ieee;
use ieee.std_logic_1164.all;
entity SPLITER is
port (data : in bit_vector(7 downto 0);
	  high,low : out bit_vector(3 downto 0));
end;
architecture behave of SPLITER is
begin
high<=data(7 downto 4);
low<=data(3 downto 0);

end behave;
