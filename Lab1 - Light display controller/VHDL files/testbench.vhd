library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture test of testbench is
    signal LEFT, RIGHT, GReset, loadLMASK, loadRMASK, loadDISPLAY: std_logic;
    signal SHIFTL: std_logic;
    signal SHIFTR: std_logic;
    signal CLK: std_logic;
    signal output: std_logic_vector(7 downto 0);
begin

    -- clock
    CLK_process: process is
    begin

        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;
        
    -- simulates the board's switches
    LEFT <= '1';
    RIGHT <= '0';
    GReset <= '1';


    controllogic: entity work.controllogic(structural)
        port map(RIGHT, LEFT, CLK, GReset, loadLMASK, loadRMASK, loadDISPLAY, SHIFTL, SHIFTR);

    
    datapath: entity work.datapath(struct)
        port map(loadLMASK, loadRMASK, loadDISPLAY, SHIFTL, SHIFTR, CLK, LEFT, RIGHT, output);

end;