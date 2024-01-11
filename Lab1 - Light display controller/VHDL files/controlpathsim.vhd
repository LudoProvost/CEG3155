library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlpathsim is
end controlpathsim;

architecture test of controlpathsim is
    signal LEFT, RIGHT, GReset, loadLMASK, loadRMASK, loadDISPLAY, SHIFTL, SHIFTR: std_logic;
    signal CLK: std_logic;
begin

    -- initialize control logic inputs
    LEFT <= '1';
    RIGHT <= '0';
    GReset <= '1';


    controllogic: entity work.controllogic(structural)
        port map(RIGHT, LEFT, CLK, GReset, loadLMASK, loadRMASK, loadDISPLAY, SHIFTL, SHIFTR);
    
    -- clock
    CLK_process: process is
    begin
        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
end;
