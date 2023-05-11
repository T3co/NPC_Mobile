library ieee; 
use ieee.std_logic_1164.all; 
 
entity rx is 
    port (
        clk: in bit; 
        si: in bit; -- serial in
        do: out bit_vector(7 downto 0) -- data out
    ); 
end; 
 
architecture behave of rx is 
    signal clr, start_bit, stop_bit: bit; 
    signal temp: bit_vector(7 downto 0); 
    signal cnt: integer range 0 to 160; -- 16 * 10
    signal START: bit; -- start flag 

    begin 
    ------  waiting for start bit process ------
        process (clr, si)
        begin
            if clr = '1' then START <= '0';
            elsif si'event and si = '0' then START <= '1'; -- waiting for start bit
            end if;
        end process;

    ------ get the bits ------
        process (clr, clk)
        begin
            if clr = '1' then cnt <= 0;
            elsif clk'event and clk = '1' then
                if START = '1' then
                    if cnt < 160 then cnt <= cnt + 1;
                    else cnt <= 0;
                    end if;

                    if cnt = 8 then start_bit <= si; -- start bit
                    elsif cnt = 24 then temp(0) <= si; -- lsb
                    elsif cnt = 40 then temp(1) <= si;
                    elsif cnt = 56 then temp(2) <= si;
                    elsif cnt = 72 then temp(3) <= si;
                    elsif cnt = 88 then temp(4) <= si;
                    elsif cnt = 104 then temp(5) <= si;
                    elsif cnt = 120 then temp(6) <= si;
                    elsif cnt = 136 then temp(7) <= si; -- msb
                    elsif cnt = 152 then stop_bit <= si; -- stop bit
                    elsif cnt = 155 then
                        if start_bit = '0' and stop_bit = '1' then
                            do <= temp;
                        end if;
                    end if;
                end if;
            end if;
        end process;

    clr <= '1' when cnt = 160 else '0'; -- outside of process, always running
end behave;
