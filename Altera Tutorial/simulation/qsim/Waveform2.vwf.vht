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
-- Generated on "03/26/2023 16:05:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          pmod_temp_sensor_tcn75a
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY pmod_temp_sensor_tcn75a_vhd_vec_tst IS
END pmod_temp_sensor_tcn75a_vhd_vec_tst;
ARCHITECTURE pmod_temp_sensor_tcn75a_arch OF pmod_temp_sensor_tcn75a_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL i2c_ack_err : STD_LOGIC;
SIGNAL reset_n : STD_LOGIC;
SIGNAL scl : STD_LOGIC;
SIGNAL sda : STD_LOGIC;
SIGNAL temperature : STD_LOGIC_VECTOR(8 DOWNTO 0);
COMPONENT pmod_temp_sensor_tcn75a
	PORT (
	clk : IN STD_LOGIC;
	i2c_ack_err : OUT STD_LOGIC;
	reset_n : IN STD_LOGIC;
	scl : INOUT STD_LOGIC;
	sda : INOUT STD_LOGIC;
	temperature : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : pmod_temp_sensor_tcn75a
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	i2c_ack_err => i2c_ack_err,
	reset_n => reset_n,
	scl => scl,
	sda => sda,
	temperature => temperature
	);
END pmod_temp_sensor_tcn75a_arch;
