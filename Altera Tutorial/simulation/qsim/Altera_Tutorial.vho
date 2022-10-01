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

-- DATE "10/01/2022 22:22:13"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Altera_Tutorial_Schematic IS
    PORT (
	esp_rx : OUT std_logic;
	clk50Mhz : IN std_logic;
	d : IN std_logic_vector(7 DOWNTO 0);
	breatheLED : OUT std_logic;
	pwm_output : OUT std_logic;
	M_segH : OUT std_logic_vector(6 DOWNTO 0);
	M_segL : OUT std_logic_vector(6 DOWNTO 0);
	r_segH : OUT std_logic_vector(6 DOWNTO 0);
	esp_tx : IN std_logic;
	r_segL : OUT std_logic_vector(6 DOWNTO 0)
	);
END Altera_Tutorial_Schematic;

ARCHITECTURE structure OF Altera_Tutorial_Schematic IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_esp_rx : std_logic;
SIGNAL ww_clk50Mhz : std_logic;
SIGNAL ww_d : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_breatheLED : std_logic;
SIGNAL ww_pwm_output : std_logic;
SIGNAL ww_M_segH : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_M_segL : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_r_segH : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_esp_tx : std_logic;
SIGNAL ww_r_segL : std_logic_vector(6 DOWNTO 0);
SIGNAL \esp_rx~output_o\ : std_logic;
SIGNAL \breatheLED~output_o\ : std_logic;
SIGNAL \pwm_output~output_o\ : std_logic;
SIGNAL \M_segH[6]~output_o\ : std_logic;
SIGNAL \M_segH[5]~output_o\ : std_logic;
SIGNAL \M_segH[4]~output_o\ : std_logic;
SIGNAL \M_segH[3]~output_o\ : std_logic;
SIGNAL \M_segH[2]~output_o\ : std_logic;
SIGNAL \M_segH[1]~output_o\ : std_logic;
SIGNAL \M_segH[0]~output_o\ : std_logic;
SIGNAL \M_segL[6]~output_o\ : std_logic;
SIGNAL \M_segL[5]~output_o\ : std_logic;
SIGNAL \M_segL[4]~output_o\ : std_logic;
SIGNAL \M_segL[3]~output_o\ : std_logic;
SIGNAL \M_segL[2]~output_o\ : std_logic;
SIGNAL \M_segL[1]~output_o\ : std_logic;
SIGNAL \M_segL[0]~output_o\ : std_logic;
SIGNAL \r_segH[6]~output_o\ : std_logic;
SIGNAL \r_segH[5]~output_o\ : std_logic;
SIGNAL \r_segH[4]~output_o\ : std_logic;
SIGNAL \r_segH[3]~output_o\ : std_logic;
SIGNAL \r_segH[2]~output_o\ : std_logic;
SIGNAL \r_segH[1]~output_o\ : std_logic;
SIGNAL \r_segH[0]~output_o\ : std_logic;
SIGNAL \r_segL[6]~output_o\ : std_logic;
SIGNAL \r_segL[5]~output_o\ : std_logic;
SIGNAL \r_segL[4]~output_o\ : std_logic;
SIGNAL \r_segL[3]~output_o\ : std_logic;
SIGNAL \r_segL[2]~output_o\ : std_logic;
SIGNAL \r_segL[1]~output_o\ : std_logic;
SIGNAL \r_segL[0]~output_o\ : std_logic;
SIGNAL \clk50Mhz~input_o\ : std_logic;
SIGNAL \3|cnt[0]~8_combout\ : std_logic;
SIGNAL \3|cnt[0]~9\ : std_logic;
SIGNAL \3|cnt[1]~10_combout\ : std_logic;
SIGNAL \3|cnt[1]~11\ : std_logic;
SIGNAL \3|cnt[2]~12_combout\ : std_logic;
SIGNAL \3|cnt[2]~13\ : std_logic;
SIGNAL \3|cnt[3]~14_combout\ : std_logic;
SIGNAL \3|cnt[3]~15\ : std_logic;
SIGNAL \3|cnt[4]~16_combout\ : std_logic;
SIGNAL \3|LessThan0~0_combout\ : std_logic;
SIGNAL \3|cnt[4]~17\ : std_logic;
SIGNAL \3|cnt[5]~18_combout\ : std_logic;
SIGNAL \3|cnt[5]~19\ : std_logic;
SIGNAL \3|cnt[6]~20_combout\ : std_logic;
SIGNAL \3|cnt[6]~21\ : std_logic;
SIGNAL \3|cnt[7]~22_combout\ : std_logic;
SIGNAL \3|LessThan0~1_combout\ : std_logic;
SIGNAL \3|fout~0_combout\ : std_logic;
SIGNAL \3|fout~q\ : std_logic;
SIGNAL \inst|cnt[0]~8_combout\ : std_logic;
SIGNAL \inst7|Add0~0_combout\ : std_logic;
SIGNAL \inst7|Add0~1\ : std_logic;
SIGNAL \inst7|Add0~2_combout\ : std_logic;
SIGNAL \inst7|Add0~3\ : std_logic;
SIGNAL \inst7|Add0~4_combout\ : std_logic;
SIGNAL \inst7|Add0~5\ : std_logic;
SIGNAL \inst7|Add0~6_combout\ : std_logic;
SIGNAL \inst7|Add0~7\ : std_logic;
SIGNAL \inst7|Add0~8_combout\ : std_logic;
SIGNAL \inst7|Add0~9\ : std_logic;
SIGNAL \inst7|Add0~10_combout\ : std_logic;
SIGNAL \inst7|Add0~11\ : std_logic;
SIGNAL \inst7|Add0~12_combout\ : std_logic;
SIGNAL \inst7|Add0~13\ : std_logic;
SIGNAL \inst7|Add0~14_combout\ : std_logic;
SIGNAL \inst7|count~2_combout\ : std_logic;
SIGNAL \inst7|Add0~15\ : std_logic;
SIGNAL \inst7|Add0~16_combout\ : std_logic;
SIGNAL \inst7|Add0~17\ : std_logic;
SIGNAL \inst7|Add0~18_combout\ : std_logic;
SIGNAL \inst7|Add0~19\ : std_logic;
SIGNAL \inst7|Add0~20_combout\ : std_logic;
SIGNAL \inst7|Add0~21\ : std_logic;
SIGNAL \inst7|Add0~22_combout\ : std_logic;
SIGNAL \inst7|Add0~23\ : std_logic;
SIGNAL \inst7|Add0~24_combout\ : std_logic;
SIGNAL \inst7|count~1_combout\ : std_logic;
SIGNAL \inst7|Add0~25\ : std_logic;
SIGNAL \inst7|Add0~26_combout\ : std_logic;
SIGNAL \inst7|count~0_combout\ : std_logic;
SIGNAL \inst7|Equal0~0_combout\ : std_logic;
SIGNAL \inst7|Equal0~1_combout\ : std_logic;
SIGNAL \inst7|Equal0~2_combout\ : std_logic;
SIGNAL \inst7|Add0~27\ : std_logic;
SIGNAL \inst7|Add0~28_combout\ : std_logic;
SIGNAL \inst7|count~3_combout\ : std_logic;
SIGNAL \inst7|Add0~29\ : std_logic;
SIGNAL \inst7|Add0~30_combout\ : std_logic;
SIGNAL \inst7|count~4_combout\ : std_logic;
SIGNAL \inst7|Equal0~3_combout\ : std_logic;
SIGNAL \inst7|Equal0~4_combout\ : std_logic;
SIGNAL \inst7|Add0~31\ : std_logic;
SIGNAL \inst7|Add0~32_combout\ : std_logic;
SIGNAL \inst7|Add0~33\ : std_logic;
SIGNAL \inst7|Add0~34_combout\ : std_logic;
SIGNAL \inst7|count~5_combout\ : std_logic;
SIGNAL \inst7|Add0~35\ : std_logic;
SIGNAL \inst7|Add0~36_combout\ : std_logic;
SIGNAL \inst7|Add0~37\ : std_logic;
SIGNAL \inst7|Add0~38_combout\ : std_logic;
SIGNAL \inst7|count~6_combout\ : std_logic;
SIGNAL \inst7|Equal0~5_combout\ : std_logic;
SIGNAL \inst7|Add0~39\ : std_logic;
SIGNAL \inst7|Add0~40_combout\ : std_logic;
SIGNAL \inst7|count~7_combout\ : std_logic;
SIGNAL \inst7|Add0~41\ : std_logic;
SIGNAL \inst7|Add0~42_combout\ : std_logic;
SIGNAL \inst7|count~8_combout\ : std_logic;
SIGNAL \inst7|Add0~43\ : std_logic;
SIGNAL \inst7|Add0~44_combout\ : std_logic;
SIGNAL \inst7|count~9_combout\ : std_logic;
SIGNAL \inst7|Add0~45\ : std_logic;
SIGNAL \inst7|Add0~46_combout\ : std_logic;
SIGNAL \inst7|count~10_combout\ : std_logic;
SIGNAL \inst7|Equal0~6_combout\ : std_logic;
SIGNAL \inst7|Add0~47\ : std_logic;
SIGNAL \inst7|Add0~48_combout\ : std_logic;
SIGNAL \inst7|Add0~49\ : std_logic;
SIGNAL \inst7|Add0~50_combout\ : std_logic;
SIGNAL \inst7|count~11_combout\ : std_logic;
SIGNAL \inst7|Equal0~7_combout\ : std_logic;
SIGNAL \inst7|Equal0~8_combout\ : std_logic;
SIGNAL \inst7|pulse~0_combout\ : std_logic;
SIGNAL \inst7|pulse~q\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \inst|process_0~0_combout\ : std_logic;
SIGNAL \inst|LessThan9~0_combout\ : std_logic;
SIGNAL \inst|cnt[0]~9\ : std_logic;
SIGNAL \inst|cnt[1]~10_combout\ : std_logic;
SIGNAL \inst|cnt[1]~11\ : std_logic;
SIGNAL \inst|cnt[2]~12_combout\ : std_logic;
SIGNAL \inst|cnt[2]~13\ : std_logic;
SIGNAL \inst|cnt[3]~14_combout\ : std_logic;
SIGNAL \inst|cnt[3]~15\ : std_logic;
SIGNAL \inst|cnt[4]~16_combout\ : std_logic;
SIGNAL \inst|cnt[4]~17\ : std_logic;
SIGNAL \inst|cnt[5]~18_combout\ : std_logic;
SIGNAL \inst|cnt[5]~19\ : std_logic;
SIGNAL \inst|cnt[6]~20_combout\ : std_logic;
SIGNAL \inst|cnt[6]~21\ : std_logic;
SIGNAL \inst|cnt[7]~22_combout\ : std_logic;
SIGNAL \inst|so~0_combout\ : std_logic;
SIGNAL \d[4]~input_o\ : std_logic;
SIGNAL \d[3]~input_o\ : std_logic;
SIGNAL \inst|so~1_combout\ : std_logic;
SIGNAL \d[6]~input_o\ : std_logic;
SIGNAL \d[5]~input_o\ : std_logic;
SIGNAL \inst|so~2_combout\ : std_logic;
SIGNAL \inst|so~3_combout\ : std_logic;
SIGNAL \d[0]~input_o\ : std_logic;
SIGNAL \d[7]~input_o\ : std_logic;
SIGNAL \inst|so~4_combout\ : std_logic;
SIGNAL \d[2]~input_o\ : std_logic;
SIGNAL \d[1]~input_o\ : std_logic;
SIGNAL \inst|so~5_combout\ : std_logic;
SIGNAL \inst|so~6_combout\ : std_logic;
SIGNAL \inst|so~7_combout\ : std_logic;
SIGNAL \inst|so~q\ : std_logic;
SIGNAL \inst9|count[0]~3_combout\ : std_logic;
SIGNAL \inst9|count~2_combout\ : std_logic;
SIGNAL \inst9|count~1_combout\ : std_logic;
SIGNAL \inst9|count[2]~0_combout\ : std_logic;
SIGNAL \inst9|pulse~0_combout\ : std_logic;
SIGNAL \inst9|pulse~1_combout\ : std_logic;
SIGNAL \inst9|pulse~q\ : std_logic;
SIGNAL \inst1|Mux0~0_combout\ : std_logic;
SIGNAL \inst1|Mux1~0_combout\ : std_logic;
SIGNAL \inst1|Mux2~0_combout\ : std_logic;
SIGNAL \inst1|Mux3~0_combout\ : std_logic;
SIGNAL \inst1|Mux4~0_combout\ : std_logic;
SIGNAL \inst1|Mux5~0_combout\ : std_logic;
SIGNAL \inst1|Mux6~0_combout\ : std_logic;
SIGNAL \inst2|Mux0~0_combout\ : std_logic;
SIGNAL \inst2|Mux1~0_combout\ : std_logic;
SIGNAL \inst2|Mux2~0_combout\ : std_logic;
SIGNAL \inst2|Mux3~0_combout\ : std_logic;
SIGNAL \inst2|Mux4~0_combout\ : std_logic;
SIGNAL \inst2|Mux5~0_combout\ : std_logic;
SIGNAL \inst2|Mux6~0_combout\ : std_logic;
SIGNAL \esp_tx~input_o\ : std_logic;
SIGNAL \5|cnt[0]~8_combout\ : std_logic;
SIGNAL \5|cnt[5]~19\ : std_logic;
SIGNAL \5|cnt[6]~20_combout\ : std_logic;
SIGNAL \5|LessThan0~0_combout\ : std_logic;
SIGNAL \5|start~q\ : std_logic;
SIGNAL \5|cnt[6]~21\ : std_logic;
SIGNAL \5|cnt[7]~22_combout\ : std_logic;
SIGNAL \5|tmp[7]~3_combout\ : std_logic;
SIGNAL \5|Equal11~0_combout\ : std_logic;
SIGNAL \5|Equal11~1_combout\ : std_logic;
SIGNAL \5|cnt[0]~9\ : std_logic;
SIGNAL \5|cnt[1]~10_combout\ : std_logic;
SIGNAL \5|cnt[1]~11\ : std_logic;
SIGNAL \5|cnt[2]~12_combout\ : std_logic;
SIGNAL \5|cnt[2]~13\ : std_logic;
SIGNAL \5|cnt[3]~14_combout\ : std_logic;
SIGNAL \5|cnt[3]~15\ : std_logic;
SIGNAL \5|cnt[4]~16_combout\ : std_logic;
SIGNAL \5|cnt[4]~17\ : std_logic;
SIGNAL \5|cnt[5]~18_combout\ : std_logic;
SIGNAL \5|tmp[7]~2_combout\ : std_logic;
SIGNAL \5|data[3]~4_combout\ : std_logic;
SIGNAL \5|tmp[6]~4_combout\ : std_logic;
SIGNAL \5|tmp[0]~5_combout\ : std_logic;
SIGNAL \5|data[3]~0_combout\ : std_logic;
SIGNAL \5|start_bit~0_combout\ : std_logic;
SIGNAL \5|start_bit~1_combout\ : std_logic;
SIGNAL \5|start_bit~q\ : std_logic;
SIGNAL \5|data[3]~1_combout\ : std_logic;
SIGNAL \5|tmp[7]~6_combout\ : std_logic;
SIGNAL \5|stop_bit~0_combout\ : std_logic;
SIGNAL \5|stop_bit~q\ : std_logic;
SIGNAL \5|data[3]~2_combout\ : std_logic;
SIGNAL \5|data[3]~3_combout\ : std_logic;
SIGNAL \5|tmp[6]~17_combout\ : std_logic;
SIGNAL \5|Equal11~2_combout\ : std_logic;
SIGNAL \5|tmp[1]~7_combout\ : std_logic;
SIGNAL \5|tmp[6]~8_combout\ : std_logic;
SIGNAL \5|tmp[2]~9_combout\ : std_logic;
SIGNAL \5|tmp[5]~10_combout\ : std_logic;
SIGNAL \5|tmp[3]~11_combout\ : std_logic;
SIGNAL \inst5|Mux0~0_combout\ : std_logic;
SIGNAL \inst5|Mux1~0_combout\ : std_logic;
SIGNAL \inst5|Mux2~0_combout\ : std_logic;
SIGNAL \inst5|Mux3~0_combout\ : std_logic;
SIGNAL \inst5|Mux4~0_combout\ : std_logic;
SIGNAL \inst5|Mux5~0_combout\ : std_logic;
SIGNAL \inst5|Mux6~0_combout\ : std_logic;
SIGNAL \5|tmp[4]~12_combout\ : std_logic;
SIGNAL \5|tmp[4]~13_combout\ : std_logic;
SIGNAL \5|tmp[5]~14_combout\ : std_logic;
SIGNAL \5|tmp[6]~15_combout\ : std_logic;
SIGNAL \5|tmp[7]~16_combout\ : std_logic;
SIGNAL \inst4|Mux0~0_combout\ : std_logic;
SIGNAL \inst4|Mux1~0_combout\ : std_logic;
SIGNAL \inst4|Mux2~0_combout\ : std_logic;
SIGNAL \inst4|Mux3~0_combout\ : std_logic;
SIGNAL \inst4|Mux4~0_combout\ : std_logic;
SIGNAL \inst4|Mux5~0_combout\ : std_logic;
SIGNAL \inst4|Mux6~0_combout\ : std_logic;
SIGNAL \inst|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \5|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \3|cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \5|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst7|count\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst9|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \5|tmp\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \inst4|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst9|ALT_INV_pulse~q\ : std_logic;
SIGNAL \inst|ALT_INV_so~q\ : std_logic;
SIGNAL \ALT_INV_esp_tx~input_o\ : std_logic;
SIGNAL \5|ALT_INV_Equal11~1_combout\ : std_logic;

