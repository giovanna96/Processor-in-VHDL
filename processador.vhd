library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity processador is
	
	port (
	     
		  clk,bt1,bt2: in std_logic;
		  state: out std_logic_vector(3 downto 0);
		  led_saida: out std_logic_vector(15 downto 0);
			aux: out std_logic_vector(3 downto 0)
		 
		 );

end processador;


architecture proc of processador is
component UC  

  port (
  
      data: in std_logic_vector(15 downto 0);
		clk,bt1,bt2: in std_logic;
	   Rp_zero: in std_logic;
	   d_rd,d_wr: out std_logic;--MEMEORIA
		d_addr:	out std_logic_vector(7 downto 0);--MEMORIA
		rf_data: out std_logic_vector(7 downto 0);--MUX
		mux_sel: out std_logic_vector(1 downto 0);--MUX
		W_addr,RP_addr,RQ_addr: out std_logic_vector(3 downto 0);--REGISTRADOR
		W_wr,RP_rd,RQ_rd: out std_logic;--REGISTRADOR
		ula_sel: out std_logic_vector(2 downto 0);--ULA
		addr: out std_logic_vector(15 downto 0);-- SAIDA UNIDADE DE CONTROLE
	   rd: out std_logic; -- SAIDA UNIDADE DE CONTROLE
		state: out std_logic_vector(3 downto 0);
		sel_mux2: out std_logic_vector(1 downto 0);
		aux: out std_logic_vector(3 downto 0)
		
  
  );
  end component;


  component datapath 
	
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
end component;

component  memoria1 
 port( 
   
	   addr: in std_logic_vector(15 downto 0);
		rd: in std_logic;
		data: out std_logic_vector(15 downto 0)
  );
  
  end component;

  component RAM 
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

 component mux2  
	port(

		saida_mux,saida_regi: in std_logic_vector(15 downto 0);
		sel: in std_logic_vector(1 downto 0);
		led: out std_logic_vector(15 downto 0)



	);
	end component;

signal sw_data_mux,sdata_ir,spc_addr,sr_data_mux,srf_data :  std_logic_vector(15 downto 0);
signal sw_addr,srp_addr,srq_addr: std_LOGIC_VECTOR(3 downto 0);
signal sd_addr: std_LOGIC_VECTOR(7 downto 0);
signal srd_bc,sd_wr_mem,sd_rd_mem,sw_wr,srp_rd,srq_rd,srp_zero: std_logic;
signal ssel_mux: std_logic_vector(1 downto 0);
signal ssel_ula: std_logic_vector(2 downto 0);
signal led1,led2: std_logic_vector(15 downto 0);
signal led_sel: std_logic_vector(1 downto 0); 
signal saida_led_mux: std_logic_vector(15 downto 0);
signal estado: std_logic_vector(3 downto 0);



begin

I0: UC port map (sdata_ir,clk,bt1,bt2,srp_zero,sd_rd_mem,sd_wr_mem,sd_addr,srf_data(7 downto 0),ssel_mux,sw_addr,
							srp_addr,srq_addr,sw_wr,srp_rd,srq_rd,ssel_ula,spc_addr,srd_bc, estado,led_sel, aux);
I1: datapath port map(clk,sw_addr,srp_addr,srq_addr,sw_wr,srp_rd,srq_rd,srf_data,sr_data_mux,ssel_mux,ssel_ula,srp_zero,sw_data_mux, led1, led2);
I2: memoria1 port map(spc_addr,srd_bc,sdata_ir);
I3: RAM port map(sd_addr,clk,sw_data_mux,sd_wr_mem,sr_data_mux);
I4: mux2 port map(led1,led2,led_sel,saida_led_mux); 


 led_saida <= saida_led_mux;
 state <= estado;



end proc;