------------------------------------------------------------------------------- 
library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
entity my_rX is 
port ( rst,clk : in bit;
	   data_out : out bit_vector ( 7 downto 0);
	   rx_ser_in : in bit;
	   rx_ready : out bit);

end ; 
architecture behave of my_rX is 
signal cnt  :integer  range 0 to 160; 
signal buf : bit_vector ( 7 downto 0);
signal start,clr,startb,stopb : bit;
begin
process (rx_ser_in,rst,clr)
begin
if rst='1' or clr='1' then start<='0';
	elsif rx_ser_in'event and rx_ser_in='0' then 
			start<='1';
   end if;
end process;

process(CLK,clr,rst) 
begin 
if rst = '1' or clr='1' then 
cnt<=0;
buf<="00000000";
rx_ready <='0';
elsif clk'event and clk='1' then
	if start='1'  then
		if cnt<160 then cnt<=cnt+1; else cnt<=0; end if;
			if        cnt=8        then    startb<=rx_ser_in;
			elsif     cnt=24       then buf(0)<=rx_ser_in;     
		    elsif     cnt=40       then buf(1)<=rx_ser_in;     
		    elsif     cnt=56       then buf(2)<=rx_ser_in;     
		    elsif     cnt=72       then buf(3)<=rx_ser_in;     
		    elsif     cnt=88       then buf(4)<=rx_ser_in;     
		    elsif     cnt=104      then buf(5)<=rx_ser_in;     
		    elsif     cnt=120      then buf(6)<=rx_ser_in;     
		    elsif     cnt=136      then buf(7)<=rx_ser_in;     
			elsif     cnt=152      then stopb<=rx_ser_in;
		    elsif     cnt=155 and startb='0' and stopb='1' then data_out<=buf;
		    elsif     cnt=159      then rx_ready<='1';
            end if;
	end if;
end if;
end process;
clr<='1' when cnt=160 else '0';
end behave; 