BEGIN

esp_rx <= ww_esp_rx;
ww_clk50Mhz <= clk50Mhz;
ww_d <= d;
breatheLED <= ww_breatheLED;
pwm_output <= ww_pwm_output;
M_segH <= ww_M_segH;
M_segL <= ww_M_segL;
r_segH <= ww_r_segH;
ww_esp_tx <= esp_tx;
r_segL <= ww_r_segL;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|ALT_INV_process_0~0_combout\ <= NOT \inst|process_0~0_combout\;
\inst4|ALT_INV_Mux6~0_combout\ <= NOT \inst4|Mux6~0_combout\;
\inst5|ALT_INV_Mux6~0_combout\ <= NOT \inst5|Mux6~0_combout\;
\inst2|ALT_INV_Mux6~0_combout\ <= NOT \inst2|Mux6~0_combout\;
\inst1|ALT_INV_Mux6~0_combout\ <= NOT \inst1|Mux6~0_combout\;
\inst9|ALT_INV_pulse~q\ <= NOT \inst9|pulse~q\;
\inst|ALT_INV_so~q\ <= NOT \inst|so~q\;
\ALT_INV_esp_tx~input_o\ <= NOT \esp_tx~input_o\;
\5|ALT_INV_Equal11~1_combout\ <= NOT \5|Equal11~1_combout\;

\esp_rx~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_so~q\,
	devoe => ww_devoe,
	o => \esp_rx~output_o\);

\breatheLED~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|pulse~q\,
	devoe => ww_devoe,
	o => \breatheLED~output_o\);

\pwm_output~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|ALT_INV_pulse~q\,
	devoe => ww_devoe,
	o => \pwm_output~output_o\);

\M_segH[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[6]~output_o\);

\M_segH[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[5]~output_o\);

\M_segH[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[4]~output_o\);

\M_segH[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[3]~output_o\);

\M_segH[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[2]~output_o\);

\M_segH[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[1]~output_o\);

\M_segH[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \M_segH[0]~output_o\);

\M_segL[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[6]~output_o\);

\M_segL[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[5]~output_o\);

