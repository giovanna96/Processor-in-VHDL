library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity ula is 
	
	
	port (
		Rp_data,Rq_data: in std_logic_vector (15 downto 0);
		ula_sel: in std_logic_vector(2 downto 0);
		saida_ula: out std_logic_vector (15 downto 0)
	);
end ula;
	
architecture alu of ula is
	begin 
		saida_ula <= (Rp_data + Rq_data) when ula_sel = "000" else 
					(Rp_data - Rq_data) when ula_sel = "001" else
					(Rp_data and Rq_data) when ula_sel = "010" else
					(Rp_data or Rq_data) when ula_sel = "011" else
					(not Rp_data) when ula_sel = "100" ;
					
					
end alu;