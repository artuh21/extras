library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_32bits is
    port(
       e1 : in  std_logic_vector(31 downto 0);
       e2 : in  std_logic_vector(31 downto 0);
       sel : in  std_logic;
       s : out std_logic_vector(31 downto 0)
    );
end mux2x1_32bits;

architecture arch_mux2x1_32bits of mux2x1_32bits is
    component mult2x1
        port(
           e1, e2, sel : in std_logic;
           s : out std_logic
        );
    end component;
begin
    gen_mux: for i in 0 to 31 generate
        mux_i: mult2x1
            port map(
               e1 => e1(i),
               e2 => e2(i),
               sel => sel,
               s => s(i)
            );
    end generate;
end arch_mux2x1_32bits;
