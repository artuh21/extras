library ieee;
use ieee.std_logic_1164.all;

entity sistema_ula_decodificador is
    port(
        A_dec, B_dec, C_dec : in  std_logic;

        a_ula : in  std_logic_vector(31 downto 0);
        b_ula : in  std_logic_vector(31 downto 0);
        cin : in  std_logic;

        saida : out std_logic_vector(31 downto 0);
        carry_out : out std_logic;

        S1, S2, S3 : out std_logic
    );
end entity sistema_ula_decodificador;

architecture estrutural of sistema_ula_decodificador is

    signal s1_i, s2_i, s3_i : std_logic;

begin

    u_dec: entity work.decodificador(comportamental)
        port map (
            A => A_dec,
            B => B_dec,
            C => C_dec,
            S1 => s1_i,
            S2 => s2_i,
            S3 => s3_i
        );

    u_ula: entity work.ula32(estrutural)
        port map(
            a => a_ula,
            b => b_ula,
            cin => cin,
            sel => s1_i,
            saida => saida,
            carry_out => carry_out
        );

    S1 <= s1_i;
    S2 <= s2_i;
    S3 <= s3_i;

end architecture estrutural;
