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
-- Generated on "05/17/2023 00:49:08"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          servo_control
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY servo_control_vhd_vec_tst IS
END servo_control_vhd_vec_tst;
ARCHITECTURE servo_control_arch OF servo_control_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL degree : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL fOut : STD_LOGIC;
COMPONENT servo_control
	PORT (
	clk : IN STD_LOGIC;
	degree : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	fOut : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : servo_control
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	degree => degree,
	fOut => fOut
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 50000 ps;
	clk <= '1';
	WAIT FOR 50000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- degree[2]
t_prcs_degree_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		degree(2) <= '0';
		WAIT FOR 40000 ps;
		degree(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	degree(2) <= '0';
WAIT;
END PROCESS t_prcs_degree_2;
-- degree[1]
t_prcs_degree_1: PROCESS
BEGIN
LOOP
	degree(1) <= '0';
	WAIT FOR 20000 ps;
	degree(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_degree_1;
-- degree[0]
t_prcs_degree_0: PROCESS
BEGIN
LOOP
	degree(0) <= '0';
	WAIT FOR 10000 ps;
	degree(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_degree_0;
END servo_control_arch;
