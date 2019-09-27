-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Add16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_mux4 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_mux4 is

  component mux4 is
    port(
      x,y     : in STD_LOGIC_VECTOR(3 downto 0);
      sel : in Std_logic;
      z       : out STD_LOGIC_VECTOR(3 downto 0)
      );
  end component;

signal  x,y,z : STD_LOGIC_VECTOR(3 downto 0);
signal  sel : STD_LOGIC;

begin

  u1 : mux4 port map(x, y, sel, z);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    x <= "1010"; y <= "0101"; sel <= '0';
    wait for 200 ps;
    assert(z = "1010")  report "Falha em teste: 1" severity error;

   sel <= '1';
    wait for 200 ps;
    assert(z = "0101")  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
