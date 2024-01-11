library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- INPUTS:
-- LOADLMASK, LOADRMASK, LOADDISPLAY, SHIFTL, SHIFTR (outputs of control logic entity)
-- CLK, LEFT, RIGHT
-- OUTPUT:
-- content of DISPLAY register
-- 
-- 
-- 
entity datapath is
    port(
        LOADLMASK, LOADRMASK, LOADDISPLAY: in std_logic;
        SHIFTL, SHIFTR: in std_logic;
        CLK: in std_logic;
        LEFT, RIGHT: in std_logic;
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end datapath;

architecture struct of datapath is

    -- initialization of output signals of the various components 
    signal signalLMASK, signalRMASK: std_logic_vector(7 downto 0);
    signal signalOR: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
begin

    -- LMASK register
    -- parallel-loaded initial value is given here (00000001)
    -- LOADLMASK is EN signal for ENDFFs in the register
    -- SHIFTL is the register's selector for its input
    -- signalLMASK is left shift register's output signal
    LMASKREG: entity work.ShiftLeftReg8(struct)
        port map(LOADLMASK,SHIFTL,CLK,"00000001",signalLMASK);

    -- RMASK register
    -- parallel-loaded initial value is given here (10000000)
    -- LOADRMASK is EN signal for ENDFFs in the register
    -- SHIFTR is the register's selector for its input
    -- signalRMASK is right shift register's output signal
    RMASKREG: entity work.ShiftRightReg8(struct)
        port map(LOADRMASK,SHIFTR,CLK,"10000000",signalRMASK);
    
    -- allows for overlap of both signals in the case that both RIGHT and LEFT is on
    -- signalOR is the OR gate's output
    ORGATE: entity work.ORGATE_8b(struct)
        port map(signalLMASK, signalRMASK, signalOR);

    -- MUX to select the input of the DISPLAY register
    -- parallel-loaded initial value is given here (00000000)
    -- IN0: "00000000"
    -- IN1: signalLMASK
    -- IN2: signalRMASK
    -- IN3: signalOR
    -- Sel1: LEFT
    -- Sel2: RIGHT
    -- signalMUX is the 4-to-1 mux's output
    MUX4to1: entity work.MUX4to1_8b(struct)
        port map("00000000", signalLMASK, signalRMASK, signalOR, LEFT, RIGHT, signalMUX);
    
    -- DISPLAY register
    -- LOADDISPLAY is EN signal for ENDFFs in the register
    -- signalMUX is the registers input
    DISPLAYREG: entity work.Reg_8b(struct)
        port map(LOADDISPLAY, CLK, signalMUX, OUTPUT);
end ;