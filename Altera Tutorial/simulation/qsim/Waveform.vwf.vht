-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/01/2022 22:22:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Altera_Tutorial_Schematic
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Altera_Tutorial_Schematic_vhd_vec_tst IS
END Altera_Tutorial_Schematic_vhd_vec_tst;
ARCHITECTURE Altera_Tutorial_Schematic_arch OF Altera_Tutorial_Schematic_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL breatheLED : STD_LOGIC;
SIGNAL clk50Mhz : STD_LOGIC;
SIGNAL d : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL esp_rx : STD_LOGIC;
SIGNAL esp_tx : STD_LOGIC;
SIGNAL M_segH : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL M_segL : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL pwm_output : STD_LOGIC;
SIGNAL r_segH : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL r_segL : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT Altera_Tutorial_Schematic
	PORT (
	breatheLED : OUT STD_LOGIC;
	clk50Mhz : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	esp_rx : OUT STD_LOGIC;
	esp_tx : IN STD_LOGIC;
	M_segH : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	M_segL : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	pwm_output : OUT STD_LOGIC;
	r_segH : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	r_segL : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Altera_Tutorial_Schematic
	PORT MAP (
-- list connections between master ports and signals
	breatheLED => breatheLED,
	clk50Mhz => clk50Mhz,
	d => d,
	esp_rx => esp_rx,
	esp_tx => esp_tx,
	M_segH => M_segH,
	M_segL => M_segL,
	pwm_output => pwm_output,
	r_segH => r_segH,
	r_segL => r_segL
	);

-- clk50Mhz
t_prcs_clk50Mhz: PROCESS
BEGIN
LOOP
	clk50Mhz <= '0';
	WAIT FOR 5000 ps;
	clk50Mhz <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk50Mhz;
END Altera_Tutorial_Schematic_arch;
