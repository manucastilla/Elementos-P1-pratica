------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 2 - Seven Seg
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
  port (
    H : in  STD_LOGIC_VECTOR(3 downto 0);
    a,b,c,d,e,f,g : out STD_LOGIC );
end entity;

architecture  rtl OF sevenSeg IS


begin
	a <= '1' when H="0001" else 
		  '1'when	H="0100" else 
		  '0';
	b <= '1' when H="0001" else
	     '1' when H="0101" else
	     '1' when H="0110" else '0';
	c <= '1' when H="0010" else '0';
	d <= '1' when H="0100" else 
		 '1' when H="0111" else 
		 '1' when H="1001" else '0';
	e <= '1' when H="0001" else 
		 '1' when H="0011" else
		 '1' when H="0100" else
		 '1' when H="0101" else
		 '1' when H="0111" else
		 '1' when H="1001" else '0';
	f <= '1' when H="0001" else
		 '1' when H="0010" else 
		 '1' when H="0011" else 
		 '1' when H="0111" else '0';
	g <= '1' when H="0000" else
		 '1' when H="0001" else 
		 '1' when H="0111" else '0';



end architecture;
