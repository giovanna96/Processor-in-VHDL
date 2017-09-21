library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
 
 entity comparador is
      port(
		  entrada: in std_logic_vector(15 downto 0);
		  saida : out std_logic
		
		);
		
 end comparador;
 
 
 architecture cp of comparador is
    begin 
	 
	   saida <= '1' when entrada="0000000000000000" else '0'; 
		
 
 end cp;