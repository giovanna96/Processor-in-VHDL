library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux is
	
	port (
		ula_mux,memoria_mux,controlador_mux: in std_logic_vector (15 downto 0);
		seletor: in std_logic_vector(1 downto 0);
		saida_mux: out std_logic_vector (15 downto 0)
	);
end mux;

	
architecture arq of mux is
	begin 
		saida_mux <= controlador_mux  when seletor = "00" else 
					memoria_mux when seletor = "01" else
					ula_mux when seletor = "10";
end arq;