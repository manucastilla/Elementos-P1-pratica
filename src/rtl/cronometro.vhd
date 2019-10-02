------------------------------
-- Elementos de Sistemas
-- Avaliacao Pratica 1
--
-- 10/2019
--
-- Questão 2 - Cronometro
------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cronometro is
  port (
    enable : in std_logic;
    clk : in std_logic;
    a1,b1,c1,d1,e1,f1,g1 : out STD_LOGIC;
    a2,b2,c2,d2,e2,f2,g2 : out STD_LOGIC
    );
end entity;

architecture  rtl OF cronometro IS

  component BCDAdder is
    port(
      x,y      : in STD_LOGIC_VECTOR(3 downto 0);
      carryin  : in std_logic;
      s        : out STD_LOGIC_VECTOR(3 downto 0);
      carryout : out STD_LOGIC
      );
  end component;

  component Register4 is
    port(
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(3 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(3 downto 0)
    );
  end component;

  component sevenSeg is
    port (
      H : in  STD_LOGIC_VECTOR(3 downto 0);
      a,b,c,d,e,f,g : out STD_LOGIC );
  end component;

signal BCD0, BCD1, res0, res1: STD_LOGIC_VECTOR(3 downto 0);
signal carry0: STD_LOGIC;


begin

  bcdAdder0: BCDAdder port map (
      x        => res0,
      y        => "0000",
      carryin  => '1',
      s        => BCD0,
      carryout => carry0
      );

  bcdAdder1: BCDAdder port map (
      x        => res1,
      y        => "0000" ,
      carryin  => carry0,
      s        => BCD1,
      carryout => open
      );

  register0: Register4 port map(
      clock   =>   clk,
      input   =>   BCD0,
      load    =>   '1',
      output  => res0
    );

  register1: Register4 port map(
      clock   =>   clk,
      input   =>   BCD1,
      load    =>   '1',
      output  => res1
    );

  sevenSeg0: sevenSeg port map (
      H => res0,
      a => a1,
      b => b1,
      c => c1,
      d => d1,
      e => e1,
      f => f1,
      g => g1
      );

  sevenSeg1: sevenSeg port map (
      H => res1,
      a => a2,
      b => b2,
      c => c2,
      d => d2,
      e => e2,
      f => f2,
      g => g2
      );



end architecture;
