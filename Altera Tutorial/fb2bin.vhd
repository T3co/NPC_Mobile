library ieee;
use ieee.std_logic_1164.all;

entity fb2bin is
port ( CLK: IN BIT;
		number : in bit_vector (7 downto 0);
	   Ma0: buffer bit;
		Ma1: buffer bit;
		Mb0: buffer bit;
		Mb1: buffer bit);
end;


architecture behave of fb2bin is ד
SIGNAL DATA :  bit_vector (7 downto 0);
begin 

PROCESS (CLK)
BEGIN
IF CLK'EVENT AND CLK='1' THEN
DATA<=NUMBER;
END IF;
END PROCESS;





	process (CLK)
	begin
	IF CLK'EVENT AND CLK='1' THEN
	  IF    DATA="00000000" THEN 
			MA0<='0'; MA1<='0'; MB0<='0'; MB1<='0';
	  ELSIF DATA="00000001" THEN
			MA0<='0'; MA1<='1'; MB0<='0'; MB1<='1';
     ELSIF DATA="00000010" THEN
			MA0<='1'; MA1<='0'; MB0<='1'; MB1<='0';
	  ELSIF DATA="00000011" THEN
			MA0<='1'; MA1<='0'; MB0<='0'; MB1<='1';
	  ELSIF DATA="00000100" THEN
			MA0<='0'; MA1<='1'; MB0<='1'; MB1<='0';
			
			
			
			
	END IF;
	
	
	END IF;
	
	
	
	
	
	
	
	
 end process;

end behave;