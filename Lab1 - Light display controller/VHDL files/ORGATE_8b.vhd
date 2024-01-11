library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- or gate that takes two 8 bit std_logic_vector for IN1 and IN2
-- outputs 8 bit std_logic_vector
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