library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ARShiftReg_8b is
 Port (
    LOAD, SHIFTR, CLK: in std_logic;
    INPUT: in std_logic_vector(7 downto 0);
    OUTPUT: out std_logic_vector(7 downto 0);
    ASout: out std_logic
 );
end ARShiftReg_8b;

architecture struct of ARShiftReg_8b is
    signal signalENDFF: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
    signal signalQshift: std_logic_vector(7 downto 0);
begin

    -- Shift signal logic
    signalQshift(6 downto 0) <= signalENDFF(7 downto 1);
    signalQshift(7) <= '1';

    ENDFF_0: entity work.ENDFF(struct)
        port map(signalMUX(0), LOAD, CLK, signalENDFF(0));
    ENDFF_1: entity work.ENDFF(struct)
        port map(signalMUX(1), LOAD, CLK, signalENDFF(1));
    ENDFF_2: entity work.ENDFF(struct)
        port map(signalMUX(2), LOAD, CLK, signalENDFF(2));
    ENDFF_3: entity work.ENDFF(struct)
        port map(signalMUX(3), LOAD, CLK, signalENDFF(3));
    ENDFF_4: entity work.ENDFF(struct)
        port map(signalMUX(4), LOAD, CLK, signalENDFF(4));
    ENDFF_5: entity work.ENDFF(struct)
        port map(signalMUX(5), LOAD, CLK, signalENDFF(5));
    ENDFF_6: entity work.ENDFF(struct)
        port map(signalMUX(6), LOAD, CLK, signalENDFF(6));
    ENDFF_7: entity work.ENDFF(struct)
        port map(signalMUX(7), LOAD, CLK, signalENDFF(7));
    
    -- SHIFTL is the select to determine the register's input
    -- OUTPUT <= left shifted signal if SHIFTR is 1
    -- OUTPUT <= INPUT signal if SHIFTR is 0
    MUX2to1_8b: entity work.MUX2to1_8b(struct)
    port map(INPUT, signalQshift, SHIFTR, signalMUX);
    
        OUTPUT <= signalENDFF;
    ASout <= signalENDFF(0);
end ;
