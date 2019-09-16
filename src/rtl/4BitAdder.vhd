---------------------------------------------------------------------------------------------
--  SIMULADO PROVA PRÁTICA ELEMENTOS DE SISTEMAS
--
--  QUESTAO 2 - BCD ADDER
--
--  a) Implemente um adder de 4 bits (bitAdder4.vhd) que soma dois vetores de
--  4 bits cada (X e Y). Esse adder tem duas saídas: o valor da soma e o carry.
--
--  você deve utilizar os fulladders (fulladder.vhd), já fornecidos
--
---------------------------------------------------------------------------------------------



Library ieee;
use ieee.std_logic_1164.all;

entity bitAdder4 is

	port(
		x,y   : in STD_LOGIC_VECTOR(3 downto 0);
    carryin : in Std_logic;
		z     : out STD_LOGIC_VECTOR(3 downto 0);
    carryout : out STD_LOGIC
	);
end entity;

architecture rtl of bitAdder4 is

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma,vaium: out STD_LOGIC   -- sum e carry
      );
  end component;

begin



end architecture;
