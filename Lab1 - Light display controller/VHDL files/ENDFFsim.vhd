library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbenchENDFF is
end testbenchENDFF;

architecture test of testbenchENDFF is
    signal D: std_logic := '0';
    signal EN: std_logic := '0';
    signal CLK: std_logic;
    signal Q: std_logic;
begin
    endff: entity work.ENDFF(struct)
        port map(D, EN, CLK, Q);  
    
    -- clock
    CLK_process: process is
    begin
        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;

    D <= '1' after 100 ns;
    EN <= '1' after 200 ns;
end;
