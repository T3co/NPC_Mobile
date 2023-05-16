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
-- Generated on "05/17/2023 01:22:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Laser_Bit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Laser_Bit_vhd_vec_tst IS
END Laser_Bit_vhd_vec_tst;
ARCHITECTURE Laser_Bit_arch OF Laser_Bit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Leds : STD_LOGIC;
SIGNAL Lout : STD_LOGIC;
COMPONENT Laser_Bit
	PORT (
	Leds : IN STD_LOGIC;
	Lout : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Laser_Bit
	PORT MAP (
-- list connections between master ports and signals
	Leds => Leds,
	Lout => Lout
	);

-- Leds
t_prcs_Leds: PROCESS
BEGIN
LOOP
	Leds <= '0';
	WAIT FOR 20000 ps;
	Leds <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Leds;
END Laser_Bit_arch;
