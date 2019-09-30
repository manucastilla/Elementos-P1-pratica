-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Add16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_detect9Gt is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_detect9Gt is

  component detectGt9 is
    port(
      x       : in STD_LOGIC_VECTOR(3 downto 0);
      carryin : in Std_logic;
      adjust  : out STD_LOGIC
      );
  end component;


signal  x : STD_LOGIC_VECTOR(3 downto 0);
signal  carry,adjust : STD_LOGIC;

begin

  u1 : detectGt9 port map(x, carry, adjust);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    x <= "0000"; carry <= '0';
    wait for 200 ps;
    assert(adjust = '0')  report "Falha em teste: 1" severity error;

    -- Teste: 1
    x <= "1001"; carry <= '0';
    wait for 200 ps;
    assert(adjust = '0')  report "Falha em teste: 1" severity error;

    -- Teste: 1
    x <= "0000"; carry <= '1';
    wait for 200 ps;
    assert(adjust = '1')  report "Falha em teste: 1" severity error;


    -- Teste: 1
    x <= "1000"; carry <= '1';
    wait for 200 ps;
    assert(adjust = '1')  report "Falha em teste: 1" severity error;

    -- Teste: 1
    x <= "1010"; carry <= '0';
    wait for 200 ps;
    assert(adjust = '1')  report "Falha em teste: 1" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
