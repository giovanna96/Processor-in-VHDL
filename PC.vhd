library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity PC is
	
    port (
        clk,pc_inc,pc_clr,pc_ld: in STD_LOGIC;
        saida: out STD_LOGIC_VECTOR(15 downto 0);
        soma: in STD_LOGIC_VECTOR(15 downto 0)
    );
end PC;

architecture pcArch of PC is
signal ssaida: STD_LOGIC_VECTOR(15 downto 0);
begin
  process(clk) begin
  	if clk'event and clk = '1' then 
  		if pc_clr = '1' then
  			ssaida <= (others => '0');
  		elsif pc_ld = '1' then
  			ssaida <= soma;
  		elsif pc_inc = '1' then
  			ssaida <= ssaida + '1';
  		end if;
  	end if;
  end process;
  
  saida <= ssaida;
end pcArch;