library ieee;
use ieee.std_logic_1164.all;
entity my_tx is
port (clk,rst: in bit;
      di : in bit_vector(7 downto 0);
      so : out bit);
end;
architecture behave of my_tx is
signal cnt : integer range 0 to 160;
signal clr : bit;
begin
process (clk,rst)
begin
if rst='1' or clr='1' then cnt<=0; so<='1';
elsif clk'event and clk='1' then 
if cnt<160 then cnt<=cnt+1; else cnt<=0; end if;
if cnt<16 then so<='0'; -- start bit
elsif cnt<32 then so<=di(0); -- LSB
elsif cnt<48 then so<=di(1);
elsif cnt<64 then so<=di(2);
elsif cnt<80 then so<=di(3);
elsif cnt<96 then so<=di(4);
elsif cnt<112 then so<=di(5);
elsif cnt<128 then so<=di(6);
elsif cnt<144 then so<=di(7); -- MSB
elsif cnt<160 then so<='1'; -- stop bit
end if;
end if;
end process;
clr <='1' when cnt=160 else '0';
end behave;