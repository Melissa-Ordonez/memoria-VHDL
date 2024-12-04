library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity rw_96 is


port
(

address : in  std_logic_vector(7 downto 0);
data_in: in  std_logic_vector(7 downto 0);
write1: in std_logic;   -- permite escribir datos cuando esta en 1 y lee los datos en 0

-- Output ports
clock : in std_logic;
data_out : out std_logic_vector(7 downto 0)
);
end rw_96;



architecture arch_rw_96 of rw_96 is


type rw_type is array (128 to 223) of std_logic_vector(7 downto 0);
signal RW : rw_type;
signal EN : std_logic;

begin

process (address)

begin
if ( (to_integer(unsigned(address)) >= 128) and(to_integer(unsigned(address)) <= 223)) then
EN <= '1';
else
EN <= '0';
end if;
end process;

 process (clock)
begin
if (clock'event and clock='1') then
if (EN='1' and write1='1') then
RW(to_integer(unsigned(address))) <= data_in;
elsif (EN='1' and write1='0') then
data_out <= RW(to_integer(unsigned(address)));
end if;
end if;
end process;


end arch_rw_96;
