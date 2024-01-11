library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2to1 is
    port(
        IN1, IN2: in std_logic;
        Sel: in std_logic;
        OUT1: out std_logic
    );
end MUX2to1;

architecture struct OF MUX2to1 is
begin
    OUT1 <= ((IN1 and not(Sel)) or (IN2 and Sel));
end struct;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF_custom IS
	PORT(
		i_d		: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END DFF_custom;

ARCHITECTURE struct OF DFF_custom IS
	SIGNAL int_q : STD_LOGIC;

BEGIN

    oneBitRegister:
    PROCESS(i_clock)
    BEGIN
        IF (i_clock'EVENT and i_clock = '1') THEN
            int_q	<=	i_d;
        END IF;
    END PROCESS oneBitRegister;

	--  Output Driver

	o_q		<=	int_q;
	o_qBar		<=	not(int_q);

END struct;



-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;

-- entity DFF_8b is
--     port(
--         D: in std_logic_vector(7 downto 0);
--         CLK: in std_logic;
--         Q, Q_bar: out std_logic_vector(7 downto 0)
--     );
-- end DFF_8b;

-- architecture struct OF DFF_8b is
--     signal signalQ: std_logic_vector(7 downto 0);
--     signal signalQ_bar: std_logic_vector(7 downto 0);
-- begin
--     Q <= signalQ;
--     Q_bar <= signalQ_bar;
--     signalQ(7) <= not(signalQ_bar(7) and not(D(7) and CLK));
--     signalQ(6) <= not(signalQ_bar(6) and not(D(6) and CLK));
--     signalQ(5) <= not(signalQ_bar(5) and not(D(5) and CLK));
--     signalQ(4) <= not(signalQ_bar(4) and not(D(4) and CLK));
--     signalQ(3) <= not(signalQ_bar(3) and not(D(3) and CLK));
--     signalQ(2) <= not(signalQ_bar(2) and not(D(2) and CLK));
--     signalQ(1) <= not(signalQ_bar(1) and not(D(1) and CLK));
--     signalQ(0) <= not(signalQ_bar(0) and not(D(0) and CLK));
--     signalQ_bar(7) <= not(signalQ(7) and not(not(D(7)) and CLK));
--     signalQ_bar(6) <= not(signalQ(6) and not(not(D(6)) and CLK));
--     signalQ_bar(5) <= not(signalQ(5) and not(not(D(5)) and CLK));
--     signalQ_bar(4) <= not(signalQ(4) and not(not(D(4)) and CLK));
--     signalQ_bar(3) <= not(signalQ(3) and not(not(D(3)) and CLK));
--     signalQ_bar(2) <= not(signalQ(2) and not(not(D(2)) and CLK));
--     signalQ_bar(1) <= not(signalQ(1) and not(not(D(1)) and CLK));
--     signalQ_bar(0) <= not(signalQ(0) and not(not(D(0)) and CLK));
-- end struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity ENDFF is
--    port(
--        D: in std_logic;
--        EN: in std_logic;
--        CLK: in std_logic;
--        Q: out std_logic
--    );
--end ENDFF;

--architecture struct OF ENDFF is
--    signal signalMUX: std_logic;
--    signal signalQ: std_logic := '0';
--    signal signalQ_bar: std_logic;
--begin
--    Q <= signalQ;
--    signalQ_bar <= not(signalQ);
--    mux1: entity work.MUX2to1(struct)
--        port map(signalQ,D,EN,signalMUX);
--    DFF1: entity work.DFF_custom(struct)
--        port map(signalMUX, CLK, signalQ, signalQ_bar);
--end struct;


ENTITY ENDFF IS
	PORT(
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q	: OUT	STD_LOGIC);
END ENDFF;

ARCHITECTURE struct OF ENDFF IS
	SIGNAL int_q : STD_LOGIC := '0';
    SIGNAL o_qBar : STD_LOGIC;
BEGIN

    oneBitRegister:
    PROCESS(i_clock)
    BEGIN
        IF (i_clock'EVENT and i_clock = '1') THEN
            IF (i_enable = '1') THEN
                int_q	<=	i_d;
            END IF;
        END IF;
    END PROCESS oneBitRegister;

	--  Output Driver

	o_q		<=	int_q;
	o_qBar		<=	not(int_q);

END struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2to1_8b is
    port(
        IN1, IN2: in std_logic_vector(7 downto 0);
        Sel: in std_logic;
        OUT1: out std_logic_vector(7 downto 0)
    );
end MUX2to1_8b;

architecture struct OF MUX2to1_8b is
begin
    OUT1(7) <= ((IN1(7) and not(Sel)) or (IN2(7) and Sel));
    OUT1(6) <= ((IN1(6) and not(Sel)) or (IN2(6) and Sel));
    OUT1(5) <= ((IN1(5) and not(Sel)) or (IN2(5) and Sel));
    OUT1(4) <= ((IN1(4) and not(Sel)) or (IN2(4) and Sel));
    OUT1(3) <= ((IN1(3) and not(Sel)) or (IN2(3) and Sel));
    OUT1(2) <= ((IN1(2) and not(Sel)) or (IN2(2) and Sel));
    OUT1(1) <= ((IN1(1) and not(Sel)) or (IN2(1) and Sel));
    OUT1(0) <= ((IN1(0) and not(Sel)) or (IN2(0) and Sel));
end struct;


-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;

-- entity ENDFF_8b is
--     port(
--         D: in std_logic_vector(7 downto 0);
--         EN: in std_logic;
--         CLK: in std_logic;
--         Q: out std_logic_vector(7 downto 0)
--     );
-- end ENDFF_8b;

-- architecture struct OF ENDFF_8b is
--     signal signalMUX: std_logic_vector(7 downto 0);
--     signal signalQ: std_logic_vector(7 downto 0);
--     signal signalQ_bar: std_logic_vector(7 downto 0);
-- begin
--     Q <= signalQ;
--     signalQ_bar <= not(signalQ);
--     mux: entity work.MUX2to1_8b(struct)
--         port map(signalQ,D,EN,signalMUX);
--     DFF: entity work.DFF_8b(struct)
--         port map(signalMUX, CLK, signalQ, signalQ_bar);
-- end struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX4to1_8b is
    port(
        IN0, IN1, IN2, IN3: in std_logic_vector(7 downto 0);
        Sel1, Sel2: in std_logic;
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end MUX4to1_8b;

architecture struct of MUX4to1_8b is
    signal signalMUX1, signalMUX2: std_logic_vector(7 downto 0);
begin
    MUX1: entity work.MUX2to1_8b(struct)
        port map(IN0, IN1, Sel1, signalMUX1);
    MUX2: entity work.MUX2to1_8b(struct)
        port map(IN2, IN3, Sel1, signalMUX2);
    MUX3: entity work.MUX2to1_8b(struct)
        port map(signalMUX1, signalMUX2, Sel2, OUTPUT);
end ;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftLeftReg8 is
    port(
        LOAD: in std_logic;
        SHIFTL: in std_logic;
        CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end ShiftLeftReg8;

architecture struct OF ShiftLeftReg8 is
    signal signalENDFF: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
    signal signalQshift: std_logic_vector(7 downto 0);
begin
    signalQshift(7 downto 1) <= signalENDFF(6 downto 0);
    signalQshift(0) <= signalENDFF(7);

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
    MUX2to1_8b: entity work.MUX2to1_8b(struct)
        port map(INPUT, signalQshift, SHIFTL, signalMUX);
    OUTPUT <= signalENDFF;
end struct;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRightReg8 is
    port(
        LOAD, SHIFTR, CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end ShiftRightReg8;

architecture struct OF ShiftRightReg8 is
    signal signalENDFF: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
    signal signalQshift: std_logic_vector(7 downto 0);
begin
    signalQshift(6 downto 0) <= signalENDFF(7 downto 1);
    signalQshift(7) <= signalENDFF(0);
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
    MUX2to1_8b: entity work.MUX2to1_8b(struct)
        port map(INPUT, signalQshift, SHIFTR, signalMUX);
    OUTPUT <= signalENDFF;
end struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORGATE_8b is
    Port(
        IN1, IN2: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end ORGATE_8b;

architecture struct of ORGATE_8b is
begin
    OUTPUT(7) <= IN1(7) or IN2(7);
    OUTPUT(6) <= IN1(6) or IN2(6);
    OUTPUT(5) <= IN1(5) or IN2(5);
    OUTPUT(4) <= IN1(4) or IN2(4);
    OUTPUT(3) <= IN1(3) or IN2(3);
    OUTPUT(2) <= IN1(2) or IN2(2);
    OUTPUT(1) <= IN1(1) or IN2(1);
    OUTPUT(0) <= IN1(0) or IN2(0);
end ;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_8b is
    port(
        LOAD, CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end Reg_8b;

architecture struct OF Reg_8b is
    signal signalENDFF: std_logic_vector(7 downto 0);
begin
    ENDFF_0: entity work.ENDFF(struct)
        port map(INPUT(0), LOAD, CLK, signalENDFF(0));
     ENDFF_1: entity work.ENDFF(struct)
        port map(INPUT(1), LOAD, CLK, signalENDFF(1));
     ENDFF_2: entity work.ENDFF(struct)
        port map(INPUT(2), LOAD, CLK, signalENDFF(2));
     ENDFF_3: entity work.ENDFF(struct)
        port map(INPUT(3), LOAD, CLK, signalENDFF(3));
     ENDFF_4: entity work.ENDFF(struct)
        port map(INPUT(4), LOAD, CLK, signalENDFF(4));
     ENDFF_5: entity work.ENDFF(struct)
        port map(INPUT(5), LOAD, CLK, signalENDFF(5));
     ENDFF_6: entity work.ENDFF(struct)
        port map(INPUT(6), LOAD, CLK, signalENDFF(6));
     ENDFF_7: entity work.ENDFF(struct)
        port map(INPUT(7), LOAD, CLK, signalENDFF(7));
    OUTPUT <= signalENDFF;
end struct;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY enARdFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END enARdFF_2;

ARCHITECTURE rtl OF enARdFF_2 IS
	SIGNAL int_q : STD_LOGIC;

BEGIN

    oneBitRegister:
    PROCESS(i_resetBar, i_clock)
    BEGIN
        IF (i_resetBar = '0') THEN
            int_q	<= '0';
        ELSIF (i_clock'EVENT and i_clock = '1') THEN
            IF (i_enable = '1') THEN
                int_q	<=	i_d;
            END IF;
        END IF;
    END PROCESS oneBitRegister;

	--  Output Driver

	o_q		<=	int_q;
	o_qBar		<=	not(int_q);

END rtl;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY enARdFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END enARdFF_2;

ARCHITECTURE struct OF enARdFF_2 IS
	SIGNAL int_q : STD_LOGIC;

BEGIN

    oneBitRegister:
    PROCESS(i_resetBar, i_clock)
    BEGIN
        IF ((int_q /= '0') and (int_q /= '1')) THEN
            int_q	<= '0';
        ELSIF (i_clock'EVENT and i_clock = '1') THEN
            IF (i_enable = '1') THEN
                int_q	<=	i_d;
            END IF;
        END IF;
    END PROCESS oneBitRegister;
    
	--  Output Driver

	o_q		<=	int_q;
	o_qBar		<=	not(int_q);

END struct;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	signal S0, S0_bar: std_logic;
	signal S1, S1_bar: std_logic;
	signal S2, S2_bar: std_logic;
	signal S3, S3_bar: std_logic;
	signal S4, S4_bar: std_logic;
		
	signal not_greset: std_logic;
	signal  LEFT_and_RIGHT: std_logic;
	signal  LEFT_and_not_RIGHT: std_logic;
	signal  not_LEFT_and_RIGHT: std_logic;
	signal  not_LEFT_and_not_RIGHT: std_logic;


begin
        
    not_greset <= not(greset);
    LEFT_and_RIGHT <= LEFT and RIGHT and s0;
    LEFT_and_not_RIGHT <= LEFT and not(RIGHT) and s0;
    not_LEFT_and_RIGHT <= not(LEFT) and RIGHT and s0;
    not_LEFT_and_not_RIGHT <= not(LEFT) and not(RIGHT) and s0;
        
        
    DFF0: entity work.enARdFF_2(struct)
        port map(S0, Greset, '1', Gclock, S0, S0_bar);

	DFF1: entity work.enARdFF_2(struct)
        port map(S0, LEFT_and_RIGHT, '1', Gclock, S1, S1_bar);

	DFF2: entity work.enARdFF_2(struct)
        port map(S0, LEFT_and_not_RIGHT, '1', Gclock, S2, S2_bar);

	DFF3: entity work.enARdFF_2(struct)
        port map(S0, not_LEFT_and_RIGHT, '1', Gclock, S3, S3_bar);

	DFF4: entity work.enARdFF_2(struct)
        port map(S0, not_LEFT_and_not_RIGHT, '1', Gclock, S4, S4_bar);

	loadLMASK <= S0;
	loadRMASK <= S0;
--    loadLMASK <= '1';
--	loadRMASK <= '1';
	loadDISPLAY <= '1';
	leftshiftLMASK <= S1 or S2;
	rightshiftRMASK <= S1 or S3;
end;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
    signal signalLMASK, signalRMASK: std_logic_vector(7 downto 0);
    signal signalOR: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
begin
    LMASKREG: entity work.ShiftLeftReg8(struct)
        port map(LOADLMASK,SHIFTL,CLK,"00000001",signalLMASK);
    RMASKREG: entity work.ShiftRightReg8(struct)
        port map(LOADRMASK,SHIFTR,CLK,"10000000",signalRMASK);
    ORGATE: entity work.ORGATE_8b(struct)
        port map(signalLMASK, signalRMASK, signalOR);
    MUX4to1: entity work.MUX4to1_8b(struct)
        port map("00000000", signalLMASK, signalRMASK, signalOR, LEFT, RIGHT, signalMUX);
    DISPLAYREG: entity work.Reg_8b(struct)
        port map(LOADDISPLAY, CLK, signalMUX, OUTPUT);
end ;
