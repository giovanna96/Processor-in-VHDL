library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity UC is 

  port (
  
      data: in std_logic_vector(15 downto 0);
		clk,bt1,bt2: in std_logic;
	   rp_zero: in std_logic;
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
  end UC;

  architecture aq of UC is
  
  
		component PC 
		  port (
        clk,pc_inc,pc_clr,pc_ld: in STD_LOGIC;
        saida: out STD_LOGIC_VECTOR(15 downto 0);
        soma: in STD_LOGIC_VECTOR(15 downto 0)
      );
		end component;
		
		component IR 
		 port (
        clk, ir_ld: in STD_LOGIC;
        entrada: in STD_LOGIC_VECTOR(15 downto 0);
        saida: out STD_LOGIC_VECTOR(15 downto 0)
       
		);
		end component;
		
		component BC
		port(
		clk,bt1,bt2: in std_logic;
		entrada: in std_logic_vector(15 downto 0);
		pc_ld,pc_clr,pc_inc: out std_logic;--PC
		ir_ld: out std_logic;--IR
		ird: out std_logic;--IR
		d_rd,d_wr: out std_logic;--MEMEORIA
		d_addr:	out std_logic_vector(7 downto 0);--MEMORIA
		rf_data: out std_logic_vector(7 downto 0);--MUX
		mux_sel: out std_logic_vector(1 downto 0);--MUX
		W_addr,RP_addr,RQ_addr: out std_logic_vector(3 downto 0);--REGISTRADOR
		W_wr,RP_rd,RQ_rd: out std_logic;--REGISTRADOR
		ula_sel: out std_logic_vector(2 downto 0);--ULA
		Rp_zero: in std_logic; --SAIDA REGISTRADOR 
		state: out std_logic_vector(3 downto 0);
		sel_mux2: out std_logic_vector(1 downto 0);
		aux: out std_logic_vector(3 downto 0)
		);
		end component;
		
		component soma 
		port(
		  ir,pc: in std_logic_vector(15 downto 0);
		  saida : out std_logic_vector(15 downto 0)
		  );
		end component;
		
		signal ld_ir : std_logic;
		signal ir_cont, ir_som: std_logic_vector(15 downto 0);
		signal ld_pc,clr_pc,inc_pc: std_logic;
		signal soma_pc: std_logic_vector(15 downto 0);
		signal pc_soma: std_logic_vector(15 downto 0);
		 
		
		begin 
		I0: PC port map (clk,inc_pc,clr_pc,ld_pc,pc_soma,soma_pc);
		I1: IR port map (clk,ld_ir,data,ir_som);
		I2: BC port map (clk,bt1,bt2,ir_som,ld_pc,clr_pc,inc_pc,ld_ir,rd,d_rd,d_wr,d_addr,rf_data,mux_sel,
		                 w_addr,rp_addr,rq_addr,w_wr,rp_rd,rq_rd,ula_sel,rp_zero, state, sel_mux2);
		I3: soma port map(ir_som,pc_soma,soma_pc); 					  
		
		aux <= pc_soma (3 downto 0);
		
		addr <= pc_soma;
		
		
  
  
  end aq;