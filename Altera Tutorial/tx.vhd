library ieee;
use ieee.std_logic_1164.all;
entity tx is
port (clk: in bit;
      data : in bit_vector(7 downto 0);
      so : out bit);
end;
architecture behave of tx is
signal cnt : integer range 0 to 160;
signal clr : bit;
begin
process (clk)
begin
if clr='1' then cnt<=0; so<='1';
elsif clk'event and clk='1' then 
if cnt<160 then cnt<=cnt+1; else cnt<=0; end if;
if cnt<16 then so<='0'; -- start bit
elsif cnt<32 then so<=data(0); -- lsb
elsif cnt<48 then so<=data(1);
elsif cnt<64 then so<=data(2);
elsif cnt<80 then so<=data(3);
elsif cnt<96 then so<=data(4);
elsif cnt<112 then so<=data(5);
elsif cnt<128 then so<=data(6);
elsif cnt<144 then so<=data(7); -- msb
elsif cnt<160 then so<='1'; -- stop bit
end if;
end if;
end process;
clr <='1' when cnt=160 else '0';
end behave;
