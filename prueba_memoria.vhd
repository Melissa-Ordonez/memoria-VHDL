library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity prueba_memoria is

	port
	(
	
		display1, display2, display3, display4: out std_logic_vector(7 downto 0);
		address : in  std_logic_vector(7 downto 0);
		data_out: buffer std_logic_vector(7 downto 0);
		
		data_in: in  std_logic_vector(7 downto 0);
		write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0
		clock : in std_logic;
		reset: in std_logic;
		port_in:in std_logic_vector(7 downto 0);
		port_in_00,port_in_01: in std_logic_vector(7 downto 0);
		
		port_out_00, port_out_01: out std_logic_vector(7 downto 0);
		O0, O1, O2, O3:out std_logic_vector(6 downto 0)
);
end prueba_memoria;




architecture arch_prueba of prueba_memoria is



component memoria 

port
(

address : in  std_logic_vector(7 downto 0);
data_in: in  std_logic_vector(7 downto 0);
write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0
clock : in std_logic;
reset: in std_logic;
port_in: in  std_logic_vector(7 downto 0);

data_out: buffer std_logic_vector(7 downto 0);
port_out_00,port_out_01 : out std_logic_vector(7 downto 0);

port_in_00, port_in_01 :in std_LOGIC_VECTOR(7 downto 0)
		  
);
end component;


component deco_vhdl
    Port ( 
        
        entrada : in STD_LOGIC_VECTOR (3 downto 0);
        salida : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;


signal X: std_logic_vector(7 downto 0);


begin

display1c: deco_vhdl port map (entrada => address(3 downto 0), salida => display1);
display2c: deco_vhdl port map (entrada => address(7 downto 4), salida => display2);
display3c: deco_vhdl port map (entrada => data_out(3 downto 0), salida => display3);
display4c: deco_vhdl port map (entrada => data_out(7 downto 4), salida => display4);


U0: memoria port map (
address => address,
data_in => data_in,
write1 => write1,
clock => clock,
reset => reset,
port_in=>port_in,
port_in_00 => port_in_00,
port_in_01 => port_in_01,
data_out => data_out,
port_out_00 => port_out_00,
port_out_01 => port_out_01);

 
end arch_prueba;
