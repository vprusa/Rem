----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:59 09/11/2014 
-- Design Name: 
-- Module Name:    random - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random is
		generic ( width : integer :=  8 ); 
 Port (
		CLK : in  STD_LOGIC;
		RANDOM_NMB : out  STD_LOGIC_VECTOR (7 downto 0)
		);
end random;

architecture Behavioral of random is

begin
process(CLK)
variable rand_temp : std_logic_vector(7 downto 0):=(4 => '1',2 => '1',others => '0');
variable temp : std_logic := '0';
variable temp2 : std_logic := '0';
begin
	if rising_edge(CLK) then
		temp := rand_temp(width-1) xor rand_temp(width-2);
		temp2 := rand_temp(width-3) xor temp;
		rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
		rand_temp(0) := temp2;
	end if;
	RANDOM_NMB <= rand_temp;
end process;

end Behavioral;