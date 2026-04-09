library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_decodificador is
end entity;

architecture sim of tb_decodificador is
    signal A, B, C : std_logic := '0';
    signal S1, S2, S3 : std_logic;
begin
    dut: entity work.decodificador(comportamental)
        port map (
        	A => A, 
        	B => B, 
        	C => C, 
        	S1 => S1, 
        	S2 => S2, 
        	S3 => S3
        );

    stim: process
        variable vec : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 7 loop
            vec := std_logic_vector(to_unsigned(i, 3));
            A <= vec(2);
            B <= vec(1);
            C <= vec(0);
            wait for 10 ns;
        end loop;
        wait;
    end process;
end architecture sim;