\M_segL[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[4]~output_o\);

\M_segL[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[3]~output_o\);

\M_segL[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[2]~output_o\);

\M_segL[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[1]~output_o\);

\M_segL[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \M_segL[0]~output_o\);

\r_segH[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[6]~output_o\);

\r_segH[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[5]~output_o\);

\r_segH[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[4]~output_o\);

\r_segH[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[3]~output_o\);

\r_segH[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[2]~output_o\);

\r_segH[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[1]~output_o\);

\r_segH[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \r_segH[0]~output_o\);

\r_segL[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[6]~output_o\);

\r_segL[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[5]~output_o\);

\r_segL[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[4]~output_o\);

\r_segL[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[3]~output_o\);

\r_segL[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[2]~output_o\);

\r_segL[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[1]~output_o\);

\r_segL[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \r_segL[0]~output_o\);

\clk50Mhz~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk50Mhz,
	o => \clk50Mhz~input_o\);

\3|cnt[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[0]~8_combout\ = \3|cnt\(0) $ (VCC)
-- \3|cnt[0]~9\ = CARRY(\3|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(0),
	datad => VCC,
	combout => \3|cnt[0]~8_combout\,
	cout => \3|cnt[0]~9\);

\3|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[0]~8_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(0));

\3|cnt[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[1]~10_combout\ = (\3|cnt\(1) & (!\3|cnt[0]~9\)) # (!\3|cnt\(1) & ((\3|cnt[0]~9\) # (GND)))
-- \3|cnt[1]~11\ = CARRY((!\3|cnt[0]~9\) # (!\3|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(1),
	datad => VCC,
	cin => \3|cnt[0]~9\,
	combout => \3|cnt[1]~10_combout\,
	cout => \3|cnt[1]~11\);

\3|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[1]~10_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(1));

\3|cnt[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[2]~12_combout\ = (\3|cnt\(2) & (\3|cnt[1]~11\ $ (GND))) # (!\3|cnt\(2) & (!\3|cnt[1]~11\ & VCC))
-- \3|cnt[2]~13\ = CARRY((\3|cnt\(2) & !\3|cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(2),
	datad => VCC,
	cin => \3|cnt[1]~11\,
	combout => \3|cnt[2]~12_combout\,
	cout => \3|cnt[2]~13\);

\3|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[2]~12_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(2));

\3|cnt[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[3]~14_combout\ = (\3|cnt\(3) & (!\3|cnt[2]~13\)) # (!\3|cnt\(3) & ((\3|cnt[2]~13\) # (GND)))
-- \3|cnt[3]~15\ = CARRY((!\3|cnt[2]~13\) # (!\3|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(3),
	datad => VCC,
	cin => \3|cnt[2]~13\,
	combout => \3|cnt[3]~14_combout\,
	cout => \3|cnt[3]~15\);

\3|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[3]~14_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(3));

\3|cnt[4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[4]~16_combout\ = (\3|cnt\(4) & (\3|cnt[3]~15\ $ (GND))) # (!\3|cnt\(4) & (!\3|cnt[3]~15\ & VCC))
-- \3|cnt[4]~17\ = CARRY((\3|cnt\(4) & !\3|cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(4),
	datad => VCC,
	cin => \3|cnt[3]~15\,
	combout => \3|cnt[4]~16_combout\,
	cout => \3|cnt[4]~17\);

\3|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[4]~16_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(4));

\3|LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|LessThan0~0_combout\ = (!\3|cnt\(1) & (!\3|cnt\(2) & (!\3|cnt\(3) & !\3|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(1),
	datab => \3|cnt\(2),
	datac => \3|cnt\(3),
	datad => \3|cnt\(4),
	combout => \3|LessThan0~0_combout\);

\3|cnt[5]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[5]~18_combout\ = (\3|cnt\(5) & (!\3|cnt[4]~17\)) # (!\3|cnt\(5) & ((\3|cnt[4]~17\) # (GND)))
-- \3|cnt[5]~19\ = CARRY((!\3|cnt[4]~17\) # (!\3|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(5),
	datad => VCC,
	cin => \3|cnt[4]~17\,
	combout => \3|cnt[5]~18_combout\,
	cout => \3|cnt[5]~19\);

\3|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[5]~18_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(5));

\3|cnt[6]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[6]~20_combout\ = (\3|cnt\(6) & (\3|cnt[5]~19\ $ (GND))) # (!\3|cnt\(6) & (!\3|cnt[5]~19\ & VCC))
-- \3|cnt[6]~21\ = CARRY((\3|cnt\(6) & !\3|cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(6),
	datad => VCC,
	cin => \3|cnt[5]~19\,
	combout => \3|cnt[6]~20_combout\,
	cout => \3|cnt[6]~21\);

\3|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[6]~20_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(6));

\3|cnt[7]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|cnt[7]~22_combout\ = \3|cnt\(7) $ (\3|cnt[6]~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \3|cnt\(7),
	cin => \3|cnt[6]~21\,
	combout => \3|cnt[7]~22_combout\);

\3|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|cnt[7]~22_combout\,
	sclr => \3|LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|cnt\(7));

\3|LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|LessThan0~1_combout\ = (\3|cnt\(7) & ((\3|cnt\(6)) # ((!\3|LessThan0~0_combout\ & \3|cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \3|LessThan0~0_combout\,
	datab => \3|cnt\(5),
	datac => \3|cnt\(6),
	datad => \3|cnt\(7),
	combout => \3|LessThan0~1_combout\);

\3|fout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \3|fout~0_combout\ = \3|fout~q\ $ (\3|LessThan0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \3|fout~q\,
	datad => \3|LessThan0~1_combout\,
	combout => \3|fout~0_combout\);

\3|fout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \3|fout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \3|fout~q\);

\inst|cnt[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[0]~8_combout\ = \inst|cnt\(0) $ (VCC)
-- \inst|cnt[0]~9\ = CARRY(\inst|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(0),
	datad => VCC,
	combout => \inst|cnt[0]~8_combout\,
	cout => \inst|cnt[0]~9\);

\inst7|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~0_combout\ = \inst7|count\(0) $ (VCC)
-- \inst7|Add0~1\ = CARRY(\inst7|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(0),
	datad => VCC,
	combout => \inst7|Add0~0_combout\,
	cout => \inst7|Add0~1\);

\inst7|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(0));

\inst7|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~2_combout\ = (\inst7|count\(1) & (!\inst7|Add0~1\)) # (!\inst7|count\(1) & ((\inst7|Add0~1\) # (GND)))
-- \inst7|Add0~3\ = CARRY((!\inst7|Add0~1\) # (!\inst7|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(1),
	datad => VCC,
	cin => \inst7|Add0~1\,
	combout => \inst7|Add0~2_combout\,
	cout => \inst7|Add0~3\);

\inst7|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(1));

\inst7|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~4_combout\ = (\inst7|count\(2) & (\inst7|Add0~3\ $ (GND))) # (!\inst7|count\(2) & (!\inst7|Add0~3\ & VCC))
-- \inst7|Add0~5\ = CARRY((\inst7|count\(2) & !\inst7|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(2),
	datad => VCC,
	cin => \inst7|Add0~3\,
	combout => \inst7|Add0~4_combout\,
	cout => \inst7|Add0~5\);

\inst7|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(2));

\inst7|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~6_combout\ = (\inst7|count\(3) & (!\inst7|Add0~5\)) # (!\inst7|count\(3) & ((\inst7|Add0~5\) # (GND)))
-- \inst7|Add0~7\ = CARRY((!\inst7|Add0~5\) # (!\inst7|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(3),
	datad => VCC,
	cin => \inst7|Add0~5\,
	combout => \inst7|Add0~6_combout\,
	cout => \inst7|Add0~7\);

\inst7|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(3));

\inst7|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~8_combout\ = (\inst7|count\(4) & (\inst7|Add0~7\ $ (GND))) # (!\inst7|count\(4) & (!\inst7|Add0~7\ & VCC))
-- \inst7|Add0~9\ = CARRY((\inst7|count\(4) & !\inst7|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(4),
	datad => VCC,
	cin => \inst7|Add0~7\,
	combout => \inst7|Add0~8_combout\,
	cout => \inst7|Add0~9\);

\inst7|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(4));

\inst7|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~10_combout\ = (\inst7|count\(5) & (!\inst7|Add0~9\)) # (!\inst7|count\(5) & ((\inst7|Add0~9\) # (GND)))
-- \inst7|Add0~11\ = CARRY((!\inst7|Add0~9\) # (!\inst7|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(5),
	datad => VCC,
	cin => \inst7|Add0~9\,
	combout => \inst7|Add0~10_combout\,
	cout => \inst7|Add0~11\);

\inst7|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(5));

\inst7|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~12_combout\ = (\inst7|count\(6) & (\inst7|Add0~11\ $ (GND))) # (!\inst7|count\(6) & (!\inst7|Add0~11\ & VCC))
-- \inst7|Add0~13\ = CARRY((\inst7|count\(6) & !\inst7|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(6),
	datad => VCC,
	cin => \inst7|Add0~11\,
	combout => \inst7|Add0~12_combout\,
	cout => \inst7|Add0~13\);

\inst7|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(6));

\inst7|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~14_combout\ = (\inst7|count\(7) & (!\inst7|Add0~13\)) # (!\inst7|count\(7) & ((\inst7|Add0~13\) # (GND)))
-- \inst7|Add0~15\ = CARRY((!\inst7|Add0~13\) # (!\inst7|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(7),
	datad => VCC,
	cin => \inst7|Add0~13\,
	combout => \inst7|Add0~14_combout\,
	cout => \inst7|Add0~15\);

\inst7|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~2_combout\ = (\inst7|Add0~14_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~14_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~2_combout\);

\inst7|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(7));

