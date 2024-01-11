library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbenchDFFCUSTOM is
end testbenchDFFCUSTOM;

architecture test of testbenchDFFCUSTOM is
    signal D: std_logic := '0';
    signal CLK: std_logic;
    signal Q: std_logic;
    signal Q_bar: std_logic;
begin

    endff: entity work.DFF_custom(struct)
        port map(D, CLK, Q, Q_bar);
        
    -- clock
    CLK_process: process is
    begin
        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;
    
    
    D <= '1' after 100 ns;


end;
