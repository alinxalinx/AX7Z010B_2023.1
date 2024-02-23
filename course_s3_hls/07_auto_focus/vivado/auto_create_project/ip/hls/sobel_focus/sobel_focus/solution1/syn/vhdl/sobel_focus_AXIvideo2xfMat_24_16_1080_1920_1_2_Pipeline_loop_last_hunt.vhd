-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sobel_focus_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_last_hunt is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_TVALID : IN STD_LOGIC;
    last_reload : IN STD_LOGIC_VECTOR (0 downto 0);
    axi_data_5_reload : IN STD_LOGIC_VECTOR (23 downto 0);
    src_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    src_TREADY : OUT STD_LOGIC;
    src_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    src_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    src_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    axi_data_4_out : OUT STD_LOGIC_VECTOR (23 downto 0);
    axi_data_4_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of sobel_focus_AXIvideo2xfMat_24_16_1080_1920_1_2_Pipeline_loop_last_hunt is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_phi_mux_axi_last_phi_fu_89_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal src_TDATA_blk_n : STD_LOGIC;
    signal axi_last_reg_86 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component sobel_focus_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component sobel_focus_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                axi_last_reg_86 <= src_TLAST;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_loop_exit_ready, ap_done_reg, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_phi_mux_axi_last_phi_fu_89_p4_assign_proc : process(ap_CS_fsm_state1, last_reload, axi_last_reg_86, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_phi_mux_axi_last_phi_fu_89_p4 <= last_reload;
        else 
            ap_phi_mux_axi_last_phi_fu_89_p4 <= axi_last_reg_86;
        end if; 
    end process;


    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    axi_data_4_out_assign_proc : process(ap_CS_fsm_state1, ap_phi_mux_axi_last_phi_fu_89_p4, axi_data_5_reload, src_TDATA, ap_loop_init)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0)) then 
                axi_data_4_out <= src_TDATA;
            elsif ((ap_loop_init = ap_const_logic_1)) then 
                axi_data_4_out <= axi_data_5_reload;
            else 
                axi_data_4_out <= "XXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            axi_data_4_out <= "XXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    axi_data_4_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_loop_init, ap_start_int)
    begin
        if (((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            axi_data_4_out_ap_vld <= ap_const_logic_1;
        else 
            axi_data_4_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    src_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        if (((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start_int = ap_const_logic_1))) then 
            src_TDATA_blk_n <= src_TVALID;
        else 
            src_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_TREADY_assign_proc : process(ap_CS_fsm_state1, src_TVALID, ap_phi_mux_axi_last_phi_fu_89_p4, ap_start_int)
    begin
        if ((not(((ap_start_int = ap_const_logic_0) or ((ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (src_TVALID = ap_const_logic_0)))) and (ap_phi_mux_axi_last_phi_fu_89_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_TREADY <= ap_const_logic_1;
        else 
            src_TREADY <= ap_const_logic_0;
        end if; 
    end process;

end behav;