\inst7|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~16_combout\ = (\inst7|count\(8) & (\inst7|Add0~15\ $ (GND))) # (!\inst7|count\(8) & (!\inst7|Add0~15\ & VCC))
-- \inst7|Add0~17\ = CARRY((\inst7|count\(8) & !\inst7|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(8),
	datad => VCC,
	cin => \inst7|Add0~15\,
	combout => \inst7|Add0~16_combout\,
	cout => \inst7|Add0~17\);

\inst7|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(8));

\inst7|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~18_combout\ = (\inst7|count\(9) & (!\inst7|Add0~17\)) # (!\inst7|count\(9) & ((\inst7|Add0~17\) # (GND)))
-- \inst7|Add0~19\ = CARRY((!\inst7|Add0~17\) # (!\inst7|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(9),
	datad => VCC,
	cin => \inst7|Add0~17\,
	combout => \inst7|Add0~18_combout\,
	cout => \inst7|Add0~19\);

\inst7|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(9));

\inst7|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~20_combout\ = (\inst7|count\(10) & (\inst7|Add0~19\ $ (GND))) # (!\inst7|count\(10) & (!\inst7|Add0~19\ & VCC))
-- \inst7|Add0~21\ = CARRY((\inst7|count\(10) & !\inst7|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(10),
	datad => VCC,
	cin => \inst7|Add0~19\,
	combout => \inst7|Add0~20_combout\,
	cout => \inst7|Add0~21\);

\inst7|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(10));

\inst7|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~22_combout\ = (\inst7|count\(11) & (!\inst7|Add0~21\)) # (!\inst7|count\(11) & ((\inst7|Add0~21\) # (GND)))
-- \inst7|Add0~23\ = CARRY((!\inst7|Add0~21\) # (!\inst7|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(11),
	datad => VCC,
	cin => \inst7|Add0~21\,
	combout => \inst7|Add0~22_combout\,
	cout => \inst7|Add0~23\);

\inst7|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(11));

\inst7|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~24_combout\ = (\inst7|count\(12) & (\inst7|Add0~23\ $ (GND))) # (!\inst7|count\(12) & (!\inst7|Add0~23\ & VCC))
-- \inst7|Add0~25\ = CARRY((\inst7|count\(12) & !\inst7|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(12),
	datad => VCC,
	cin => \inst7|Add0~23\,
	combout => \inst7|Add0~24_combout\,
	cout => \inst7|Add0~25\);

\inst7|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~1_combout\ = (\inst7|Add0~24_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~24_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~1_combout\);

\inst7|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(12));

\inst7|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~26_combout\ = (\inst7|count\(13) & (!\inst7|Add0~25\)) # (!\inst7|count\(13) & ((\inst7|Add0~25\) # (GND)))
-- \inst7|Add0~27\ = CARRY((!\inst7|Add0~25\) # (!\inst7|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(13),
	datad => VCC,
	cin => \inst7|Add0~25\,
	combout => \inst7|Add0~26_combout\,
	cout => \inst7|Add0~27\);

\inst7|count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~0_combout\ = (\inst7|Add0~26_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~26_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~0_combout\);

\inst7|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(13));

