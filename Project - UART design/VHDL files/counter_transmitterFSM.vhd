library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_transmitterFSM is
 Port (
    CTRload, CTRinc, CLK: in std_logic;
    c: out std_logic
 );
end counter_transmitterFSM;

architecture struct of counter_transmitterFSM is
    signal COUNT: std_logic_vector(7 downto 0);
begin
    counter: entity work.LshiftReg_8b(struct)
        port map(CTRload, CTRinc, CLK, "11111111", COUNT);

    c <= COUNT(7);
end ;
