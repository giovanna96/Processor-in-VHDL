library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity datapath is

port(

   clk: in std_logic;
	W_addr,RP_addr,RQ_addr: in std_logic_vector(3 downto 0);
	W_wr,RP_rd,RQ_rd : in std_logic;
	controlador_mux,memoria_mux: in std_logic_vector(15 downto 0);
	sel_mux: in std_logic_vector(1 downto 0);
	sel_ula: in std_logic_vector(2 downto 0);
	rp_zero: out std_logic;
	saida: out std_logic_vector(15 downto 0);
	saida_led1,saida_led2: out std_logic_vector(15 downto 0)
	

);
end datapath;


architecture dp of datapath is

	component mux 
		
		
		port (
			ula_mux,memoria_mux,controlador_mux: in std_logic_vector (15 downto 0);
			seletor: in std_logic_vector(1 downto 0);
			saida_mux: out std_logic_vector (15 downto 0)
		);
	end component;
	
	component registrador 
		
		
		port (
			clk: in std_logic;
			W_data: in std_logic_vector (15 downto 0);
			W_addr,RP_addr,RQ_addr: in std_logic_vector(3 downto 0);
			W_wr,RP_rd,RQ_rd: in std_logic;
			RP_data,RQ_data: out std_logic_vector (15 downto 0)
		);
	end component;
	
	component ula
		
		port (
			Rp_data,Rq_data: in std_logic_vector (15 downto 0);
			ula_sel: in std_logic_vector(2 downto 0);
			saida_ula: out std_logic_vector (15 downto 0)
		);
	end component;
	
	component comparador 
	 port(
		  entrada: in std_logic_vector(15 downto 0);
		  saida : out std_logic
		
		);
	end component;
	
	signal mux_reg: std_logic_vector(15 downto 0);
	signal reg_ula1: std_logic_vector(15 downto 0);
	signal reg_ula2: std_logic_vector(15 downto 0);
	signal ula_mux: std_logic_vector(15 downto 0);
	signal reg_comp: std_logic_vector(15 downto 0);
	
	begin 
	I1: mux  port map (ula_mux,memoria_mux,controlador_mux,sel_mux,mux_reg);
	I2: ula  port map (reg_ula1,reg_ula2,sel_ula,ula_mux);
	I3: registrador  port map (clk,mux_reg,W_addr,RP_addr,RQ_addr,W_wr,RP_rd,RQ_rd,reg_ula1,reg_ula2);
	I4: comparador  port map (reg_ula1,rp_zero);
	saida <= reg_ula1;
	saida_led1 <= mux_reg; 
	saida_led2 <= reg_ula1;
	
	
end dp;