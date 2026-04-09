library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_32bits_tb is
end mux2x1_32bits_tb;

architecture tb of mux2x1_32bits_tb is
    component mux2x1_32bits
        port(
           e1 : in  std_logic_vector(31 downto 0);
           e2 : in  std_logic_vector(31 downto 0);
           sel : in  std_logic;
           s : out std_logic_vector(31 downto 0)
        );
    end component;

    signal e1_tb, e2_tb : std_logic_vector(31 downto 0);
    signal sel_tb : std_logic;
    signal s_tb : std_logic_vector(31 downto 0);
begin
    uut: mux2x1_32bits
        port map(
           e1 => e1_tb,
           e2 => e2_tb,
           sel => sel_tb,
           s => s_tb
        );

    tb_process: process
    begin
       e1_tb <= (others => '1');
       e2_tb <= (others => '0');
       sel_tb <= '0';

	wait for 100 ns;
        for i in 0 to 9 loop
            if sel_tb = '0' then
                sel_tb <= '1';
            else
                sel_tb <= '0';
            end if;
            wait for 100 ns;
        end loop;
        wait;
    end process;
end tb;
