library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_sistema_ula_decodificador is
end entity;

architecture sim of tb_sistema_ula_decodificador is

    signal A_dec, B_dec, C_dec : std_logic := '0';
    signal a_ula, b_ula : std_logic_vector(31 downto 0);
    signal cin : std_logic := '0';
    signal saida : std_logic_vector(31 downto 0);
    signal carry_out : std_logic;
    signal S1, S2, S3 : std_logic;

    signal vec : std_logic_vector(2 downto 0);

begin

    dut: entity work.sistema_ula_decodificador(estrutural)
        port map(
            A_dec => A_dec,
            B_dec => B_dec,
            C_dec => C_dec,
            a_ula => a_ula,
            b_ula => b_ula,
            cin => cin,
            saida => saida,
            carry_out=> carry_out,
            S1 => S1,
            S2 => S2,
            S3 => S3
        );

    stim: process
    begin
        a_ula <= x"0000000F";
        b_ula <= x"00000003";
        cin <= '0';

        for i in 0 to 7 loop
            vec   <= std_logic_vector(to_unsigned(i, 3));
            A_dec <= vec(2);
            B_dec <= vec(1);
            C_dec <= vec(0);
            wait for 10 ns;
        end loop;

        wait;
    end process;

end architecture sim;
