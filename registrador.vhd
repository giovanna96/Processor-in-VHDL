library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity registrador is
	
	port (
		clk: in std_logic;
		W_data: in std_logic_vector (15 downto 0);
		W_addr,RP_addr,RQ_addr: in std_logic_vector(3 downto 0);
		W_wr,RP_rd,RQ_rd: in std_logic;
		RP_data,RQ_data: out std_logic_vector (15 downto 0)
	);
end registrador;

architecture registrar of registrador is

 signal RF: std_logic_vector(255 downto 0);
   	begin
		process (clk,RP_addr,RQ_addr,RP_rd,RQ_rd,W_addr,W_data,W_wr)
			begin
			if((clk'event and clk = '1') ) then
				if ( W_wr='1' ) then
					RF((16*(to_integer(unsigned (W_addr)))+(15))downto 16*(to_integer(unsigned (W_addr)))) <= W_data;
				end if;
				if( RP_rd='1' ) then
					RP_data <= RF(16*(to_integer(unsigned (RP_addr)))+(15) downto 16*(to_integer(unsigned (RP_addr))));
			   end if;
				if(RQ_rd='1') then
					RQ_data <= RF(16*(to_integer(unsigned (RQ_addr)))+(15) downto 16*(to_integer(unsigned (RQ_addr))));		
				end if;
			end if;
		end process;
end registrar;