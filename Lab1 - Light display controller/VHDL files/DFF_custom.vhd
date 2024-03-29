
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ENTITY TAKEN FROM BRIGHTSPACE (dFF_2.vhd)
-- the name of the entity here was changed because we originally had 
-- our own implementation of a DFF, but later changed it to the DFF 
-- implementation provided to us. 
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