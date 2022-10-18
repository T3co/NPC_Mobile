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
-- Generated on "10/04/2022 15:31:32"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Motor_Ctrl
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Motor_Ctrl_vhd_vec_tst IS
END Motor_Ctrl_vhd_vec_tst;
ARCHITECTURE Motor_Ctrl_arch OF Motor_Ctrl_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Lwheel : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Ma0 : STD_LOGIC;
SIGNAL Ma1 : STD_LOGIC;
SIGNAL Mb0 : STD_LOGIC;
SIGNAL Mb1 : STD_LOGIC;
SIGNAL PWM_1KHz : STD_LOGIC;
SIGNAL Rwheel : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Motor_Ctrl
	PORT (
	Lwheel : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	Ma0 : IN STD_LOGIC;
	Ma1 : IN STD_LOGIC;
	Mb0 : IN STD_LOGIC;
	Mb1 : IN STD_LOGIC;
	PWM_1KHz : IN STD_LOGIC;
	Rwheel : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Motor_Ctrl
	PORT MAP (
-- list connections between master ports and signals
	Lwheel => Lwheel,
	Ma0 => Ma0,
	Ma1 => Ma1,
	Mb0 => Mb0,
	Mb1 => Mb1,
	PWM_1KHz => PWM_1KHz,
	Rwheel => Rwheel
	);

-- PWM_1KHz
t_prcs_PWM_1KHz: PROCESS
BEGIN
LOOP
	PWM_1KHz <= '0';
	WAIT FOR 5000 ps;
	PWM_1KHz <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_PWM_1KHz;

-- Mb1
t_prcs_Mb1: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		Mb1 <= '0';
		WAIT FOR 80000 ps;
		Mb1 <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	Mb1 <= '0';
WAIT;
END PROCESS t_prcs_Mb1;

-- Mb0
t_prcs_Mb0: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		Mb0 <= '0';
		WAIT FOR 40000 ps;
		Mb0 <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	Mb0 <= '0';
WAIT;
END PROCESS t_prcs_Mb0;

-- Ma1
t_prcs_Ma1: PROCESS
BEGIN
LOOP
	Ma1 <= '0';
	WAIT FOR 20000 ps;
	Ma1 <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Ma1;

-- Ma0
t_prcs_Ma0: PROCESS
BEGIN
LOOP
	Ma0 <= '0';
	WAIT FOR 10000 ps;
	Ma0 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Ma0;
END Motor_Ctrl_arch;
