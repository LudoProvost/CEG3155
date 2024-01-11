library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapathsim is
end datapathsim;

architecture test of datapathsim is
    signal LEFT, RIGHT, loadLMASK, loadRMASK, loadDISPLAY, SHIFTR: std_logic;
    signal SHIFTL: std_logic := '0';
    signal CLK: std_logic;
    signal output: std_logic_vector(7 downto 0);
begin
    datapath: entity work.datapath(struct)
        port map(loadLMASK, loadRMASK, loadDISPLAY, SHIFTL, SHIFTR, CLK, LEFT, RIGHT, output);
    
    -- clock
    CLK_process: process is
    begin
        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;
    
    -- initialize datapath inputs
    LEFT <= '1';
    RIGHT <= '0';
    loadLMASK <= '1';
    loadRMASK <= '0';
    loadDISPLAY <= '1';
    SHIFTL <= '1' after 100 ns;
    SHIFTR <= '0';

end;
