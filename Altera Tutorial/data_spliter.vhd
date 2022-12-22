library ieee;
use ieee.std_logic_1164.all;
entity data_spliter is
port (data : in bit_vector(7 downto 0);
		motor : out bit_vector(2 downto 0);
		servo : out bit_vector(5 downto 3);
		speedMotor : out bit;
		Laser : out bit);
end;
architecture behave of data_spliter is
begin
motor<=data(2 downto 0);
servo<=data(6 downto 4);
speedMotor<=data(6);
Laser<=data(7);

end behave;
