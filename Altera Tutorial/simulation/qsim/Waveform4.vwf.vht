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
-- Generated on "03/29/2023 12:59:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          data_spliter
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY data_spliter_vhd_vec_tst IS
END data_spliter_vhd_vec_tst;
ARCHITECTURE data_spliter_arch OF data_spliter_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL data : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Laser : STD_LOGIC;
SIGNAL motor : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL servo : STD_LOGIC_VECTOR(5 DOWNTO 3);
SIGNAL speedMotor : STD_LOGIC;
COMPONENT data_spliter
	PORT (
	data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Laser : BUFFER STD_LOGIC;
	motor : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	servo : BUFFER STD_LOGIC_VECTOR(5 DOWNTO 3);
	speedMotor : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : data_spliter
	PORT MAP (
-- list connections between master ports and signals
	data => data,
	Laser => Laser,
	motor => motor,
	servo => servo,
	speedMotor => speedMotor
	);
-- data[7]
t_prcs_data_7: PROCESS
BEGIN
	data(7) <= '0';
WAIT;
END PROCESS t_prcs_data_7;
-- data[6]
t_prcs_data_6: PROCESS
BEGIN
	data(6) <= '0';
WAIT;
END PROCESS t_prcs_data_6;
-- data[5]
t_prcs_data_5: PROCESS
BEGIN
	data(5) <= '0';
	WAIT FOR 640000 ps;
	data(5) <= '1';
WAIT;
END PROCESS t_prcs_data_5;
-- data[4]
t_prcs_data_4: PROCESS
BEGIN
	data(4) <= '0';
	WAIT FOR 320000 ps;
	data(4) <= '1';
	WAIT FOR 320000 ps;
	data(4) <= '0';
	WAIT FOR 320000 ps;
	data(4) <= '1';
WAIT;
END PROCESS t_prcs_data_4;
-- data[3]
t_prcs_data_3: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		data(3) <= '0';
		WAIT FOR 160000 ps;
		data(3) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	data(3) <= '0';
WAIT;
END PROCESS t_prcs_data_3;
-- data[2]
t_prcs_data_2: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		data(2) <= '0';
		WAIT FOR 80000 ps;
		data(2) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	data(2) <= '0';
WAIT;
END PROCESS t_prcs_data_2;
-- data[1]
t_prcs_data_1: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		data(1) <= '0';
		WAIT FOR 40000 ps;
		data(1) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	data(1) <= '0';
WAIT;
END PROCESS t_prcs_data_1;
-- data[0]
t_prcs_data_0: PROCESS
BEGIN
LOOP
	data(0) <= '0';
	WAIT FOR 20000 ps;
	data(0) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_data_0;
END data_spliter_arch;
