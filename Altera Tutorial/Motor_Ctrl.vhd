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
process(PWM_Motor_1KHz,Ma0,Ma1)-- Left wheel
begin
if Ma0 = '0' then if Ma1 = '0' then LwheelF <= '0'; -- no movement
end if; 
end if;
if Ma0 = '0' then if Ma1 = '0' then Lwheelb <= '0'; -- no movement
end if; 
end if;

if Ma0 = '0' then if Ma1 = '1' then LwheelF <= PWM_Motor_1KHz; -- forward
end if; 
end if;
if Ma0 = '0' then if Ma1 = '1' then LwheelB <= '0'; -- forward
end if; 
end if;


if Ma0 = '1' then if Ma1 = '0' then LwheelF <= '0'; -- backward
end if; 
end if;
if Ma0 = '1' then if Ma1 = '0' then LwheelB <= PWM_Motor_1KHz; -- backward
end if; 
end if;

if Ma0 = '1' then if Ma1 = '1' then LwheelF <= '0'; -- no movement
end if; 
end if;
if Ma0 = '1' then if Ma1 = '1' then LwheelB <= '0'; -- no movement
end if; 
end if;
end process;

process(PWM_Motor_1KHz,Mb0,Mb1)-- Right wheel
begin
if Mb0 = '0' then if Mb1 = '0' then RwheelF <= '0'; -- no movement
end if; 
end if;
if Mb0 = '0' then if Mb1 = '0' then RwheelB <= '0'; -- no movement
end if; 
end if;

if Mb0 = '0' then if Mb1 = '1' then RwheelF <= PWM_Motor_1KHz ; -- forward
end if; 
end if;
if Mb0 = '0' then if Mb1 = '1' then RwheelB <= '0' ; -- forward
end if; 
end if;

if Mb0 = '1' then if Mb1 = '0' then RwheelF <= '0'; -- backward
end if; 
end if;

if Mb0 = '1' then if Mb1 = '0' then RwheelB <= PWM_Motor_1KHz; -- backward
end if; 
end if;

if Mb0 = '1' then if Mb1 = '1' then RwheelF <= '0'; -- no movement
end if; 
end if;
if Mb0 = '1' then if Mb1 = '1' then RwheelB <= '0'; -- no movement
end if; 
end if;
end process;

end behave;
		