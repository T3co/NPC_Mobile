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

-- DATE "10/06/2022 19:38:17"

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

ENTITY 	PWM_ctrl_example IS
    PORT (
	RwheelF : OUT std_logic;
	PWM_Motor_1KHz : IN std_logic;
	Ma0 : IN std_logic;
	Ma1 : IN std_logic;
	Mb0 : IN std_logic;
	Mb1 : IN std_logic;
	LwheelF : OUT std_logic;
	LwheelB : OUT std_logic;
	RwheelB : OUT std_logic
	);
END PWM_ctrl_example;

ARCHITECTURE structure OF PWM_ctrl_example IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RwheelF : std_logic;
SIGNAL ww_PWM_Motor_1KHz : std_logic;
SIGNAL ww_Ma0 : std_logic;
SIGNAL ww_Ma1 : std_logic;
SIGNAL ww_Mb0 : std_logic;
SIGNAL ww_Mb1 : std_logic;
SIGNAL ww_LwheelF : std_logic;
SIGNAL ww_LwheelB : std_logic;
SIGNAL ww_RwheelB : std_logic;
SIGNAL \RwheelF~output_o\ : std_logic;
SIGNAL \LwheelF~output_o\ : std_logic;
SIGNAL \LwheelB~output_o\ : std_logic;
SIGNAL \RwheelB~output_o\ : std_logic;
SIGNAL \PWM_Motor_1KHz~input_o\ : std_logic;
SIGNAL \Mb1~input_o\ : std_logic;
SIGNAL \Mb0~input_o\ : std_logic;
SIGNAL \inst|RwheelF~0_combout\ : std_logic;
SIGNAL \Ma1~input_o\ : std_logic;
SIGNAL \Ma0~input_o\ : std_logic;
SIGNAL \inst|LwheelF~0_combout\ : std_logic;
SIGNAL \inst|LwheelB~0_combout\ : std_logic;
SIGNAL \inst|RwheelB~0_combout\ : std_logic;

BEGIN

RwheelF <= ww_RwheelF;
ww_PWM_Motor_1KHz <= PWM_Motor_1KHz;
ww_Ma0 <= Ma0;
ww_Ma1 <= Ma1;
ww_Mb0 <= Mb0;
ww_Mb1 <= Mb1;
LwheelF <= ww_LwheelF;
LwheelB <= ww_LwheelB;
RwheelB <= ww_RwheelB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RwheelF~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|RwheelF~0_combout\,
	devoe => ww_devoe,
	o => \RwheelF~output_o\);

\LwheelF~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|LwheelF~0_combout\,
	devoe => ww_devoe,
	o => \LwheelF~output_o\);

\LwheelB~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|LwheelB~0_combout\,
	devoe => ww_devoe,
	o => \LwheelB~output_o\);

\RwheelB~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|RwheelB~0_combout\,
	devoe => ww_devoe,
	o => \RwheelB~output_o\);

\PWM_Motor_1KHz~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PWM_Motor_1KHz,
	o => \PWM_Motor_1KHz~input_o\);

\Mb1~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mb1,
	o => \Mb1~input_o\);

\Mb0~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Mb0,
	o => \Mb0~input_o\);

\inst|RwheelF~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|RwheelF~0_combout\ = (\PWM_Motor_1KHz~input_o\ & (\Mb1~input_o\ & !\Mb0~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PWM_Motor_1KHz~input_o\,
	datab => \Mb1~input_o\,
	datad => \Mb0~input_o\,
	combout => \inst|RwheelF~0_combout\);

\Ma1~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ma1,
	o => \Ma1~input_o\);

\Ma0~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ma0,
	o => \Ma0~input_o\);

\inst|LwheelF~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|LwheelF~0_combout\ = (\PWM_Motor_1KHz~input_o\ & (\Ma1~input_o\ & !\Ma0~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PWM_Motor_1KHz~input_o\,
	datab => \Ma1~input_o\,
	datad => \Ma0~input_o\,
	combout => \inst|LwheelF~0_combout\);

\inst|LwheelB~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|LwheelB~0_combout\ = (\PWM_Motor_1KHz~input_o\ & (\Ma0~input_o\ & !\Ma1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PWM_Motor_1KHz~input_o\,
	datab => \Ma0~input_o\,
	datad => \Ma1~input_o\,
	combout => \inst|LwheelB~0_combout\);

\inst|RwheelB~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|RwheelB~0_combout\ = (\PWM_Motor_1KHz~input_o\ & (\Mb0~input_o\ & !\Mb1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PWM_Motor_1KHz~input_o\,
	datab => \Mb0~input_o\,
	datad => \Mb1~input_o\,
	combout => \inst|RwheelB~0_combout\);

ww_RwheelF <= \RwheelF~output_o\;

ww_LwheelF <= \LwheelF~output_o\;

ww_LwheelB <= \LwheelB~output_o\;

ww_RwheelB <= \RwheelB~output_o\;
END structure;


