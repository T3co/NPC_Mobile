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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"

-- DATE "03/29/2023 12:59:31"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	data_spliter IS
    PORT (
	data : IN std_logic_vector(7 DOWNTO 0);
	motor : BUFFER std_logic_vector(2 DOWNTO 0);
	servo : BUFFER std_logic_vector(5 DOWNTO 3);
	speedMotor : BUFFER std_logic;
	Laser : BUFFER std_logic
	);
END data_spliter;

ARCHITECTURE structure OF data_spliter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_motor : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_servo : std_logic_vector(5 DOWNTO 3);
SIGNAL ww_speedMotor : std_logic;
SIGNAL ww_Laser : std_logic;
SIGNAL \motor[0]~output_o\ : std_logic;
SIGNAL \motor[1]~output_o\ : std_logic;
SIGNAL \motor[2]~output_o\ : std_logic;
SIGNAL \servo[3]~output_o\ : std_logic;
SIGNAL \servo[4]~output_o\ : std_logic;
SIGNAL \servo[5]~output_o\ : std_logic;
SIGNAL \speedMotor~output_o\ : std_logic;
SIGNAL \Laser~output_o\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;

BEGIN

ww_data <= data;
motor <= ww_motor;
servo <= ww_servo;
speedMotor <= ww_speedMotor;
Laser <= ww_Laser;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\motor[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[0]~input_o\,
	devoe => ww_devoe,
	o => \motor[0]~output_o\);

\motor[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[1]~input_o\,
	devoe => ww_devoe,
	o => \motor[1]~output_o\);

\motor[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[2]~input_o\,
	devoe => ww_devoe,
	o => \motor[2]~output_o\);

\servo[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[4]~input_o\,
	devoe => ww_devoe,
	o => \servo[3]~output_o\);

\servo[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[5]~input_o\,
	devoe => ww_devoe,
	o => \servo[4]~output_o\);

\servo[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[6]~input_o\,
	devoe => ww_devoe,
	o => \servo[5]~output_o\);

\speedMotor~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[3]~input_o\,
	devoe => ww_devoe,
	o => \speedMotor~output_o\);

\Laser~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data[7]~input_o\,
	devoe => ww_devoe,
	o => \Laser~output_o\);

\data[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

\data[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

\data[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

\data[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(4),
	o => \data[4]~input_o\);

\data[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(5),
	o => \data[5]~input_o\);

\data[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(6),
	o => \data[6]~input_o\);

\data[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

\data[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(7),
	o => \data[7]~input_o\);

ww_motor(0) <= \motor[0]~output_o\;

ww_motor(1) <= \motor[1]~output_o\;

ww_motor(2) <= \motor[2]~output_o\;

ww_servo(3) <= \servo[3]~output_o\;

ww_servo(4) <= \servo[4]~output_o\;

ww_servo(5) <= \servo[5]~output_o\;

ww_speedMotor <= \speedMotor~output_o\;

ww_Laser <= \Laser~output_o\;
END structure;


