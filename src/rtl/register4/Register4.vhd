-- Elementos de Sistemas
-- by Luciano Soares
-- Register4.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register4 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(3 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(3 downto 0)
	);
end entity;

architecture arch of Register4 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

begin
	register0: BinaryDigit port map(
			clock 	=> clock,
			input 	=> input(0),
			load  	=>   load,
			output	=> output(0)
			);

	register1: BinaryDigit port map(
			clock 	=> clock,
			input 	=> input(1),
			load  	=>   load,
			output	=> output(1)
			);

	register2: BinaryDigit port map(
			clock 	=> clock,
			input 	=> input(2),
			load  	=>   load,
			output	=> output(2)
			);

	register3: BinaryDigit port map(
			clock 	=> clock,
			input 	=> input(3),
			load  	=>   load,
			output	=> output(3)
			);
end architecture;
