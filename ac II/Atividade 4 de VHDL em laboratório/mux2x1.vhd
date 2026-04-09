library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
  port(
    e1 : in  std_logic;
    e2 : in  std_logic;
    sel : in  std_logic;
    s : out std_logic
  );
end mux2x1;

architecture rtl of mux2x1 is
begin
  with sel select
    s <= e1 when '0',
         e2 when others;
end rtl;
