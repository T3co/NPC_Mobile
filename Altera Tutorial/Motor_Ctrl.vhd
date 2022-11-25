library ieee;
use ieee.std_logic_1164.all;
entity Motor_Ctrl is
port(PWM_Motor_1KHz: in bit;
		Ma0: in bit;
		Ma1: in bit;
		Mb0: in bit;
		Mb1: in bit;
		LwheelB: buffer bit;
		LwheelF: buffer bit;
		RwheelB: buffer bit;
		RwheelF: buffer bit);
end;
architecture behave of Motor_Ctrl is 
begin 
----------------------------------------------------------------------------------- Both wheels
process(PWM_Motor_1KHz,Ma0,Ma1,Mb0,Mb1)
begin
-------------------------------------------------------------------- no movement
if Ma0 = '0' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '0' then LwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '0' then LwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '0' then RwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '0' then RwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
-------------------------------------------------------------------- forward
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '0' then if Mb1 = '1' then LwheelF <= PWM_Motor_1KHz; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '0' then if Mb1 = '1' then RwheelF <= PWM_Motor_1KHz; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '0' then if Mb1 = '1' then LwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '0' then if Mb1 = '1' then RwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
-------------------------------------------------------------------- backward
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '1' then if Mb1 = '0' then RwheelB <= PWM_Motor_1KHz;  
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '1' then if Mb1 = '0' then LwheelB <= PWM_Motor_1KHz;  
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '1' then if Mb1 = '0' then RwheelF <= '0';  
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '1' then if Mb1 = '0' then LwheelF <= '0';  
end if; 
end if;
end if; 
end if;
-------------------------------------------------------------------- right
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '0' then LwheelF <= PWM_Motor_1KHz;   
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '0' then RwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '0' then RwheelB <= PWM_Motor_1KHz; 
end if; 
end if;
end if; 
end if;
-------------------------------------------------------------------- left
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '1' then RwheelF <= PWM_Motor_1KHz; 
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '1' then LwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then if Mb0 = '0' then if Mb1 = '1' then LwheelB <= PWM_Motor_1KHz; 
end if; 
end if;
end if; 
end if;
-------------------------------------------------------------------- no movement
if Ma0 = '1' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '1' then LwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '1' then LwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '1' then RwheelF <= '0'; 
end if; 
end if;
end if; 
end if;
if Ma0 = '1' then if Ma1 = '1' then if Mb0 = '1' then if Mb1 = '1' then RwheelB <= '0'; 
end if; 
end if;
end if; 
end if;
end process;
end behave;
		