library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity final is


port
(

address : in  std_logic_vector(7 downto 0);

-- Output ports
clock : in std_logic;
data_out : out std_logic_vector(7 downto 0)
);
end final;



architecture arch_final of final is

constant LDA_IMM : std_logic_vector (7 downto 0) := x"86";
constant LDA_DIR : std_logic_vector (7 downto 0) := x"87";
constant LDB_IMM : std_logic_vector (7 downto 0) := x"88";
constant LDB_DIR : std_logic_vector (7 downto 0) := x"89";
constant STA_DIR : std_logic_vector (7 downto 0) := x"96";
constant STB_DIR : std_logic_vector (7 downto 0) := x"97";

signal EN : std_logic;

type ROM_TYPE is array ( 0 to 127) of std_logic_vector(7 downto 0);

constant ROM: ROM_TYPE :=( 0=> LDA_IMM,
1=> X"11",
2=> X"22",
3=> STA_DIR,
4=> X"44",
5=> X"55",
6=> X"66",
others=> x"FA" );

begin
enable : process (address)
begin

if ((to_integer(unsigned(address)) >= 0) and (to_integer(unsigned(address)) <= 127)) then
EN <= '1';
else
EN <= '0';
end if;
end process;


memory : process (clock)
begin
if (clock'event and clock='1') then
if (EN='1') then
data_out <= ROM(to_integer(unsigned(address)));
end if;
end if;
end process;

end arch_final;
