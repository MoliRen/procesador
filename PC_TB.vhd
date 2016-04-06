--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:52 04/05/2016
-- Design Name:   
-- Module Name:   C:/Users/utp/Desktop/procesador-master/Procesador/PC_TB.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PC_TB IS
END PC_TB;
 
ARCHITECTURE behavior OF PC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         PC_IN : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PC_OUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal PC_OUT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PC_IN => PC_IN,
          CLK => CLK,
          RST => RST,
          PC_OUT => PC_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	
      wait for CLK_period*10;
		
		RST <= '1';
		PC_IN <= "11111111111111111111111111111111";
		
		

		 wait for CLK_period*10;
		
		RST <= '0';
		PC_IN <= "11111111111111111111111111111111";
		
		
		 wait for CLK_period*10;
		
		RST <= '0';
		PC_IN <= "00000000000000000000000000000000";
		
		
      -- insert stimulus here 



      wait;
   end process;

END;
