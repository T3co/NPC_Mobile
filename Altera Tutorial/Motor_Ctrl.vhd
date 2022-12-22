library ieee;
use ieee.std_logic_1164.all;
entity Motor_Ctrl is
port(PWM_Motor_1KHz: in bit;
		Motor_Bits: in bit_vector (2 downto 0);
		LwheelB: buffer bit;
		LwheelF: buffer bit;
		RwheelB: buffer bit;
		RwheelF: buffer bit);
end;
architecture behave of Motor_Ctrl is 
begin 
----------------------------------------------------------------------------------- Both wheels
process(PWM_Motor_1KHz,Motor_Bits)
begin
-------------------------------------------------------------------- no movement
if Motor_Bits = "000" then LwheelB <= '0'; LwheelF <= '0'; RwheelB <= '0'; RwheelF <= '0'; end if;

-------------------------------------------------------------------- forward
if Motor_Bits = "001" then LwheelB <= '0'; LwheelF <= PWM_Motor_1KHz; RwheelB <= '0'; RwheelF <= PWM_Motor_1KHz; end if;

-------------------------------------------------------------------- backward
if Motor_Bits = "010" then LwheelB <= PWM_Motor_1KHz; LwheelF <= '0'; RwheelB <= PWM_Motor_1KHz; RwheelF <= '0'; end if;

-------------------------------------------------------------------- right
if Motor_Bits = "011" then LwheelB <= '0'; LwheelF <= PWM_Motor_1KHz; RwheelB <= PWM_Motor_1KHz; RwheelF <= '0'; end if;

-------------------------------------------------------------------- left
if Motor_Bits = "100" then LwheelB <= PWM_Motor_1KHz; LwheelF <= '0'; RwheelB <= '0'; RwheelF <= PWM_Motor_1KHz; end if;


end process;
end behave;
		