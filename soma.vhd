library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
 
 
 entity soma is 
 port(
  ir,pc: in std_logic_vector(15 downto 0);
  saida : out std_logic_vector(15 downto 0)
  );
  end soma;
  
architecture somArch of soma is

begin 

    saida <= ir(7 downto 0)+pc-'1';


end somArch;