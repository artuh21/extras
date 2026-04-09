library ieee;
use ieee.std_logic_1164.all;

entity ula is
  port(
    a : in  std_logic;
    b : in  std_logic;
    cin : in  std_logic;
    sel : in  std_logic;
    saida : out std_logic;
    carryout : out std_logic
  );
end ula;

architecture estrutural of ula is
  component somadorcompleto is
    port(
      a : in  std_logic;
      b : in  std_logic;
      cin : in  std_logic;
      soma : out std_logic;
      cout : out std_logic
    );
  end component;

  component mux2x1 is
    port(
      e1 : in  std_logic;
      e2 : in  std_logic;
      sel : in  std_logic;
      s : out std_logic
    );
  end component;

  signal s_soma : std_logic;
  signal s_cout : std_logic;
  signal s_and : std_logic;
begin
  fa: somadorcompleto port map(a => a, b => b, cin => cin, soma => s_soma, cout => s_cout);
  s_and <= a and b;
  m: mux2x1 port map(e1 => s_soma, e2 => s_and, sel => sel, s => saida);
  carryout <= s_cout;
end estrutural;
