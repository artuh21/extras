library ieee;
use ieee.std_logic_1164.all;

entity combinacao is
  port (
    e_1, e_2, e_3, e_4 : in  std_logic;
    sel_1 : in  std_logic;
    s_1 : out std_logic
  );
end entity combinacao;

architecture arch_design of combinacao is
  component mult2x1
    port (
      e1, e2, sel : in  std_logic;
      s : out std_logic
    );
  end component;

  signal saida_sel : std_logic;
begin
  MUX2 : mult2x1
    port map (
      e1 => e_1,
      e2 => e_2,
      sel => sel_1,
      s => saida_sel
    );

  MUX1 : mult2x1
    port map (
      e1 => e_3,
      e2 => e_4,
      sel => saida_sel,
      s => s_1
    );
end architecture arch_design;
