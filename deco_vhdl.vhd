library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deco_vhdl is
    Port ( 
        entrada : in STD_LOGIC_VECTOR (3 downto 0);
        salida : out STD_LOGIC_VECTOR (7 downto 0)
    );
end deco_vhdl;

architecture Behavioral of deco_vhdl is



    type matriz_segmentos is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
    constant segmentos : matriz_segmentos := (
"00000011", -- 0
"10011111", -- 1
"00100101", -- 2
"00001101", -- 3
"10011001", -- 4
"01001001", -- 5
"01000001", -- 6
"00011111", -- 7
"00000001", -- 8
"00001001", -- 9
"00010001", -- A
"11000001", -- B
"01100011", -- C
"10000101", -- D
"01100001", -- E
"01110001"  -- F
    );
	 
	 
	 
begin

     process(entrada)
    begin
             case entrada is
                when "0000" => salida <= segmentos(0);
                when "0001" => salida <= segmentos(1);
                when "0010" => salida <= segmentos(2);
                when "0011" => salida <= segmentos(3);
                when "0100" => salida <= segmentos(4);
                when "0101" => salida <= segmentos(5);
                when "0110" => salida <= segmentos(6);
                when "0111" => salida <= segmentos(7);
                when "1000" => salida <= segmentos(8);
                when "1001" => salida <= segmentos(9);
                when "1010" => salida <= segmentos(10);
                when "1011" => salida <= segmentos(11);
                when "1100" => salida <= segmentos(12);
                when "1101" => salida <= segmentos(13);
                when "1110" => salida <= segmentos(14);
                when "1111" => salida <= segmentos(15);
                when others => salida <= "00000000";
            end case;
        
    end process;
	 
	 

end Behavioral;