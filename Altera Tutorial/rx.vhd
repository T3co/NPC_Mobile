library ieee;
use ieee.std_logic_1164.all;
entity rx is
port ( clk ,si : in bit;
       data : out bit_vector(7 downto 0));
end ;
architecture behave of rx is
signal start : bit; -- flag fpr starting recieving -- 
signal cnt:  integer range 0 to 160; -- 16X10
signal clr,start_bit,stop_bit : bit;
signal tmp :  bit_vector(7 downto 0);
begin
----------------------- 
process ( clr, si )
begin
if clr='1' then start<='0';
elsif si'event and si='0' then   start<='1'; --- checking start bit
end if;
end process;
----------------------------
process ( clr,clk)
begin
if  clr='1' then cnt<=0;
elsif clk'event and clk='1' then
if start='1' then
if cnt<160 then cnt<=cnt+1; else cnt<=0; end if;
if cnt=8 then start_bit<=si;
elsif cnt=24 then tmp(0)<=si; -- LSB
elsif cnt=40 then tmp(1)<=si;
elsif cnt=56 then tmp(2)<=si;
elsif cnt=72 then tmp(3)<=si;
elsif cnt=88 then tmp(4)<=si;
elsif cnt=104 then tmp(5)<=si;
elsif cnt=120 then tmp(6)<=si;
elsif cnt=136 then tmp(7)<=si;
elsif cnt=152 then stop_bit<=si;
elsif cnt=155  and start_bit='0' and stop_bit='1' then data<=tmp;
end if;
end if;
end if;
end process;
clr<='1' when cnt=160 else '0';
end behave;
