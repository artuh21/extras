library ieee;
use ieee.std_logic_1164.all;

entity ula_tb is
end ula_tb;

architecture sim of ula_tb is
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

  signal a, b, cin, sel : std_logic := '0';
  signal saida, carryout: std_logic;
begin
  dut: ula port map(a => a, b => b, cin => cin, sel => sel, saida => saida, carryout => carryout);

  stim: process
  begin
    sel <= '0';
    for v in 0 to 7 loop
      a <= std_logic'val((v / 4) mod 2);
      b <= std_logic'val((v / 2) mod 2);
      cin <= std_logic'val(v mod 2);
      wait for 10 ns;
    end loop;

    sel <= '1';
    for v in 0 to 7 loop
      a <= std_logic'val((v / 4) mod 2);
      b <= std_logic'val((v / 2) mod 2);
      cin <= std_logic'val(v mod 2);
      wait for 10 ns;
    end loop;
    wait;
  end process;
end sim;
