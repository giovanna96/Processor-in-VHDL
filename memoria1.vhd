library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity  memoria1 is
 port( 
   
	   addr: in std_logic_vector(15 downto 0);
		rd: in std_logic;
		data: out std_logic_vector(15 downto 0)
  );
  
  end memoria1;
  
  
  architecture mem of memoria1 is
  signal RF: std_logic_vector(255 downto 0);
    begin
	  
	   RF(15 downto 0)    <= "1010000100000001";-- LC=1->R1
		RF(31 downto 16)   <= "1010001000000010";-- LC=2->R2
		RF(47 downto 32)   <= "1011000100000010";-- JUMPZ R1 +2
		RF(63 downto 48)   <= "0011100000010010";-- ADD R8=R1+R2
		RF(79 downto 64)   <= "1000100000000000";-- STORE D0<-R8
		RF(95 downto 80)   <= "1001010000000000";-- LOAD D0->R4
		RF(111 downto 96)  <= "0100010101000001";-- SUB R5=R4 - R1
		RF(127 downto 112) <= "1011101000000010";-- JUMPZ R10+2
		RF(143 downto 128) <= "0101011000010010";-- AND R6 = R1 and R2
		RF(159 downto 144) <= "0110011100010010";-- OR R7 = R1 or R2
		RF(175 downto 160) <= "1011101011111110";-- JUMPZ R10-2
		RF(191 downto 176) <= "0111100000010010";-- NOT R8 = R1 not R2
	 
	  data <= RF(16*(to_integer(unsigned(addr))) + (15) downto 16*(to_integer(unsigned (addr)))) when rd = '1'; 
	  
  
  
  
  
  end mem;
 
 