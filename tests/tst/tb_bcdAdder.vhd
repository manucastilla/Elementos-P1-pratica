-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: .vhd
-- date: 4/4/2017

library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_bcdAdder is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_bcdAdder is

  component BCDAdder is
      port(
          x,y      : in STD_LOGIC_VECTOR(3 downto 0);
          carryin  : in std_logic;
          s        : out STD_LOGIC_VECTOR(3 downto 0);
          carryout : out STD_LOGIC
          );
    end component;

  signal x,y      : STD_LOGIC_VECTOR(3 downto 0);
  signal carryin  : std_logic;
  signal s        : STD_LOGIC_VECTOR(3 downto 0);
  signal carryout : STD_LOGIC;

  -- Clock
  constant CLK_PERIOD : time := 1 ns;
  signal clk : STD_LOGIC := '0';

begin

  u1 : bcdAdder port map(x,y,carryin,s,carryout);

  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;  --for 0.5 ns signal is '0'.
    clk <= '1';
    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
  end process;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    x <= "0000"; y<= "0000"; carryin <= '0';
    wait until clk='1' ;
    assert(s = "0000" and carryout = '0')  report "Falha adder1" severity error;

    -- Teste: 2
    x <= "0001"; y<= "1000"; carryin <= '0';
    wait until clk='1' ;
    assert(s = "1001" and carryout = '0')  report "Falha adder2" severity error;

    -- Teste: 3
    x <= "1000"; y<= "0100"; carryin <= '0';
    wait until clk='1' ;
    assert(s = "0010" and carryout = '1')  report "Falha adder3" severity error;

    -- Teste: 4
    x <= "1001"; y<= "1001"; carryin <= '0';
    wait until clk='1' ;
    assert(s = "1000" and carryout = '0')  report "Falha adder3" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
