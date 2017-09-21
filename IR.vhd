library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity IR is

    port (
        clk, ir_ld: in STD_LOGIC;
        entrada: in STD_LOGIC_VECTOR(15 downto 0);
        saida: out STD_LOGIC_VECTOR(15 downto 0)
       
    );
end IR;

architecture irArch of IR is
	begin
		process(clk) begin
			if clk'event and clk = '0' then
				if ir_ld = '1' then
					saida <= entrada;
				end if;
			end if;
		end process;
end irArch;