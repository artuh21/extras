library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
    port (
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        S1 : out std_logic;
        S2 : out std_logic;
        S3 : out std_logic
    );
end entity decodificador;

architecture comportamental of decodificador is
begin
    S1 <= A;
    S2 <= B;
    S3 <= C;
end architecture comportamental;
