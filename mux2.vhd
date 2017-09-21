library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity mux2 is 
port(

	saida_mux,saida_regi: in std_logic_vector(15 downto 0);
	sel: in std_logic_vector(1 downto 0);
	led: out std_logic_vector(15 downto 0)



);
end mux2;


architecture arq of mux2 is 
begin
				led <= "0000000000000000" when sel="00" else 
				       saida_mux when sel="01" else
						 saida_regi when sel="10";


end arq; 