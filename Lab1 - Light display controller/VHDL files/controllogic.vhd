library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- INPUTS:
-- RIGHT, LEFT, Gclock, Greset
-- OUTPUTS:
-- loadLMASK, loadRMASK, loadDISPLAY
-- leftshiftLMASK, rightshiftRMASK
-- 
-- Exact implementation of control logic ASM diagram
entity controllogic is
	port(
		RIGHT, LEFT: in std_logic;
		Gclock: in std_logic;
		Greset: in std_logic;
		loadLMASK: out std_logic;
		loadRMASK: out std_logic;
		loadDISPLAY: out std_logic;
		leftshiftLMASK: out std_logic;
		rightshiftRMASK: out std_logic
	);
end controllogic;


architecture structural of controllogic is
	
    -- initialization of output signals of DFFs 
    signal S0, S0_bar: std_logic;
	signal S1, S1_bar: std_logic;
	signal S2, S2_bar: std_logic;
	signal S3, S3_bar: std_logic;
	signal S4, S4_bar: std_logic;
		
    -- Initialization of EN signal for each DFF (state)
	signal not_greset: std_logic;
	signal  LEFT_and_RIGHT: std_logic;
	signal  LEFT_and_not_RIGHT: std_logic;
	signal  not_LEFT_and_RIGHT: std_logic;
	signal  not_LEFT_and_not_RIGHT: std_logic;


begin

    -- assign values to EN signal for each DFF
    -- these signals are the DFF's inputs in the ASM control logic 

    -- EN signal for State 0
    not_greset <= not(greset);

    -- EN signal for State 1
    LEFT_and_RIGHT <= LEFT and RIGHT and s0;

    -- EN signal for State 2
    LEFT_and_not_RIGHT <= LEFT and not(RIGHT) and s0;

    -- EN signal for State 3
    not_LEFT_and_RIGHT <= not(LEFT) and RIGHT and s0;

    -- EN signal for State 4
    not_LEFT_and_not_RIGHT <= not(LEFT) and not(RIGHT) and s0;
        
    -- State 0 DFF
    DFF0: entity work.enARdFF_2(struct)
        port map(S0, Greset, '1', Gclock, S0, S0_bar);

    -- State 1 DFF
	DFF1: entity work.enARdFF_2(struct)
        port map(S0, LEFT_and_RIGHT, '1', Gclock, S1, S1_bar);

    -- State 2 DFF
	DFF2: entity work.enARdFF_2(struct)
        port map(S0, LEFT_and_not_RIGHT, '1', Gclock, S2, S2_bar);

    -- State 3 DFF
	DFF3: entity work.enARdFF_2(struct)
        port map(S0, not_LEFT_and_RIGHT, '1', Gclock, S3, S3_bar);

    -- State 4 DFF
	DFF4: entity work.enARdFF_2(struct)
        port map(S0, not_LEFT_and_not_RIGHT, '1', Gclock, S4, S4_bar);

    -- assign values to control logic outputs
	loadLMASK <= S0;
	loadRMASK <= S0;
	loadDISPLAY <= '1';
	leftshiftLMASK <= S1 or S2;
	rightshiftRMASK <= S1 or S3;
end;