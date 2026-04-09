library ieee;
use ieee.std_logic_1164.all;

entity combinacao_tb is
end entity;

architecture tb of combinacao_tb is
  component combinacao
    port (
      e_1, e_2, e_3, e_4 : in  std_logic;
      sel_1 : in  std_logic;
      s_1 : out std_logic
    );
  end component;

  signal e_1, e_2, e_3, e_4 : std_logic := '0';
  signal sel_1 : std_logic := '0';
  signal s_1 : std_logic;
begin
  uut: combinacao
    port map (
      e_1  => e_1,  
      e_2 => e_2,
      e_3 => e_3,  
      e_4 => e_4,
      sel_1=> sel_1, 
      s_1 => s_1
    );

  stim: process
  begin
    e_3 <= '0'; 
    e_4 <= '1';
    e_1 <= '0'; 
    e_2 <= '1';
    sel_1 <= '0';
    wait for 10 ns;

    sel_1 <= '1';
    wait for 10 ns;

    e_1 <= '1'; 
    e_2 <= '0';
    wait for 10 ns;

    e_3 <= '1';
    e_4 <= '0';
    wait for 10 ns;

    wait;
  end process;
end architecture tb;
