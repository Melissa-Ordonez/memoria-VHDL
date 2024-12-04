library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria is

port
(

address : in  std_logic_vector(7 downto 0);
data_in: in  std_logic_vector(7 downto 0);
write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0
clock : in std_logic;
reset: in std_logic;
port_in: in std_logic_vector(7 downto 0);


data_out: buffer std_logic_vector(7 downto 0);
port_out_00,port_out_01 : out std_logic_vector(7 downto 0);

port_in_00, port_in_01 : in std_logic_vector(7 downto 0)
       
);
end memoria;


architecture arch_memoria of memoria is

signal rom_data_out,rw_data_out : std_logic_vector(7 downto 0);

component ports_memory 
port(
address : in  std_logic_vector(7 downto 0);
data_in: in  std_logic_vector(7 downto 0);
write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0
clock : in std_logic;
reset: in std_logic;

port_out_00,port_out_01 : out std_logic_vector(7 downto 0)
);
end component;

component rw_96 
port(

address : in  std_logic_vector(7 downto 0);
data_in: in  std_logic_vector(7 downto 0);
write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0

-- Output ports
clock : in std_logic;
data_out : out std_logic_vector(7 downto 0)
);
end component;

component final 
port(

address : in  std_logic_vector(7 downto 0);

-- Output ports
clock : in std_logic;
data_out : out std_logic_vector(7 downto 0)
);
end component;

begin

rom_out: final port map(data_out=>rom_data_out  , address => address, clock => clock);
rw_out: rw_96 port map(data_out => rw_data_out, address => address, clock => clock, data_in => data_in, write1 => write1);


MUX1 : process (address, rom_data_out, rw_data_out,

port_in_00, port_in_01)

begin
    if ((to_integer(unsigned(address)) >= 0) and (to_integer(unsigned(address)) <= 127)) then
        data_out <= rom_data_out;
    elsif ((to_integer(unsigned(address)) >= 128) and (to_integer(unsigned(address)) <= 223)) then
        data_out <= rw_data_out;
    elsif (address = x"F0") then data_out <= port_in_00;
    elsif (address = x"F1") then data_out <= port_in_01;

    else   data_out <= x"00";
    end if;
end process;



end arch_memoria;