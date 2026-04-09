library ieee;
use ieee.std_logic_1164.all;

entity somadorcompleto is
  port(
    a : in  std_logic;
    b : in  std_logic;
    cin : in  std_logic;
    soma : out std_logic;
    cout : out std_logic
  );
end somadorcompleto;

architecture estrutural of somadorcompleto is
  component meio_somador is
    port(
      a : in  std_logic;
      b : in  std_logic;
      soma : out std_logic;
      carry : out std_logic
    );
  end component;

  signal s1 : std_logic;
  signal c1, c2  : std_logic;
begin
  ms1: meio_somador port map(a => a, b => b, soma => s1, carry => c1);
  ms2: meio_somador port map(a => s1, b => cin, soma => soma, carry => c2);
  cout <= c1 or c2;
end estrutural;