\inst7|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~0_combout\ = (\inst7|count\(13) & (\inst7|count\(12) & (!\inst7|count\(11) & !\inst7|count\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(13),
	datab => \inst7|count\(12),
	datac => \inst7|count\(11),
	datad => \inst7|count\(10),
	combout => \inst7|Equal0~0_combout\);

\inst7|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~1_combout\ = (\inst7|count\(6) & (!\inst7|count\(9) & (!\inst7|count\(8) & !\inst7|count\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(6),
	datab => \inst7|count\(9),
	datac => \inst7|count\(8),
	datad => \inst7|count\(7),
	combout => \inst7|Equal0~1_combout\);

\inst7|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~2_combout\ = (\inst7|count\(5) & (\inst7|count\(4) & (\inst7|count\(3) & \inst7|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(5),
	datab => \inst7|count\(4),
	datac => \inst7|count\(3),
	datad => \inst7|count\(2),
	combout => \inst7|Equal0~2_combout\);

\inst7|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~28_combout\ = (\inst7|count\(14) & (\inst7|Add0~27\ $ (GND))) # (!\inst7|count\(14) & (!\inst7|Add0~27\ & VCC))
-- \inst7|Add0~29\ = CARRY((\inst7|count\(14) & !\inst7|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(14),
	datad => VCC,
	cin => \inst7|Add0~27\,
	combout => \inst7|Add0~28_combout\,
	cout => \inst7|Add0~29\);

\inst7|count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~3_combout\ = (\inst7|Add0~28_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~28_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~3_combout\);

\inst7|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(14));

\inst7|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~30_combout\ = (\inst7|count\(15) & (!\inst7|Add0~29\)) # (!\inst7|count\(15) & ((\inst7|Add0~29\) # (GND)))
-- \inst7|Add0~31\ = CARRY((!\inst7|Add0~29\) # (!\inst7|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(15),
	datad => VCC,
	cin => \inst7|Add0~29\,
	combout => \inst7|Add0~30_combout\,
	cout => \inst7|Add0~31\);

\inst7|count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~4_combout\ = (\inst7|Add0~30_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~30_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~4_combout\);

\inst7|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(15));

\inst7|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~3_combout\ = (\inst7|count\(1) & (\inst7|count\(0) & (\inst7|count\(14) & \inst7|count\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(1),
	datab => \inst7|count\(0),
	datac => \inst7|count\(14),
	datad => \inst7|count\(15),
	combout => \inst7|Equal0~3_combout\);

\inst7|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~4_combout\ = (\inst7|Equal0~0_combout\ & (\inst7|Equal0~1_combout\ & (\inst7|Equal0~2_combout\ & \inst7|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~0_combout\,
	datab => \inst7|Equal0~1_combout\,
	datac => \inst7|Equal0~2_combout\,
	datad => \inst7|Equal0~3_combout\,
	combout => \inst7|Equal0~4_combout\);

\inst7|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~32_combout\ = (\inst7|count\(16) & (\inst7|Add0~31\ $ (GND))) # (!\inst7|count\(16) & (!\inst7|Add0~31\ & VCC))
-- \inst7|Add0~33\ = CARRY((\inst7|count\(16) & !\inst7|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(16),
	datad => VCC,
	cin => \inst7|Add0~31\,
	combout => \inst7|Add0~32_combout\,
	cout => \inst7|Add0~33\);

\inst7|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(16));

\inst7|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~34_combout\ = (\inst7|count\(17) & (!\inst7|Add0~33\)) # (!\inst7|count\(17) & ((\inst7|Add0~33\) # (GND)))
-- \inst7|Add0~35\ = CARRY((!\inst7|Add0~33\) # (!\inst7|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(17),
	datad => VCC,
	cin => \inst7|Add0~33\,
	combout => \inst7|Add0~34_combout\,
	cout => \inst7|Add0~35\);

\inst7|count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~5_combout\ = (\inst7|Add0~34_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~34_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~5_combout\);

\inst7|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(17));

\inst7|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~36_combout\ = (\inst7|count\(18) & (\inst7|Add0~35\ $ (GND))) # (!\inst7|count\(18) & (!\inst7|Add0~35\ & VCC))
-- \inst7|Add0~37\ = CARRY((\inst7|count\(18) & !\inst7|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(18),
	datad => VCC,
	cin => \inst7|Add0~35\,
	combout => \inst7|Add0~36_combout\,
	cout => \inst7|Add0~37\);

\inst7|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(18));

\inst7|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~38_combout\ = (\inst7|count\(19) & (!\inst7|Add0~37\)) # (!\inst7|count\(19) & ((\inst7|Add0~37\) # (GND)))
-- \inst7|Add0~39\ = CARRY((!\inst7|Add0~37\) # (!\inst7|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(19),
	datad => VCC,
	cin => \inst7|Add0~37\,
	combout => \inst7|Add0~38_combout\,
	cout => \inst7|Add0~39\);

\inst7|count~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~6_combout\ = (\inst7|Add0~38_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~38_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~6_combout\);

\inst7|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(19));

\inst7|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~5_combout\ = (\inst7|count\(17) & (\inst7|count\(19) & (!\inst7|count\(16) & !\inst7|count\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(17),
	datab => \inst7|count\(19),
	datac => \inst7|count\(16),
	datad => \inst7|count\(18),
	combout => \inst7|Equal0~5_combout\);

\inst7|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~40_combout\ = (\inst7|count\(20) & (\inst7|Add0~39\ $ (GND))) # (!\inst7|count\(20) & (!\inst7|Add0~39\ & VCC))
-- \inst7|Add0~41\ = CARRY((\inst7|count\(20) & !\inst7|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(20),
	datad => VCC,
	cin => \inst7|Add0~39\,
	combout => \inst7|Add0~40_combout\,
	cout => \inst7|Add0~41\);

\inst7|count~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~7_combout\ = (\inst7|Add0~40_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~40_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~7_combout\);

\inst7|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(20));

\inst7|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~42_combout\ = (\inst7|count\(21) & (!\inst7|Add0~41\)) # (!\inst7|count\(21) & ((\inst7|Add0~41\) # (GND)))
-- \inst7|Add0~43\ = CARRY((!\inst7|Add0~41\) # (!\inst7|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(21),
	datad => VCC,
	cin => \inst7|Add0~41\,
	combout => \inst7|Add0~42_combout\,
	cout => \inst7|Add0~43\);

\inst7|count~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~8_combout\ = (\inst7|Add0~42_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~42_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~8_combout\);

\inst7|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(21));

\inst7|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~44_combout\ = (\inst7|count\(22) & (\inst7|Add0~43\ $ (GND))) # (!\inst7|count\(22) & (!\inst7|Add0~43\ & VCC))
-- \inst7|Add0~45\ = CARRY((\inst7|count\(22) & !\inst7|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(22),
	datad => VCC,
	cin => \inst7|Add0~43\,
	combout => \inst7|Add0~44_combout\,
	cout => \inst7|Add0~45\);

\inst7|count~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~9_combout\ = (\inst7|Add0~44_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~44_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~9_combout\);

\inst7|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(22));

\inst7|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~46_combout\ = (\inst7|count\(23) & (!\inst7|Add0~45\)) # (!\inst7|count\(23) & ((\inst7|Add0~45\) # (GND)))
-- \inst7|Add0~47\ = CARRY((!\inst7|Add0~45\) # (!\inst7|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(23),
	datad => VCC,
	cin => \inst7|Add0~45\,
	combout => \inst7|Add0~46_combout\,
	cout => \inst7|Add0~47\);

\inst7|count~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~10_combout\ = (\inst7|Add0~46_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~46_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~10_combout\);

\inst7|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(23));

\inst7|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~6_combout\ = (\inst7|count\(20) & (\inst7|count\(21) & (\inst7|count\(22) & \inst7|count\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(20),
	datab => \inst7|count\(21),
	datac => \inst7|count\(22),
	datad => \inst7|count\(23),
	combout => \inst7|Equal0~6_combout\);

\inst7|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~48_combout\ = (\inst7|count\(24) & (\inst7|Add0~47\ $ (GND))) # (!\inst7|count\(24) & (!\inst7|Add0~47\ & VCC))
-- \inst7|Add0~49\ = CARRY((\inst7|count\(24) & !\inst7|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(24),
	datad => VCC,
	cin => \inst7|Add0~47\,
	combout => \inst7|Add0~48_combout\,
	cout => \inst7|Add0~49\);

\inst7|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(24));

\inst7|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Add0~50_combout\ = \inst7|count\(25) $ (\inst7|Add0~49\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(25),
	cin => \inst7|Add0~49\,
	combout => \inst7|Add0~50_combout\);

\inst7|count~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|count~11_combout\ = (\inst7|Add0~50_combout\ & !\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~50_combout\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|count~11_combout\);

\inst7|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|count\(25));

\inst7|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~7_combout\ = (\inst7|count\(25) & !\inst7|count\(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|count\(25),
	datad => \inst7|count\(24),
	combout => \inst7|Equal0~7_combout\);

\inst7|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|Equal0~8_combout\ = (\inst7|Equal0~4_combout\ & (\inst7|Equal0~5_combout\ & (\inst7|Equal0~6_combout\ & \inst7|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~4_combout\,
	datab => \inst7|Equal0~5_combout\,
	datac => \inst7|Equal0~6_combout\,
	datad => \inst7|Equal0~7_combout\,
	combout => \inst7|Equal0~8_combout\);

\inst7|pulse~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|pulse~0_combout\ = \inst7|pulse~q\ $ (\inst7|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|pulse~q\,
	datad => \inst7|Equal0~8_combout\,
	combout => \inst7|pulse~0_combout\);

\inst7|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst7|pulse~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|pulse~q\);

\inst|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (\inst|cnt\(5) & (\inst|cnt\(7) & (!\inst|cnt\(6) & !\inst|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(5),
	datab => \inst|cnt\(7),
	datac => \inst|cnt\(6),
	datad => \inst|cnt\(4),
	combout => \inst|Equal0~0_combout\);

\inst|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = (!\inst|cnt\(0) & (!\inst|cnt\(1) & (!\inst|cnt\(2) & !\inst|cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(0),
	datab => \inst|cnt\(1),
	datac => \inst|cnt\(2),
	datad => \inst|cnt\(3),
	combout => \inst|Equal0~1_combout\);

\inst|process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|process_0~0_combout\ = (\inst7|pulse~q\) # ((\inst|Equal0~0_combout\ & \inst|Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|pulse~q\,
	datab => \inst|Equal0~0_combout\,
	datac => \inst|Equal0~1_combout\,
	combout => \inst|process_0~0_combout\);

\inst|LessThan9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|LessThan9~0_combout\ = (\inst|cnt\(7) & ((\inst|cnt\(6)) # (\inst|cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(7),
	datab => \inst|cnt\(6),
	datac => \inst|cnt\(5),
	combout => \inst|LessThan9~0_combout\);

\inst|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[0]~8_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(0));

\inst|cnt[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[1]~10_combout\ = (\inst|cnt\(1) & (!\inst|cnt[0]~9\)) # (!\inst|cnt\(1) & ((\inst|cnt[0]~9\) # (GND)))
-- \inst|cnt[1]~11\ = CARRY((!\inst|cnt[0]~9\) # (!\inst|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(1),
	datad => VCC,
	cin => \inst|cnt[0]~9\,
	combout => \inst|cnt[1]~10_combout\,
	cout => \inst|cnt[1]~11\);

\inst|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[1]~10_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(1));

\inst|cnt[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[2]~12_combout\ = (\inst|cnt\(2) & (\inst|cnt[1]~11\ $ (GND))) # (!\inst|cnt\(2) & (!\inst|cnt[1]~11\ & VCC))
-- \inst|cnt[2]~13\ = CARRY((\inst|cnt\(2) & !\inst|cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(2),
	datad => VCC,
	cin => \inst|cnt[1]~11\,
	combout => \inst|cnt[2]~12_combout\,
	cout => \inst|cnt[2]~13\);

\inst|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[2]~12_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(2));

\inst|cnt[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[3]~14_combout\ = (\inst|cnt\(3) & (!\inst|cnt[2]~13\)) # (!\inst|cnt\(3) & ((\inst|cnt[2]~13\) # (GND)))
-- \inst|cnt[3]~15\ = CARRY((!\inst|cnt[2]~13\) # (!\inst|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(3),
	datad => VCC,
	cin => \inst|cnt[2]~13\,
	combout => \inst|cnt[3]~14_combout\,
	cout => \inst|cnt[3]~15\);

\inst|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[3]~14_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(3));

\inst|cnt[4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[4]~16_combout\ = (\inst|cnt\(4) & (\inst|cnt[3]~15\ $ (GND))) # (!\inst|cnt\(4) & (!\inst|cnt[3]~15\ & VCC))
-- \inst|cnt[4]~17\ = CARRY((\inst|cnt\(4) & !\inst|cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(4),
	datad => VCC,
	cin => \inst|cnt[3]~15\,
	combout => \inst|cnt[4]~16_combout\,
	cout => \inst|cnt[4]~17\);

\inst|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[4]~16_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(4));

\inst|cnt[5]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[5]~18_combout\ = (\inst|cnt\(5) & (!\inst|cnt[4]~17\)) # (!\inst|cnt\(5) & ((\inst|cnt[4]~17\) # (GND)))
-- \inst|cnt[5]~19\ = CARRY((!\inst|cnt[4]~17\) # (!\inst|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(5),
	datad => VCC,
	cin => \inst|cnt[4]~17\,
	combout => \inst|cnt[5]~18_combout\,
	cout => \inst|cnt[5]~19\);

\inst|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[5]~18_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(5));

\inst|cnt[6]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[6]~20_combout\ = (\inst|cnt\(6) & (\inst|cnt[5]~19\ $ (GND))) # (!\inst|cnt\(6) & (!\inst|cnt[5]~19\ & VCC))
-- \inst|cnt[6]~21\ = CARRY((\inst|cnt\(6) & !\inst|cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(6),
	datad => VCC,
	cin => \inst|cnt[5]~19\,
	combout => \inst|cnt[6]~20_combout\,
	cout => \inst|cnt[6]~21\);

\inst|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[6]~20_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(6));

\inst|cnt[7]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|cnt[7]~22_combout\ = \inst|cnt\(7) $ (\inst|cnt[6]~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(7),
	cin => \inst|cnt[6]~21\,
	combout => \inst|cnt[7]~22_combout\);

\inst|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|cnt[7]~22_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	sclr => \inst|LessThan9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|cnt\(7));

\inst|so~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~0_combout\ = (\inst|cnt\(7) & (!\inst|so~q\ & ((\inst|cnt\(6)) # (\inst|cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(7),
	datab => \inst|cnt\(6),
	datac => \inst|cnt\(5),
	datad => \inst|so~q\,
	combout => \inst|so~0_combout\);

\d[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(4),
	o => \d[4]~input_o\);

\d[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(3),
	o => \d[3]~input_o\);

\inst|so~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~1_combout\ = (!\inst|cnt\(5) & ((\inst|cnt\(4) & (\d[4]~input_o\)) # (!\inst|cnt\(4) & ((\d[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[3]~input_o\,
	datac => \inst|cnt\(4),
	datad => \inst|cnt\(5),
	combout => \inst|so~1_combout\);

\d[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(6),
	o => \d[6]~input_o\);

\d[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(5),
	o => \d[5]~input_o\);

\inst|so~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~2_combout\ = (\inst|cnt\(5) & ((\inst|cnt\(4) & (\d[6]~input_o\)) # (!\inst|cnt\(4) & ((\d[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(5),
	datab => \d[6]~input_o\,
	datac => \d[5]~input_o\,
	datad => \inst|cnt\(4),
	combout => \inst|so~2_combout\);

\inst|so~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~3_combout\ = (\inst|cnt\(6) & (!\inst|cnt\(7) & ((\inst|so~1_combout\) # (\inst|so~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(6),
	datab => \inst|so~1_combout\,
	datac => \inst|so~2_combout\,
	datad => \inst|cnt\(7),
	combout => \inst|so~3_combout\);

\d[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(0),
	o => \d[0]~input_o\);

\d[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(7),
	o => \d[7]~input_o\);

\inst|so~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~4_combout\ = (\inst|cnt\(7) & ((\inst|cnt\(4)) # ((\d[7]~input_o\)))) # (!\inst|cnt\(7) & (\inst|cnt\(4) & (\d[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(7),
	datab => \inst|cnt\(4),
	datac => \d[0]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst|so~4_combout\);

\d[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(2),
	o => \d[2]~input_o\);

\d[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(1),
	o => \d[1]~input_o\);

\inst|so~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~5_combout\ = (\inst|cnt\(5) & ((\inst|cnt\(4) & (\d[2]~input_o\)) # (!\inst|cnt\(4) & ((\d[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|cnt\(5),
	datab => \d[2]~input_o\,
	datac => \d[1]~input_o\,
	datad => \inst|cnt\(4),
	combout => \inst|so~5_combout\);

\inst|so~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~6_combout\ = (\inst|so~4_combout\ & (((\inst|so~5_combout\ & !\inst|cnt\(7))) # (!\inst|cnt\(5)))) # (!\inst|so~4_combout\ & (\inst|so~5_combout\ & ((!\inst|cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|so~4_combout\,
	datab => \inst|so~5_combout\,
	datac => \inst|cnt\(5),
	datad => \inst|cnt\(7),
	combout => \inst|so~6_combout\);

\inst|so~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|so~7_combout\ = (!\inst|so~0_combout\ & (!\inst|so~3_combout\ & ((\inst|cnt\(6)) # (!\inst|so~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|so~0_combout\,
	datab => \inst|so~3_combout\,
	datac => \inst|so~6_combout\,
	datad => \inst|cnt\(6),
	combout => \inst|so~7_combout\);

\inst|so\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \inst|so~7_combout\,
	clrn => \inst|ALT_INV_process_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|so~q\);

\inst9|count[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|count[0]~3_combout\ = !\inst9|count\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|count\(0),
	combout => \inst9|count[0]~3_combout\);

\inst9|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst9|count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|count\(0));

\inst9|count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|count~2_combout\ = (\inst9|count\(3) & ((\inst9|count\(2) $ (!\inst9|count\(0))) # (!\inst9|count\(1)))) # (!\inst9|count\(3) & (\inst9|count\(2) & (!\inst9|count\(0) & \inst9|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|count\(3),
	datab => \inst9|count\(2),
	datac => \inst9|count\(0),
	datad => \inst9|count\(1),
	combout => \inst9|count~2_combout\);

\inst9|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst9|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|count\(3));

\inst9|count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|count~1_combout\ = (\inst9|count\(0) & (\inst9|count\(1) & ((\inst9|count\(2)) # (!\inst9|count\(3))))) # (!\inst9|count\(0) & (((!\inst9|count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|count\(2),
	datab => \inst9|count\(0),
	datac => \inst9|count\(1),
	datad => \inst9|count\(3),
	combout => \inst9|count~1_combout\);

\inst9|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst9|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|count\(1));

\inst9|count[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|count[2]~0_combout\ = \inst9|count\(2) $ (((!\inst9|count\(0) & \inst9|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|count\(2),
	datab => \inst9|count\(0),
	datad => \inst9|count\(1),
	combout => \inst9|count[2]~0_combout\);

\inst9|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst9|count[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|count\(2));

\inst9|pulse~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|pulse~0_combout\ = (\inst9|count\(0) & (!\inst9|pulse~q\ & (!\inst9|count\(2) & !\inst9|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|count\(0),
	datab => \inst9|pulse~q\,
	datac => \inst9|count\(2),
	datad => \inst9|count\(1),
	combout => \inst9|pulse~0_combout\);

\inst9|pulse~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|pulse~1_combout\ = (!\inst9|pulse~0_combout\ & \inst9|count\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|pulse~0_combout\,
	datad => \inst9|count\(3),
	combout => \inst9|pulse~1_combout\);

\inst9|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk50Mhz~input_o\,
	d => \inst9|pulse~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|pulse~q\);

\inst1|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux0~0_combout\ = (\d[2]~input_o\ & (!\d[1]~input_o\ & (\d[0]~input_o\ $ (!\d[3]~input_o\)))) # (!\d[2]~input_o\ & (\d[0]~input_o\ & (\d[1]~input_o\ $ (!\d[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux0~0_combout\);

\inst1|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux1~0_combout\ = (\d[1]~input_o\ & ((\d[0]~input_o\ & ((\d[3]~input_o\))) # (!\d[0]~input_o\ & (\d[2]~input_o\)))) # (!\d[1]~input_o\ & (\d[2]~input_o\ & (\d[0]~input_o\ $ (\d[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux1~0_combout\);

\inst1|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux2~0_combout\ = (\d[2]~input_o\ & (\d[3]~input_o\ & ((\d[1]~input_o\) # (!\d[0]~input_o\)))) # (!\d[2]~input_o\ & (!\d[0]~input_o\ & (\d[1]~input_o\ & !\d[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux2~0_combout\);

\inst1|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux3~0_combout\ = (\d[1]~input_o\ & ((\d[0]~input_o\ & (\d[2]~input_o\)) # (!\d[0]~input_o\ & (!\d[2]~input_o\ & \d[3]~input_o\)))) # (!\d[1]~input_o\ & (!\d[3]~input_o\ & (\d[0]~input_o\ $ (\d[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux3~0_combout\);

\inst1|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux4~0_combout\ = (\d[1]~input_o\ & (\d[0]~input_o\ & ((!\d[3]~input_o\)))) # (!\d[1]~input_o\ & ((\d[2]~input_o\ & ((!\d[3]~input_o\))) # (!\d[2]~input_o\ & (\d[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux4~0_combout\);

\inst1|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux5~0_combout\ = (\d[0]~input_o\ & (\d[3]~input_o\ $ (((\d[1]~input_o\) # (!\d[2]~input_o\))))) # (!\d[0]~input_o\ & (\d[1]~input_o\ & (!\d[2]~input_o\ & !\d[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux5~0_combout\);

\inst1|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst1|Mux6~0_combout\ = (\d[0]~input_o\ & ((\d[3]~input_o\) # (\d[1]~input_o\ $ (\d[2]~input_o\)))) # (!\d[0]~input_o\ & ((\d[1]~input_o\) # (\d[2]~input_o\ $ (\d[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[0]~input_o\,
	datab => \d[1]~input_o\,
	datac => \d[2]~input_o\,
	datad => \d[3]~input_o\,
	combout => \inst1|Mux6~0_combout\);

\inst2|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux0~0_combout\ = (\d[6]~input_o\ & (!\d[5]~input_o\ & (\d[4]~input_o\ $ (!\d[7]~input_o\)))) # (!\d[6]~input_o\ & (\d[4]~input_o\ & (\d[5]~input_o\ $ (!\d[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux0~0_combout\);

\inst2|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux1~0_combout\ = (\d[5]~input_o\ & ((\d[4]~input_o\ & ((\d[7]~input_o\))) # (!\d[4]~input_o\ & (\d[6]~input_o\)))) # (!\d[5]~input_o\ & (\d[6]~input_o\ & (\d[4]~input_o\ $ (\d[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux1~0_combout\);

\inst2|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux2~0_combout\ = (\d[6]~input_o\ & (\d[7]~input_o\ & ((\d[5]~input_o\) # (!\d[4]~input_o\)))) # (!\d[6]~input_o\ & (!\d[4]~input_o\ & (\d[5]~input_o\ & !\d[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux2~0_combout\);

\inst2|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux3~0_combout\ = (\d[5]~input_o\ & ((\d[4]~input_o\ & (\d[6]~input_o\)) # (!\d[4]~input_o\ & (!\d[6]~input_o\ & \d[7]~input_o\)))) # (!\d[5]~input_o\ & (!\d[7]~input_o\ & (\d[4]~input_o\ $ (\d[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux3~0_combout\);

\inst2|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux4~0_combout\ = (\d[5]~input_o\ & (\d[4]~input_o\ & ((!\d[7]~input_o\)))) # (!\d[5]~input_o\ & ((\d[6]~input_o\ & ((!\d[7]~input_o\))) # (!\d[6]~input_o\ & (\d[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux4~0_combout\);

\inst2|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux5~0_combout\ = (\d[4]~input_o\ & (\d[7]~input_o\ $ (((\d[5]~input_o\) # (!\d[6]~input_o\))))) # (!\d[4]~input_o\ & (\d[5]~input_o\ & (!\d[6]~input_o\ & !\d[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux5~0_combout\);

\inst2|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|Mux6~0_combout\ = (\d[4]~input_o\ & ((\d[7]~input_o\) # (\d[5]~input_o\ $ (\d[6]~input_o\)))) # (!\d[4]~input_o\ & ((\d[5]~input_o\) # (\d[6]~input_o\ $ (\d[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d[4]~input_o\,
	datab => \d[5]~input_o\,
	datac => \d[6]~input_o\,
	datad => \d[7]~input_o\,
	combout => \inst2|Mux6~0_combout\);

\esp_tx~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_esp_tx,
	o => \esp_tx~input_o\);

\5|cnt[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[0]~8_combout\ = \5|cnt\(0) $ (VCC)
-- \5|cnt[0]~9\ = CARRY(\5|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(0),
	datad => VCC,
	combout => \5|cnt[0]~8_combout\,
	cout => \5|cnt[0]~9\);

\5|cnt[5]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[5]~18_combout\ = (\5|cnt\(5) & (!\5|cnt[4]~17\)) # (!\5|cnt\(5) & ((\5|cnt[4]~17\) # (GND)))
-- \5|cnt[5]~19\ = CARRY((!\5|cnt[4]~17\) # (!\5|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(5),
	datad => VCC,
	cin => \5|cnt[4]~17\,
	combout => \5|cnt[5]~18_combout\,
	cout => \5|cnt[5]~19\);

\5|cnt[6]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[6]~20_combout\ = (\5|cnt\(6) & (\5|cnt[5]~19\ $ (GND))) # (!\5|cnt\(6) & (!\5|cnt[5]~19\ & VCC))
-- \5|cnt[6]~21\ = CARRY((\5|cnt\(6) & !\5|cnt[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(6),
	datad => VCC,
	cin => \5|cnt[5]~19\,
	combout => \5|cnt[6]~20_combout\,
	cout => \5|cnt[6]~21\);

\5|LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|LessThan0~0_combout\ = (\5|cnt\(7) & ((\5|cnt\(5)) # (\5|cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \5|cnt\(5),
	datac => \5|cnt\(6),
	datad => \5|cnt\(7),
	combout => \5|LessThan0~0_combout\);

\5|start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_esp_tx~input_o\,
	d => VCC,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|start~q\);

\5|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[6]~20_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(6));

\5|cnt[7]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[7]~22_combout\ = \5|cnt\(7) $ (\5|cnt[6]~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(7),
	cin => \5|cnt[6]~21\,
	combout => \5|cnt[7]~22_combout\);

\5|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[7]~22_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(7));

\5|tmp[7]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[7]~3_combout\ = (!\5|cnt\(0) & !\5|cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \5|cnt\(0),
	datad => \5|cnt\(1),
	combout => \5|tmp[7]~3_combout\);

\5|Equal11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|Equal11~0_combout\ = (\5|cnt\(5) & (!\5|cnt\(6) & (!\5|cnt\(2) & !\5|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(5),
	datab => \5|cnt\(6),
	datac => \5|cnt\(2),
	datad => \5|cnt\(4),
	combout => \5|Equal11~0_combout\);

\5|Equal11~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|Equal11~1_combout\ = (\5|cnt\(7) & (\5|tmp[7]~3_combout\ & (\5|Equal11~0_combout\ & !\5|cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(7),
	datab => \5|tmp[7]~3_combout\,
	datac => \5|Equal11~0_combout\,
	datad => \5|cnt\(3),
	combout => \5|Equal11~1_combout\);

\5|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[0]~8_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(0));

\5|cnt[1]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[1]~10_combout\ = (\5|cnt\(1) & (!\5|cnt[0]~9\)) # (!\5|cnt\(1) & ((\5|cnt[0]~9\) # (GND)))
-- \5|cnt[1]~11\ = CARRY((!\5|cnt[0]~9\) # (!\5|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(1),
	datad => VCC,
	cin => \5|cnt[0]~9\,
	combout => \5|cnt[1]~10_combout\,
	cout => \5|cnt[1]~11\);

\5|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[1]~10_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(1));

\5|cnt[2]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[2]~12_combout\ = (\5|cnt\(2) & (\5|cnt[1]~11\ $ (GND))) # (!\5|cnt\(2) & (!\5|cnt[1]~11\ & VCC))
-- \5|cnt[2]~13\ = CARRY((\5|cnt\(2) & !\5|cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(2),
	datad => VCC,
	cin => \5|cnt[1]~11\,
	combout => \5|cnt[2]~12_combout\,
	cout => \5|cnt[2]~13\);

\5|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[2]~12_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(2));

\5|cnt[3]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[3]~14_combout\ = (\5|cnt\(3) & (!\5|cnt[2]~13\)) # (!\5|cnt\(3) & ((\5|cnt[2]~13\) # (GND)))
-- \5|cnt[3]~15\ = CARRY((!\5|cnt[2]~13\) # (!\5|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(3),
	datad => VCC,
	cin => \5|cnt[2]~13\,
	combout => \5|cnt[3]~14_combout\,
	cout => \5|cnt[3]~15\);

\5|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[3]~14_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(3));

\5|cnt[4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|cnt[4]~16_combout\ = (\5|cnt\(4) & (\5|cnt[3]~15\ $ (GND))) # (!\5|cnt\(4) & (!\5|cnt[3]~15\ & VCC))
-- \5|cnt[4]~17\ = CARRY((\5|cnt\(4) & !\5|cnt[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(4),
	datad => VCC,
	cin => \5|cnt[3]~15\,
	combout => \5|cnt[4]~16_combout\,
	cout => \5|cnt[4]~17\);

\5|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[4]~16_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(4));

\5|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|cnt[5]~18_combout\,
	clrn => \5|ALT_INV_Equal11~1_combout\,
	sclr => \5|LessThan0~0_combout\,
	ena => \5|start~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|cnt\(5));

\5|tmp[7]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[7]~2_combout\ = (!\5|cnt\(5) & !\5|cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \5|cnt\(5),
	datad => \5|cnt\(6),
	combout => \5|tmp[7]~2_combout\);

\5|data[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|data[3]~4_combout\ = (\5|start~q\ & (\5|cnt\(3) & !\5|cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|start~q\,
	datab => \5|cnt\(3),
	datad => \5|cnt\(2),
	combout => \5|data[3]~4_combout\);

\5|tmp[6]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[6]~4_combout\ = (\5|data[3]~4_combout\ & (\5|cnt\(4) & (\5|tmp[7]~3_combout\ & !\5|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data[3]~4_combout\,
	datab => \5|cnt\(4),
	datac => \5|tmp[7]~3_combout\,
	datad => \5|cnt\(7),
	combout => \5|tmp[6]~4_combout\);

\5|tmp[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[0]~5_combout\ = (\5|tmp[7]~2_combout\ & ((\5|tmp[6]~4_combout\ & (\esp_tx~input_o\)) # (!\5|tmp[6]~4_combout\ & ((\5|tmp\(0)))))) # (!\5|tmp[7]~2_combout\ & (((\5|tmp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|tmp\(0),
	datac => \5|tmp[7]~2_combout\,
	datad => \5|tmp[6]~4_combout\,
	combout => \5|tmp[0]~5_combout\);

\5|tmp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(0));

\5|data[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|data[3]~0_combout\ = (\5|cnt\(3) & (!\5|cnt\(5) & (\5|cnt\(0) & \5|cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(3),
	datab => \5|cnt\(5),
	datac => \5|cnt\(0),
	datad => \5|cnt\(1),
	combout => \5|data[3]~0_combout\);

\5|start_bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|start_bit~0_combout\ = (\5|data[3]~4_combout\ & (\5|tmp[7]~3_combout\ & (!\5|cnt\(7) & !\5|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data[3]~4_combout\,
	datab => \5|tmp[7]~3_combout\,
	datac => \5|cnt\(7),
	datad => \5|cnt\(4),
	combout => \5|start_bit~0_combout\);

\5|start_bit~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|start_bit~1_combout\ = (\5|tmp[7]~2_combout\ & ((\5|start_bit~0_combout\ & (\esp_tx~input_o\)) # (!\5|start_bit~0_combout\ & ((\5|start_bit~q\))))) # (!\5|tmp[7]~2_combout\ & (((\5|start_bit~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|start_bit~q\,
	datac => \5|tmp[7]~2_combout\,
	datad => \5|start_bit~0_combout\,
	combout => \5|start_bit~1_combout\);

\5|start_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|start_bit~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|start_bit~q\);

\5|data[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|data[3]~1_combout\ = (\5|cnt\(7) & (!\5|start_bit~q\ & (!\5|cnt\(6) & \5|cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(7),
	datab => \5|start_bit~q\,
	datac => \5|cnt\(6),
	datad => \5|cnt\(4),
	combout => \5|data[3]~1_combout\);

\5|tmp[7]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[7]~6_combout\ = (\5|cnt\(7) & (\5|tmp[7]~2_combout\ & (\5|data[3]~4_combout\ & \5|tmp[7]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(7),
	datab => \5|tmp[7]~2_combout\,
	datac => \5|data[3]~4_combout\,
	datad => \5|tmp[7]~3_combout\,
	combout => \5|tmp[7]~6_combout\);

\5|stop_bit~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|stop_bit~0_combout\ = (\5|cnt\(4) & ((\5|tmp[7]~6_combout\ & (\esp_tx~input_o\)) # (!\5|tmp[7]~6_combout\ & ((\5|stop_bit~q\))))) # (!\5|cnt\(4) & (((\5|stop_bit~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|stop_bit~q\,
	datac => \5|cnt\(4),
	datad => \5|tmp[7]~6_combout\,
	combout => \5|stop_bit~0_combout\);

\5|stop_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|stop_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|stop_bit~q\);

\5|data[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|data[3]~2_combout\ = (\5|stop_bit~q\ & !\5|cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|stop_bit~q\,
	datab => \5|cnt\(2),
	combout => \5|data[3]~2_combout\);

\5|data[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|data[3]~3_combout\ = (\5|start~q\ & (\5|data[3]~0_combout\ & (\5|data[3]~1_combout\ & \5|data[3]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|start~q\,
	datab => \5|data[3]~0_combout\,
	datac => \5|data[3]~1_combout\,
	datad => \5|data[3]~2_combout\,
	combout => \5|data[3]~3_combout\);

\5|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(0),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(0));

\5|tmp[6]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[6]~17_combout\ = (!\5|cnt\(0) & (!\5|cnt\(1) & (\5|data[3]~4_combout\ & !\5|cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(0),
	datab => \5|cnt\(1),
	datac => \5|data[3]~4_combout\,
	datad => \5|cnt\(7),
	combout => \5|tmp[6]~17_combout\);

\5|Equal11~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|Equal11~2_combout\ = (\5|cnt\(5) & (!\5|cnt\(6) & !\5|cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(5),
	datac => \5|cnt\(6),
	datad => \5|cnt\(4),
	combout => \5|Equal11~2_combout\);

\5|tmp[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[1]~7_combout\ = (\5|tmp[6]~17_combout\ & ((\5|Equal11~2_combout\ & (\esp_tx~input_o\)) # (!\5|Equal11~2_combout\ & ((\5|tmp\(1)))))) # (!\5|tmp[6]~17_combout\ & (((\5|tmp\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|tmp\(1),
	datac => \5|tmp[6]~17_combout\,
	datad => \5|Equal11~2_combout\,
	combout => \5|tmp[1]~7_combout\);

\5|tmp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(1));

\5|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(1),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(1));

\5|tmp[6]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[6]~8_combout\ = (\5|cnt\(5) & \5|tmp[6]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(5),
	datab => \5|tmp[6]~4_combout\,
	combout => \5|tmp[6]~8_combout\);

\5|tmp[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[2]~9_combout\ = (\5|tmp[6]~8_combout\ & ((\5|cnt\(6) & (\5|tmp\(2))) # (!\5|cnt\(6) & ((\esp_tx~input_o\))))) # (!\5|tmp[6]~8_combout\ & (\5|tmp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|tmp\(2),
	datab => \esp_tx~input_o\,
	datac => \5|tmp[6]~8_combout\,
	datad => \5|cnt\(6),
	combout => \5|tmp[2]~9_combout\);

\5|tmp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(2));

\5|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(2),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(2));

\5|tmp[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[5]~10_combout\ = (\5|cnt\(6) & \5|start_bit~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(6),
	datab => \5|start_bit~0_combout\,
	combout => \5|tmp[5]~10_combout\);

\5|tmp[3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[3]~11_combout\ = (\5|tmp[5]~10_combout\ & ((\5|cnt\(5) & (\5|tmp\(3))) # (!\5|cnt\(5) & ((\esp_tx~input_o\))))) # (!\5|tmp[5]~10_combout\ & (\5|tmp\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|tmp\(3),
	datab => \esp_tx~input_o\,
	datac => \5|tmp[5]~10_combout\,
	datad => \5|cnt\(5),
	combout => \5|tmp[3]~11_combout\);

\5|tmp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[3]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(3));

\5|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(3),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(3));

\inst5|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux0~0_combout\ = (\5|data\(2) & (!\5|data\(1) & (\5|data\(0) $ (!\5|data\(3))))) # (!\5|data\(2) & (\5|data\(0) & (\5|data\(1) $ (!\5|data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux0~0_combout\);

\inst5|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux1~0_combout\ = (\5|data\(1) & ((\5|data\(0) & ((\5|data\(3)))) # (!\5|data\(0) & (\5|data\(2))))) # (!\5|data\(1) & (\5|data\(2) & (\5|data\(0) $ (\5|data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux1~0_combout\);

\inst5|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux2~0_combout\ = (\5|data\(2) & (\5|data\(3) & ((\5|data\(1)) # (!\5|data\(0))))) # (!\5|data\(2) & (!\5|data\(0) & (\5|data\(1) & !\5|data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux2~0_combout\);

\inst5|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux3~0_combout\ = (\5|data\(1) & ((\5|data\(0) & (\5|data\(2))) # (!\5|data\(0) & (!\5|data\(2) & \5|data\(3))))) # (!\5|data\(1) & (!\5|data\(3) & (\5|data\(0) $ (\5|data\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux3~0_combout\);

\inst5|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux4~0_combout\ = (\5|data\(1) & (\5|data\(0) & ((!\5|data\(3))))) # (!\5|data\(1) & ((\5|data\(2) & ((!\5|data\(3)))) # (!\5|data\(2) & (\5|data\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux4~0_combout\);

\inst5|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux5~0_combout\ = (\5|data\(0) & (\5|data\(3) $ (((\5|data\(1)) # (!\5|data\(2)))))) # (!\5|data\(0) & (\5|data\(1) & (!\5|data\(2) & !\5|data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux5~0_combout\);

\inst5|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|Mux6~0_combout\ = (\5|data\(0) & ((\5|data\(3)) # (\5|data\(1) $ (\5|data\(2))))) # (!\5|data\(0) & ((\5|data\(1)) # (\5|data\(2) $ (\5|data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(0),
	datab => \5|data\(1),
	datac => \5|data\(2),
	datad => \5|data\(3),
	combout => \inst5|Mux6~0_combout\);

\5|tmp[4]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[4]~12_combout\ = (\5|cnt\(6) & !\5|cnt\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|cnt\(6),
	datad => \5|cnt\(5),
	combout => \5|tmp[4]~12_combout\);

\5|tmp[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[4]~13_combout\ = (\5|tmp[6]~4_combout\ & ((\5|tmp[4]~12_combout\ & (\esp_tx~input_o\)) # (!\5|tmp[4]~12_combout\ & ((\5|tmp\(4)))))) # (!\5|tmp[6]~4_combout\ & (((\5|tmp\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|tmp\(4),
	datac => \5|tmp[6]~4_combout\,
	datad => \5|tmp[4]~12_combout\,
	combout => \5|tmp[4]~13_combout\);

\5|tmp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(4));

\5|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(4),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(4));

\5|tmp[5]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[5]~14_combout\ = (\5|cnt\(5) & ((\5|tmp[5]~10_combout\ & (\esp_tx~input_o\)) # (!\5|tmp[5]~10_combout\ & ((\5|tmp\(5)))))) # (!\5|cnt\(5) & (((\5|tmp\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|tmp\(5),
	datac => \5|cnt\(5),
	datad => \5|tmp[5]~10_combout\,
	combout => \5|tmp[5]~14_combout\);

\5|tmp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[5]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(5));

\5|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(5),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(5));

\5|tmp[6]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[6]~15_combout\ = (\5|cnt\(6) & ((\5|tmp[6]~8_combout\ & (\esp_tx~input_o\)) # (!\5|tmp[6]~8_combout\ & ((\5|tmp\(6)))))) # (!\5|cnt\(6) & (((\5|tmp\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \esp_tx~input_o\,
	datab => \5|tmp\(6),
	datac => \5|cnt\(6),
	datad => \5|tmp[6]~8_combout\,
	combout => \5|tmp[6]~15_combout\);

\5|tmp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[6]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(6));

\5|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(6),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(6));

\5|tmp[7]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \5|tmp[7]~16_combout\ = (\5|tmp[7]~6_combout\ & ((\5|cnt\(4) & (\5|tmp\(7))) # (!\5|cnt\(4) & ((\esp_tx~input_o\))))) # (!\5|tmp[7]~6_combout\ & (\5|tmp\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|tmp\(7),
	datab => \esp_tx~input_o\,
	datac => \5|tmp[7]~6_combout\,
	datad => \5|cnt\(4),
	combout => \5|tmp[7]~16_combout\);

\5|tmp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp[7]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|tmp\(7));

\5|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \3|fout~q\,
	d => \5|tmp\(7),
	ena => \5|data[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \5|data\(7));

\inst4|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux0~0_combout\ = (\5|data\(6) & (!\5|data\(5) & (\5|data\(4) $ (!\5|data\(7))))) # (!\5|data\(6) & (\5|data\(4) & (\5|data\(5) $ (!\5|data\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux0~0_combout\);

\inst4|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux1~0_combout\ = (\5|data\(5) & ((\5|data\(4) & ((\5|data\(7)))) # (!\5|data\(4) & (\5|data\(6))))) # (!\5|data\(5) & (\5|data\(6) & (\5|data\(4) $ (\5|data\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux1~0_combout\);

\inst4|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux2~0_combout\ = (\5|data\(6) & (\5|data\(7) & ((\5|data\(5)) # (!\5|data\(4))))) # (!\5|data\(6) & (!\5|data\(4) & (\5|data\(5) & !\5|data\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux2~0_combout\);

\inst4|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux3~0_combout\ = (\5|data\(5) & ((\5|data\(4) & (\5|data\(6))) # (!\5|data\(4) & (!\5|data\(6) & \5|data\(7))))) # (!\5|data\(5) & (!\5|data\(7) & (\5|data\(4) $ (\5|data\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux3~0_combout\);

\inst4|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux4~0_combout\ = (\5|data\(5) & (\5|data\(4) & ((!\5|data\(7))))) # (!\5|data\(5) & ((\5|data\(6) & ((!\5|data\(7)))) # (!\5|data\(6) & (\5|data\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux4~0_combout\);

\inst4|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux5~0_combout\ = (\5|data\(4) & (\5|data\(7) $ (((\5|data\(5)) # (!\5|data\(6)))))) # (!\5|data\(4) & (\5|data\(5) & (!\5|data\(6) & !\5|data\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux5~0_combout\);

\inst4|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4|Mux6~0_combout\ = (\5|data\(4) & ((\5|data\(7)) # (\5|data\(5) $ (\5|data\(6))))) # (!\5|data\(4) & ((\5|data\(5)) # (\5|data\(6) $ (\5|data\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5|data\(4),
	datab => \5|data\(5),
	datac => \5|data\(6),
	datad => \5|data\(7),
	combout => \inst4|Mux6~0_combout\);

ww_esp_rx <= \esp_rx~output_o\;

ww_breatheLED <= \breatheLED~output_o\;

ww_pwm_output <= \pwm_output~output_o\;

ww_M_segH(6) <= \M_segH[6]~output_o\;

ww_M_segH(5) <= \M_segH[5]~output_o\;

ww_M_segH(4) <= \M_segH[4]~output_o\;

ww_M_segH(3) <= \M_segH[3]~output_o\;

ww_M_segH(2) <= \M_segH[2]~output_o\;

ww_M_segH(1) <= \M_segH[1]~output_o\;

ww_M_segH(0) <= \M_segH[0]~output_o\;

ww_M_segL(6) <= \M_segL[6]~output_o\;

ww_M_segL(5) <= \M_segL[5]~output_o\;

ww_M_segL(4) <= \M_segL[4]~output_o\;

ww_M_segL(3) <= \M_segL[3]~output_o\;

ww_M_segL(2) <= \M_segL[2]~output_o\;

ww_M_segL(1) <= \M_segL[1]~output_o\;

ww_M_segL(0) <= \M_segL[0]~output_o\;

ww_r_segH(6) <= \r_segH[6]~output_o\;

ww_r_segH(5) <= \r_segH[5]~output_o\;

ww_r_segH(4) <= \r_segH[4]~output_o\;

ww_r_segH(3) <= \r_segH[3]~output_o\;

ww_r_segH(2) <= \r_segH[2]~output_o\;

ww_r_segH(1) <= \r_segH[1]~output_o\;

ww_r_segH(0) <= \r_segH[0]~output_o\;

ww_r_segL(6) <= \r_segL[6]~output_o\;

ww_r_segL(5) <= \r_segL[5]~output_o\;

ww_r_segL(4) <= \r_segL[4]~output_o\;

ww_r_segL(3) <= \r_segL[3]~output_o\;

ww_r_segL(2) <= \r_segL[2]~output_o\;

ww_r_segL(1) <= \r_segL[1]~output_o\;

ww_r_segL(0) <= \r_segL[0]~output_o\;
END structure;


