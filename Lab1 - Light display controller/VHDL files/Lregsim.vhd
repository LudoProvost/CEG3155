library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbenchlreg is
end testbenchlreg;

architecture test of testbenchlreg is
    signal loadLMASK: std_logic := '1';
    signal SHIFTL: std_logic := '0';
    signal CLK: std_logic;
    signal output: std_logic_vector(7 downto 0);
begin

    lreg: entity work.ShiftLeftReg8(struct)
        port map(loadLMASK, SHIFTL, CLK, "00000001", OUTPUT);
    
    -- clock
    CLK_process: process is
    begin
        CLK <= '1';
        wait for 50 ns;
        CLK <= '0';
        wait for 50 ns;
    end process;
    
    SHIFTL <= '1' after 100 ns;
        

end;
