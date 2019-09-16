-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: tb_Add16.vhd
-- date: 4/4/2017

library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_adderbit4 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_adderbit4 is

component bitAdder4 is
	port(
		x   :  in STD_LOGIC_VECTOR(3 downto 0);
		y   :  in STD_LOGIC_VECTOR(3 downto 0);
    carryin : in STD_LOGIC;
		z   : out STD_LOGIC_VECTOR(3 downto 0);
    carryout : out STD_LOGIC
	);
end component;

signal  inA, inB, outQ : STD_LOGIC_VECTOR(3 downto 0);
signal carryin, carryout : std_logic;

begin

	u1 : bitAdder4 port map(inA, inB, carryin, outQ , carryout);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- Teste: 1
    inA <= "0000"; inB<= "0001"; carryin <= '0';
    wait for 200 ps;
    assert(outQ = "0001" and carryout = '0')  report "Falha em teste: 1" severity error;

    -- Teste: 1
    inA <= "0000"; inB<= "0000"; carryin <= '1';
    wait for 200 ps;
    assert(outQ = "0001" and carryout = '0')  report "Falha em teste: 1" severity error;

    inA <= "0001"; inB<= "0001"; carryin <= '1';
    wait for 200 ps;
    assert(outQ = "0011" and carryout = '0')  report "Falha em teste: 1" severity error;

    inA <= "0001"; inB<= "0001"; carryin <= '0';
    wait for 200 ps;
    assert(outQ = "0010" and carryout = '0')  report "Falha em teste: 1" severity error;

    inA <= "0111"; inB<= "0001"; carryin <= '0';
    wait for 200 ps;
    assert(outQ = "1000" and carryout = '0')  report "Falha em teste: 1" severity error;

    inA <= "1111"; inB<= "0001"; carryin <= '0';
    wait for 200 ps;
    assert(outQ = "0000" and carryout = '1')  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
