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
-- Generated on "12/17/2022 17:05:02"
                                                             
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
SIGNAL Motors : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL PWM_Motor_1KHz : STD_LOGIC;
SIGNAL RwheelB : STD_LOGIC;
SIGNAL RwheelF : STD_LOGIC;
COMPONENT PWM_ctrl_example
	PORT (
	LwheelB : OUT STD_LOGIC;
	LwheelF : OUT STD_LOGIC;
	Motors : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
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
	Motors => Motors,
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
-- Motors[3]
t_prcs_Motors_3: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		Motors(3) <= '0';
		WAIT FOR 80000 ps;
		Motors(3) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	Motors(3) <= '0';
WAIT;
END PROCESS t_prcs_Motors_3;
-- Motors[2]
t_prcs_Motors_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		Motors(2) <= '0';
		WAIT FOR 40000 ps;
		Motors(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	Motors(2) <= '0';
WAIT;
END PROCESS t_prcs_Motors_2;
-- Motors[1]
t_prcs_Motors_1: PROCESS
BEGIN
LOOP
	Motors(1) <= '0';
	WAIT FOR 20000 ps;
	Motors(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Motors_1;
-- Motors[0]
t_prcs_Motors_0: PROCESS
BEGIN
LOOP
	Motors(0) <= '0';
	WAIT FOR 10000 ps;
	Motors(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Motors_0;
END PWM_ctrl_example_arch;
