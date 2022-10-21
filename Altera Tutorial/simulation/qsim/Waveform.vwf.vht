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
-- Generated on "10/21/2022 13:01:11"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          PWM_ctrl_example
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY PWM_ctrl_example_vhd_vec_tst IS
END PWM_ctrl_example_vhd_vec_tst;
ARCHITECTURE PWM_ctrl_example_arch OF PWM_ctrl_example_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL LwheelB : STD_LOGIC;
SIGNAL LwheelF : STD_LOGIC;
SIGNAL Ma0 : STD_LOGIC;
SIGNAL Ma1 : STD_LOGIC;
SIGNAL Mb0 : STD_LOGIC;
SIGNAL Mb1 : STD_LOGIC;
SIGNAL PWM_Motor_1KHz : STD_LOGIC;
SIGNAL RwheelB : STD_LOGIC;
SIGNAL RwheelF : STD_LOGIC;
COMPONENT PWM_ctrl_example
	PORT (
	LwheelB : OUT STD_LOGIC;
	LwheelF : OUT STD_LOGIC;
	Ma0 : IN STD_LOGIC;
	Ma1 : IN STD_LOGIC;
	Mb0 : IN STD_LOGIC;
	Mb1 : IN STD_LOGIC;
	PWM_Motor_1KHz : IN STD_LOGIC;
	RwheelB : OUT STD_LOGIC;
	RwheelF : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : PWM_ctrl_example
	PORT MAP (
-- list connections between master ports and signals
	LwheelB => LwheelB,
	LwheelF => LwheelF,
	Ma0 => Ma0,
	Ma1 => Ma1,
	Mb0 => Mb0,
	Mb1 => Mb1,
	PWM_Motor_1KHz => PWM_Motor_1KHz,
	RwheelB => RwheelB,
	RwheelF => RwheelF
	);

-- PWM_Motor_1KHz
t_prcs_PWM_Motor_1KHz: PROCESS
BEGIN
LOOP
	PWM_Motor_1KHz <= '0';
	WAIT FOR 4000 ps;
	PWM_Motor_1KHz <= '1';
	WAIT FOR 16000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_PWM_Motor_1KHz;

-- Ma0
t_prcs_Ma0: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		Ma0 <= '0';
		WAIT FOR 80000 ps;
		Ma0 <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	Ma0 <= '0';
WAIT;
END PROCESS t_prcs_Ma0;

-- Ma1
t_prcs_Ma1: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		Ma1 <= '0';
		WAIT FOR 60000 ps;
		Ma1 <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	Ma1 <= '0';
WAIT;
END PROCESS t_prcs_Ma1;

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

-- Mb1
t_prcs_Mb1: PROCESS
BEGIN
LOOP
	Mb1 <= '0';
	WAIT FOR 20000 ps;
	Mb1 <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Mb1;
END PWM_ctrl_example_arch;
