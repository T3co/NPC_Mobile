library ieee;
use ieee.std_logic_1164.all;
entity rx is
port (clk,rst,si : in bit;
      data : out bit_vector(7 downto 0));
end;
architecture behave of rx is
signal clr,start_bit,stop_bit:bit;
signal temp : bit_vector( 7 downto 0);
signal cnt: integer range 0 to 160;
signal START : bit; -- flag
begin
--------------  waiting for srart bit process ----------------
process (clr,rst,si)
begin
if rst='1' or clr='1' then  START<='0';
elsif si'event and si='0' then -- waiting for srart bit
START<='1';
end if;
end process;
------------------- get the bits ------------
process (clr,rst,clk)
begin
if rst='1' or clr='1' then cnt<=0;
elsif clk'event and clk='1' then
	if START='1' then
		if cnt<160 then cnt<=cnt+1; else cnt<=0; end if;
		if cnt=8 then start_bit<=si;
		elsif cnt=24 then temp(0)<=si; -- lsb
		elsif cnt=40 then temp(1)<=si;
		elsif cnt=56 then temp(2)<=si;
		elsif cnt=72 then temp(3)<=si;
		elsif cnt=88 then temp(4)<=si;
		elsif cnt=104 then temp(5)<=si;
		elsif cnt=120 then temp(6)<=si;
		elsif cnt=136 then temp(7)<=si;
		elsif cnt=152 then stop_bit<=si;
		elsif cnt=157 then 
			if start_bit='0' and stop_bit='1' then data<=temp; end if;
		end if;
	end if;
end if;
end process;
clr<='1' when cnt=159 else '0';
end behave;
