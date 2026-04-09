library ieee;
use ieee.std_logic_1164.all;

entity ula32 is
    port(
        a : in  std_logic_vector(31 downto 0);
        b : in  std_logic_vector(31 downto 0);
        cin : in  std_logic;
        sel : in  std_logic;  
        saida : out std_logic_vector(31 downto 0);
        carry_out : out std_logic
    );
end ula32;

architecture estrutural of ula32 is

    component ula is
        port(
            a : in  std_logic;
            b : in  std_logic;
            cin : in  std_logic;
            sel : in  std_logic;
            saida : out std_logic;
            carryout : out std_logic
        );
    end component;

    signal c : std_logic_vector(32 downto 0);

begin
    c(0) <= cin;

    gen_ula: for i in 0 to 31 generate
        bit_ula: ula
            port map(
                a => a(i),
                b => b(i),
                cin => c(i),
                sel => sel,
                saida => saida(i),
                carryout => c(i+1)
            );
    end generate;

    carry_out <= c(32);

end estrutural;
