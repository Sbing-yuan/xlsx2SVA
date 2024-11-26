//*********************************************************************************************************
// FILE NAME         : assert_checker_Glitch.v
// ABSTRACT          : Assertion Top Module for glitch check
// USER              : john_she
// DATE              : Tue Nov 26 22:13:08 2024
// WORKING DIRECTORY : /mnt/d/git repo/xlsx2SVA
//*********************************************************************************************************

module assert_checker_Glitch (
    input                 DA_test1,
    input   [63:0]         DA_test2,
    input   [4:0]         TS_ac,
    input                 TS_ap,
    input                 TS_gg_enl,
    input                 TS_test1,
    input                 TS_test2,
    input                 TS_test3,
    input                 TS_test4,
    input                 TS_test5,
    input                 TS_test6,
    input                 TS_test7,
    input   [3:0]         TS_test8,
    input                 T_O,
    input   [2:0]         T_a,
    input                 T_b,
    input                 T_c,
    input                 T_d,
    input                 T_e,
    input                 T_f,
    input                 T_g,
    input                 T_h,
    input                 T_i,
    input                 T_jj,
    input                 T_kk,
    input                 T_ll,
    input                 T_m,
    input                 T_n,
    input                 T_p,
    input                 T_q,
    input                 T_test1,
    input                 T_test10,
    input                 T_test11,
    input                 T_test12,
    input                 T_test13,
    input                 T_test14,
    input                 T_test15,
    input                 T_test16,
    input                 T_test17,
    input                 T_test2,
    input                 T_test3,
    input                 T_test4,
    input                 T_test5,
    input                 T_test6,
    input                 T_test7,
    input                 T_test8,
    input                 T_test9,
    input                 AD_ABC,
    input   [3:0]         AD_DEF,
    input                 AD_test1,
    input                 AD_test2,
    input                 AD_test3,
    input                 AD_test4,
    input                 AD_test5,
    input                 AD_test6,
    input                 clk,
    input                 rstb
);

assign clk_delay = clk;
assign rstb_delay = rstb;

integer DA_test1_pass;
integer DA_test2_0_pass;
integer DA_test2_1_pass;
integer DA_test2_2_pass;
integer DA_test2_3_pass;
integer DA_test2_4_pass;
integer DA_test2_5_pass;
integer DA_test2_6_pass;
integer DA_test2_7_pass;
integer DA_test2_8_pass;
integer DA_test2_9_pass;
integer DA_test2_10_pass;
integer DA_test2_11_pass;
integer DA_test2_12_pass;
integer DA_test2_13_pass;
integer DA_test2_14_pass;
integer DA_test2_15_pass;
integer DA_test2_16_pass;
integer DA_test2_17_pass;
integer DA_test2_18_pass;
integer DA_test2_19_pass;
integer DA_test2_20_pass;
integer DA_test2_21_pass;
integer DA_test2_22_pass;
integer DA_test2_23_pass;
integer DA_test2_24_pass;
integer DA_test2_25_pass;
integer DA_test2_26_pass;
integer DA_test2_27_pass;
integer DA_test2_28_pass;
integer DA_test2_29_pass;
integer DA_test2_30_pass;
integer DA_test2_31_pass;
integer DA_test2_32_pass;
integer DA_test2_33_pass;
integer DA_test2_34_pass;
integer DA_test2_35_pass;
integer DA_test2_36_pass;
integer DA_test2_37_pass;
integer DA_test2_38_pass;
integer DA_test2_39_pass;
integer DA_test2_40_pass;
integer DA_test2_41_pass;
integer DA_test2_42_pass;
integer DA_test2_43_pass;
integer DA_test2_44_pass;
integer DA_test2_45_pass;
integer DA_test2_46_pass;
integer DA_test2_47_pass;
integer DA_test2_48_pass;
integer DA_test2_49_pass;
integer DA_test2_50_pass;
integer DA_test2_51_pass;
integer DA_test2_52_pass;
integer DA_test2_53_pass;
integer DA_test2_54_pass;
integer DA_test2_55_pass;
integer DA_test2_56_pass;
integer DA_test2_57_pass;
integer DA_test2_58_pass;
integer DA_test2_59_pass;
integer DA_test2_60_pass;
integer DA_test2_61_pass;
integer DA_test2_62_pass;
integer DA_test2_63_pass;
integer TS_ac_0_pass;
integer TS_ac_1_pass;
integer TS_ac_2_pass;
integer TS_ac_3_pass;
integer TS_ac_4_pass;
integer TS_ap_pass;
integer TS_gg_enl_pass;
integer TS_test1_pass;
integer TS_test2_pass;
integer TS_test3_pass;
integer TS_test4_pass;
integer TS_test5_pass;
integer TS_test6_pass;
integer TS_test7_pass;
integer TS_test8_0_pass;
integer TS_test8_1_pass;
integer TS_test8_2_pass;
integer TS_test8_3_pass;
integer T_O_pass;
integer T_a_0_pass;
integer T_a_1_pass;
integer T_a_2_pass;
integer T_b_pass;
integer T_c_pass;
integer T_d_pass;
integer T_e_pass;
integer T_f_pass;
integer T_g_pass;
integer T_h_pass;
integer T_i_pass;
integer T_jj_pass;
integer T_kk_pass;
integer T_ll_pass;
integer T_m_pass;
integer T_n_pass;
integer T_p_pass;
integer T_q_pass;
integer T_test1_pass;
integer T_test10_pass;
integer T_test11_pass;
integer T_test12_pass;
integer T_test13_pass;
integer T_test14_pass;
integer T_test15_pass;
integer T_test16_pass;
integer T_test17_pass;
integer T_test2_pass;
integer T_test3_pass;
integer T_test4_pass;
integer T_test5_pass;
integer T_test6_pass;
integer T_test7_pass;
integer T_test8_pass;
integer T_test9_pass;
integer AD_ABC_pass;
integer AD_DEF_0_pass;
integer AD_DEF_1_pass;
integer AD_DEF_2_pass;
integer AD_DEF_3_pass;
integer AD_test1_pass;
integer AD_test2_pass;
integer AD_test3_pass;
integer AD_test4_pass;
integer AD_test5_pass;
integer AD_test6_pass;

initial begin
    DA_test1_pass = 0;
    DA_test2_0_pass = 0;
    DA_test2_1_pass = 0;
    DA_test2_2_pass = 0;
    DA_test2_3_pass = 0;
    DA_test2_4_pass = 0;
    DA_test2_5_pass = 0;
    DA_test2_6_pass = 0;
    DA_test2_7_pass = 0;
    DA_test2_8_pass = 0;
    DA_test2_9_pass = 0;
    DA_test2_10_pass = 0;
    DA_test2_11_pass = 0;
    DA_test2_12_pass = 0;
    DA_test2_13_pass = 0;
    DA_test2_14_pass = 0;
    DA_test2_15_pass = 0;
    DA_test2_16_pass = 0;
    DA_test2_17_pass = 0;
    DA_test2_18_pass = 0;
    DA_test2_19_pass = 0;
    DA_test2_20_pass = 0;
    DA_test2_21_pass = 0;
    DA_test2_22_pass = 0;
    DA_test2_23_pass = 0;
    DA_test2_24_pass = 0;
    DA_test2_25_pass = 0;
    DA_test2_26_pass = 0;
    DA_test2_27_pass = 0;
    DA_test2_28_pass = 0;
    DA_test2_29_pass = 0;
    DA_test2_30_pass = 0;
    DA_test2_31_pass = 0;
    DA_test2_32_pass = 0;
    DA_test2_33_pass = 0;
    DA_test2_34_pass = 0;
    DA_test2_35_pass = 0;
    DA_test2_36_pass = 0;
    DA_test2_37_pass = 0;
    DA_test2_38_pass = 0;
    DA_test2_39_pass = 0;
    DA_test2_40_pass = 0;
    DA_test2_41_pass = 0;
    DA_test2_42_pass = 0;
    DA_test2_43_pass = 0;
    DA_test2_44_pass = 0;
    DA_test2_45_pass = 0;
    DA_test2_46_pass = 0;
    DA_test2_47_pass = 0;
    DA_test2_48_pass = 0;
    DA_test2_49_pass = 0;
    DA_test2_50_pass = 0;
    DA_test2_51_pass = 0;
    DA_test2_52_pass = 0;
    DA_test2_53_pass = 0;
    DA_test2_54_pass = 0;
    DA_test2_55_pass = 0;
    DA_test2_56_pass = 0;
    DA_test2_57_pass = 0;
    DA_test2_58_pass = 0;
    DA_test2_59_pass = 0;
    DA_test2_60_pass = 0;
    DA_test2_61_pass = 0;
    DA_test2_62_pass = 0;
    DA_test2_63_pass = 0;
    TS_ac_0_pass = 0;
    TS_ac_1_pass = 0;
    TS_ac_2_pass = 0;
    TS_ac_3_pass = 0;
    TS_ac_4_pass = 0;
    TS_ap_pass = 0;
    TS_gg_enl_pass = 0;
    TS_test1_pass = 0;
    TS_test2_pass = 0;
    TS_test3_pass = 0;
    TS_test4_pass = 0;
    TS_test5_pass = 0;
    TS_test6_pass = 0;
    TS_test7_pass = 0;
    TS_test8_0_pass = 0;
    TS_test8_1_pass = 0;
    TS_test8_2_pass = 0;
    TS_test8_3_pass = 0;
    T_O_pass = 0;
    T_a_0_pass = 0;
    T_a_1_pass = 0;
    T_a_2_pass = 0;
    T_b_pass = 0;
    T_c_pass = 0;
    T_d_pass = 0;
    T_e_pass = 0;
    T_f_pass = 0;
    T_g_pass = 0;
    T_h_pass = 0;
    T_i_pass = 0;
    T_jj_pass = 0;
    T_kk_pass = 0;
    T_ll_pass = 0;
    T_m_pass = 0;
    T_n_pass = 0;
    T_p_pass = 0;
    T_q_pass = 0;
    T_test1_pass = 0;
    T_test10_pass = 0;
    T_test11_pass = 0;
    T_test12_pass = 0;
    T_test13_pass = 0;
    T_test14_pass = 0;
    T_test15_pass = 0;
    T_test16_pass = 0;
    T_test17_pass = 0;
    T_test2_pass = 0;
    T_test3_pass = 0;
    T_test4_pass = 0;
    T_test5_pass = 0;
    T_test6_pass = 0;
    T_test7_pass = 0;
    T_test8_pass = 0;
    T_test9_pass = 0;
    AD_ABC_pass = 0;
    AD_DEF_0_pass = 0;
    AD_DEF_1_pass = 0;
    AD_DEF_2_pass = 0;
    AD_DEF_3_pass = 0;
    AD_test1_pass = 0;
    AD_test2_pass = 0;
    AD_test3_pass = 0;
    AD_test4_pass = 0;
    AD_test5_pass = 0;
    AD_test6_pass = 0;
end

//=======================================================================================
//  assert_glitch                                                                        
//=======================================================================================
realtime duration = 20ns;                                                                
property glitch_p(sig, rstb, special_case);                                              
    realtime first_change;                                                               
    @(sig)                                                                               
    disable iff((rstb & special_case) != 1'b1)                                           
    (1, first_change = $realtime) |=> (($realtime - first_change) >= duration);          
endproperty                                                                              


ap_glitch_DA_test1:                      assert property(glitch_p(DA_test1, rstb_delay, 1'b1))
                                                DA_test1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test1 @ %t.", $realtime);

ap_glitch_DA_test20:                     assert property(glitch_p(DA_test2[0], rstb_delay, 1'b1))
                                                DA_test2_0_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_0 @ %t.", $realtime);

ap_glitch_DA_test21:                     assert property(glitch_p(DA_test2[1], rstb_delay, 1'b1))
                                                DA_test2_1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_1 @ %t.", $realtime);

ap_glitch_DA_test22:                     assert property(glitch_p(DA_test2[2], rstb_delay, 1'b1))
                                                DA_test2_2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_2 @ %t.", $realtime);

ap_glitch_DA_test23:                     assert property(glitch_p(DA_test2[3], rstb_delay, 1'b1))
                                                DA_test2_3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_3 @ %t.", $realtime);

ap_glitch_DA_test24:                     assert property(glitch_p(DA_test2[4], rstb_delay, 1'b1))
                                                DA_test2_4_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_4 @ %t.", $realtime);

ap_glitch_DA_test25:                     assert property(glitch_p(DA_test2[5], rstb_delay, 1'b1))
                                                DA_test2_5_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_5 @ %t.", $realtime);

ap_glitch_DA_test26:                     assert property(glitch_p(DA_test2[6], rstb_delay, 1'b1))
                                                DA_test2_6_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_6 @ %t.", $realtime);

ap_glitch_DA_test27:                     assert property(glitch_p(DA_test2[7], rstb_delay, 1'b1))
                                                DA_test2_7_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_7 @ %t.", $realtime);

ap_glitch_DA_test28:                     assert property(glitch_p(DA_test2[8], rstb_delay, 1'b1))
                                                DA_test2_8_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_8 @ %t.", $realtime);

ap_glitch_DA_test29:                     assert property(glitch_p(DA_test2[9], rstb_delay, 1'b1))
                                                DA_test2_9_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_9 @ %t.", $realtime);

ap_glitch_DA_test210:                    assert property(glitch_p(DA_test2[10], rstb_delay, 1'b1))
                                                DA_test2_10_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_10 @ %t.", $realtime);

ap_glitch_DA_test211:                    assert property(glitch_p(DA_test2[11], rstb_delay, 1'b1))
                                                DA_test2_11_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_11 @ %t.", $realtime);

ap_glitch_DA_test212:                    assert property(glitch_p(DA_test2[12], rstb_delay, 1'b1))
                                                DA_test2_12_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_12 @ %t.", $realtime);

ap_glitch_DA_test213:                    assert property(glitch_p(DA_test2[13], rstb_delay, 1'b1))
                                                DA_test2_13_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_13 @ %t.", $realtime);

ap_glitch_DA_test214:                    assert property(glitch_p(DA_test2[14], rstb_delay, 1'b1))
                                                DA_test2_14_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_14 @ %t.", $realtime);

ap_glitch_DA_test215:                    assert property(glitch_p(DA_test2[15], rstb_delay, 1'b1))
                                                DA_test2_15_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_15 @ %t.", $realtime);

ap_glitch_DA_test216:                    assert property(glitch_p(DA_test2[16], rstb_delay, 1'b1))
                                                DA_test2_16_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_16 @ %t.", $realtime);

ap_glitch_DA_test217:                    assert property(glitch_p(DA_test2[17], rstb_delay, 1'b1))
                                                DA_test2_17_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_17 @ %t.", $realtime);

ap_glitch_DA_test218:                    assert property(glitch_p(DA_test2[18], rstb_delay, 1'b1))
                                                DA_test2_18_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_18 @ %t.", $realtime);

ap_glitch_DA_test219:                    assert property(glitch_p(DA_test2[19], rstb_delay, 1'b1))
                                                DA_test2_19_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_19 @ %t.", $realtime);

ap_glitch_DA_test220:                    assert property(glitch_p(DA_test2[20], rstb_delay, 1'b1))
                                                DA_test2_20_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_20 @ %t.", $realtime);

ap_glitch_DA_test221:                    assert property(glitch_p(DA_test2[21], rstb_delay, 1'b1))
                                                DA_test2_21_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_21 @ %t.", $realtime);

ap_glitch_DA_test222:                    assert property(glitch_p(DA_test2[22], rstb_delay, 1'b1))
                                                DA_test2_22_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_22 @ %t.", $realtime);

ap_glitch_DA_test223:                    assert property(glitch_p(DA_test2[23], rstb_delay, 1'b1))
                                                DA_test2_23_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_23 @ %t.", $realtime);

ap_glitch_DA_test224:                    assert property(glitch_p(DA_test2[24], rstb_delay, 1'b1))
                                                DA_test2_24_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_24 @ %t.", $realtime);

ap_glitch_DA_test225:                    assert property(glitch_p(DA_test2[25], rstb_delay, 1'b1))
                                                DA_test2_25_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_25 @ %t.", $realtime);

ap_glitch_DA_test226:                    assert property(glitch_p(DA_test2[26], rstb_delay, 1'b1))
                                                DA_test2_26_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_26 @ %t.", $realtime);

ap_glitch_DA_test227:                    assert property(glitch_p(DA_test2[27], rstb_delay, 1'b1))
                                                DA_test2_27_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_27 @ %t.", $realtime);

ap_glitch_DA_test228:                    assert property(glitch_p(DA_test2[28], rstb_delay, 1'b1))
                                                DA_test2_28_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_28 @ %t.", $realtime);

ap_glitch_DA_test229:                    assert property(glitch_p(DA_test2[29], rstb_delay, 1'b1))
                                                DA_test2_29_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_29 @ %t.", $realtime);

ap_glitch_DA_test230:                    assert property(glitch_p(DA_test2[30], rstb_delay, 1'b1))
                                                DA_test2_30_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_30 @ %t.", $realtime);

ap_glitch_DA_test231:                    assert property(glitch_p(DA_test2[31], rstb_delay, 1'b1))
                                                DA_test2_31_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_31 @ %t.", $realtime);

ap_glitch_DA_test232:                    assert property(glitch_p(DA_test2[32], rstb_delay, 1'b1))
                                                DA_test2_32_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_32 @ %t.", $realtime);

ap_glitch_DA_test233:                    assert property(glitch_p(DA_test2[33], rstb_delay, 1'b1))
                                                DA_test2_33_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_33 @ %t.", $realtime);

ap_glitch_DA_test234:                    assert property(glitch_p(DA_test2[34], rstb_delay, 1'b1))
                                                DA_test2_34_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_34 @ %t.", $realtime);

ap_glitch_DA_test235:                    assert property(glitch_p(DA_test2[35], rstb_delay, 1'b1))
                                                DA_test2_35_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_35 @ %t.", $realtime);

ap_glitch_DA_test236:                    assert property(glitch_p(DA_test2[36], rstb_delay, 1'b1))
                                                DA_test2_36_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_36 @ %t.", $realtime);

ap_glitch_DA_test237:                    assert property(glitch_p(DA_test2[37], rstb_delay, 1'b1))
                                                DA_test2_37_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_37 @ %t.", $realtime);

ap_glitch_DA_test238:                    assert property(glitch_p(DA_test2[38], rstb_delay, 1'b1))
                                                DA_test2_38_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_38 @ %t.", $realtime);

ap_glitch_DA_test239:                    assert property(glitch_p(DA_test2[39], rstb_delay, 1'b1))
                                                DA_test2_39_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_39 @ %t.", $realtime);

ap_glitch_DA_test240:                    assert property(glitch_p(DA_test2[40], rstb_delay, 1'b1))
                                                DA_test2_40_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_40 @ %t.", $realtime);

ap_glitch_DA_test241:                    assert property(glitch_p(DA_test2[41], rstb_delay, 1'b1))
                                                DA_test2_41_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_41 @ %t.", $realtime);

ap_glitch_DA_test242:                    assert property(glitch_p(DA_test2[42], rstb_delay, 1'b1))
                                                DA_test2_42_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_42 @ %t.", $realtime);

ap_glitch_DA_test243:                    assert property(glitch_p(DA_test2[43], rstb_delay, 1'b1))
                                                DA_test2_43_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_43 @ %t.", $realtime);

ap_glitch_DA_test244:                    assert property(glitch_p(DA_test2[44], rstb_delay, 1'b1))
                                                DA_test2_44_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_44 @ %t.", $realtime);

ap_glitch_DA_test245:                    assert property(glitch_p(DA_test2[45], rstb_delay, 1'b1))
                                                DA_test2_45_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_45 @ %t.", $realtime);

ap_glitch_DA_test246:                    assert property(glitch_p(DA_test2[46], rstb_delay, 1'b1))
                                                DA_test2_46_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_46 @ %t.", $realtime);

ap_glitch_DA_test247:                    assert property(glitch_p(DA_test2[47], rstb_delay, 1'b1))
                                                DA_test2_47_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_47 @ %t.", $realtime);

ap_glitch_DA_test248:                    assert property(glitch_p(DA_test2[48], rstb_delay, 1'b1))
                                                DA_test2_48_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_48 @ %t.", $realtime);

ap_glitch_DA_test249:                    assert property(glitch_p(DA_test2[49], rstb_delay, 1'b1))
                                                DA_test2_49_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_49 @ %t.", $realtime);

ap_glitch_DA_test250:                    assert property(glitch_p(DA_test2[50], rstb_delay, 1'b1))
                                                DA_test2_50_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_50 @ %t.", $realtime);

ap_glitch_DA_test251:                    assert property(glitch_p(DA_test2[51], rstb_delay, 1'b1))
                                                DA_test2_51_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_51 @ %t.", $realtime);

ap_glitch_DA_test252:                    assert property(glitch_p(DA_test2[52], rstb_delay, 1'b1))
                                                DA_test2_52_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_52 @ %t.", $realtime);

ap_glitch_DA_test253:                    assert property(glitch_p(DA_test2[53], rstb_delay, 1'b1))
                                                DA_test2_53_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_53 @ %t.", $realtime);

ap_glitch_DA_test254:                    assert property(glitch_p(DA_test2[54], rstb_delay, 1'b1))
                                                DA_test2_54_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_54 @ %t.", $realtime);

ap_glitch_DA_test255:                    assert property(glitch_p(DA_test2[55], rstb_delay, 1'b1))
                                                DA_test2_55_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_55 @ %t.", $realtime);

ap_glitch_DA_test256:                    assert property(glitch_p(DA_test2[56], rstb_delay, 1'b1))
                                                DA_test2_56_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_56 @ %t.", $realtime);

ap_glitch_DA_test257:                    assert property(glitch_p(DA_test2[57], rstb_delay, 1'b1))
                                                DA_test2_57_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_57 @ %t.", $realtime);

ap_glitch_DA_test258:                    assert property(glitch_p(DA_test2[58], rstb_delay, 1'b1))
                                                DA_test2_58_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_58 @ %t.", $realtime);

ap_glitch_DA_test259:                    assert property(glitch_p(DA_test2[59], rstb_delay, 1'b1))
                                                DA_test2_59_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_59 @ %t.", $realtime);

ap_glitch_DA_test260:                    assert property(glitch_p(DA_test2[60], rstb_delay, 1'b1))
                                                DA_test2_60_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_60 @ %t.", $realtime);

ap_glitch_DA_test261:                    assert property(glitch_p(DA_test2[61], rstb_delay, 1'b1))
                                                DA_test2_61_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_61 @ %t.", $realtime);

ap_glitch_DA_test262:                    assert property(glitch_p(DA_test2[62], rstb_delay, 1'b1))
                                                DA_test2_62_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_62 @ %t.", $realtime);

ap_glitch_DA_test263:                    assert property(glitch_p(DA_test2[63], rstb_delay, 1'b1))
                                                DA_test2_63_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! DA_test2_63 @ %t.", $realtime);

ap_glitch_TS_ac0:                        assert property(glitch_p(TS_ac[0], rstb_delay, 1'b1))
                                                TS_ac_0_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ac_0 @ %t.", $realtime);

ap_glitch_TS_ac1:                        assert property(glitch_p(TS_ac[1], rstb_delay, 1'b1))
                                                TS_ac_1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ac_1 @ %t.", $realtime);

ap_glitch_TS_ac2:                        assert property(glitch_p(TS_ac[2], rstb_delay, 1'b1))
                                                TS_ac_2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ac_2 @ %t.", $realtime);

ap_glitch_TS_ac3:                        assert property(glitch_p(TS_ac[3], rstb_delay, 1'b1))
                                                TS_ac_3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ac_3 @ %t.", $realtime);

ap_glitch_TS_ac4:                        assert property(glitch_p(TS_ac[4], rstb_delay, 1'b1))
                                                TS_ac_4_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ac_4 @ %t.", $realtime);

ap_glitch_TS_ap:                         assert property(glitch_p(TS_ap, rstb_delay, 1'b1))
                                                TS_ap_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_ap @ %t.", $realtime);

ap_glitch_TS_gg_enl:                     assert property(glitch_p(TS_gg_enl, rstb_delay, 1'b1))
                                                TS_gg_enl_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_gg_enl @ %t.", $realtime);

ap_glitch_TS_test1:                      assert property(glitch_p(TS_test1, rstb_delay, 1'b1))
                                                TS_test1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test1 @ %t.", $realtime);

ap_glitch_TS_test2:                      assert property(glitch_p(TS_test2, rstb_delay, 1'b1))
                                                TS_test2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test2 @ %t.", $realtime);

ap_glitch_TS_test3:                      assert property(glitch_p(TS_test3, rstb_delay, 1'b1))
                                                TS_test3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test3 @ %t.", $realtime);

ap_glitch_TS_test4:                      assert property(glitch_p(TS_test4, rstb_delay, 1'b1))
                                                TS_test4_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test4 @ %t.", $realtime);

ap_glitch_TS_test5:                      assert property(glitch_p(TS_test5, rstb_delay, 1'b1))
                                                TS_test5_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test5 @ %t.", $realtime);

ap_glitch_TS_test6:                      assert property(glitch_p(TS_test6, rstb_delay, 1'b1))
                                                TS_test6_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test6 @ %t.", $realtime);

ap_glitch_TS_test7:                      assert property(glitch_p(TS_test7, rstb_delay, 1'b1))
                                                TS_test7_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test7 @ %t.", $realtime);

ap_glitch_TS_test80:                     assert property(glitch_p(TS_test8[0], rstb_delay, 1'b1))
                                                TS_test8_0_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test8_0 @ %t.", $realtime);

ap_glitch_TS_test81:                     assert property(glitch_p(TS_test8[1], rstb_delay, 1'b1))
                                                TS_test8_1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test8_1 @ %t.", $realtime);

ap_glitch_TS_test82:                     assert property(glitch_p(TS_test8[2], rstb_delay, 1'b1))
                                                TS_test8_2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test8_2 @ %t.", $realtime);

ap_glitch_TS_test83:                     assert property(glitch_p(TS_test8[3], rstb_delay, 1'b1))
                                                TS_test8_3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! TS_test8_3 @ %t.", $realtime);

ap_glitch_T_O:                           assert property(glitch_p(T_O, rstb_delay, 1'b1))
                                                T_O_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_O @ %t.", $realtime);

ap_glitch_T_a0:                          assert property(glitch_p(T_a[0], rstb_delay, 1'b1))
                                                T_a_0_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_a_0 @ %t.", $realtime);

ap_glitch_T_a1:                          assert property(glitch_p(T_a[1], rstb_delay, 1'b1))
                                                T_a_1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_a_1 @ %t.", $realtime);

ap_glitch_T_a2:                          assert property(glitch_p(T_a[2], rstb_delay, 1'b1))
                                                T_a_2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_a_2 @ %t.", $realtime);

ap_glitch_T_b:                           assert property(glitch_p(T_b, rstb_delay, 1'b1))
                                                T_b_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_b @ %t.", $realtime);

ap_glitch_T_c:                           assert property(glitch_p(T_c, rstb_delay, 1'b1))
                                                T_c_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_c @ %t.", $realtime);

ap_glitch_T_d:                           assert property(glitch_p(T_d, rstb_delay, 1'b1))
                                                T_d_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_d @ %t.", $realtime);

ap_glitch_T_e:                           assert property(glitch_p(T_e, rstb_delay, 1'b1))
                                                T_e_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_e @ %t.", $realtime);

ap_glitch_T_f:                           assert property(glitch_p(T_f, rstb_delay, 1'b1))
                                                T_f_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_f @ %t.", $realtime);

ap_glitch_T_g:                           assert property(glitch_p(T_g, rstb_delay, 1'b1))
                                                T_g_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_g @ %t.", $realtime);

ap_glitch_T_h:                           assert property(glitch_p(T_h, rstb_delay, 1'b1))
                                                T_h_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_h @ %t.", $realtime);

ap_glitch_T_i:                           assert property(glitch_p(T_i, rstb_delay, 1'b1))
                                                T_i_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_i @ %t.", $realtime);

ap_glitch_T_jj:                          assert property(glitch_p(T_jj, rstb_delay, 1'b1))
                                                T_jj_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_jj @ %t.", $realtime);

ap_glitch_T_kk:                          assert property(glitch_p(T_kk, rstb_delay, 1'b1))
                                                T_kk_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_kk @ %t.", $realtime);

ap_glitch_T_ll:                          assert property(glitch_p(T_ll, rstb_delay, 1'b1))
                                                T_ll_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_ll @ %t.", $realtime);

ap_glitch_T_m:                           assert property(glitch_p(T_m, rstb_delay, 1'b1))
                                                T_m_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_m @ %t.", $realtime);

ap_glitch_T_n:                           assert property(glitch_p(T_n, rstb_delay, 1'b1))
                                                T_n_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_n @ %t.", $realtime);

ap_glitch_T_p:                           assert property(glitch_p(T_p, rstb_delay, 1'b1))
                                                T_p_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_p @ %t.", $realtime);

ap_glitch_T_q:                           assert property(glitch_p(T_q, rstb_delay, 1'b1))
                                                T_q_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_q @ %t.", $realtime);

ap_glitch_T_test1:                       assert property(glitch_p(T_test1, rstb_delay, 1'b1))
                                                T_test1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test1 @ %t.", $realtime);

ap_glitch_T_test10:                      assert property(glitch_p(T_test10, rstb_delay, 1'b1))
                                                T_test10_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test10 @ %t.", $realtime);

ap_glitch_T_test11:                      assert property(glitch_p(T_test11, rstb_delay, 1'b1))
                                                T_test11_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test11 @ %t.", $realtime);

ap_glitch_T_test12:                      assert property(glitch_p(T_test12, rstb_delay, 1'b1))
                                                T_test12_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test12 @ %t.", $realtime);

ap_glitch_T_test13:                      assert property(glitch_p(T_test13, rstb_delay, 1'b1))
                                                T_test13_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test13 @ %t.", $realtime);

ap_glitch_T_test14:                      assert property(glitch_p(T_test14, rstb_delay, 1'b1))
                                                T_test14_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test14 @ %t.", $realtime);

ap_glitch_T_test15:                      assert property(glitch_p(T_test15, rstb_delay, 1'b1))
                                                T_test15_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test15 @ %t.", $realtime);

ap_glitch_T_test16:                      assert property(glitch_p(T_test16, rstb_delay, 1'b1))
                                                T_test16_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test16 @ %t.", $realtime);

ap_glitch_T_test17:                      assert property(glitch_p(T_test17, rstb_delay, 1'b1))
                                                T_test17_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test17 @ %t.", $realtime);

ap_glitch_T_test2:                       assert property(glitch_p(T_test2, rstb_delay, 1'b1))
                                                T_test2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test2 @ %t.", $realtime);

ap_glitch_T_test3:                       assert property(glitch_p(T_test3, rstb_delay, 1'b1))
                                                T_test3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test3 @ %t.", $realtime);

ap_glitch_T_test4:                       assert property(glitch_p(T_test4, rstb_delay, 1'b1))
                                                T_test4_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test4 @ %t.", $realtime);

ap_glitch_T_test5:                       assert property(glitch_p(T_test5, rstb_delay, 1'b1))
                                                T_test5_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test5 @ %t.", $realtime);

ap_glitch_T_test6:                       assert property(glitch_p(T_test6, rstb_delay, 1'b1))
                                                T_test6_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test6 @ %t.", $realtime);

ap_glitch_T_test7:                       assert property(glitch_p(T_test7, rstb_delay, 1'b1))
                                                T_test7_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test7 @ %t.", $realtime);

ap_glitch_T_test8:                       assert property(glitch_p(T_test8, rstb_delay, 1'b1))
                                                T_test8_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test8 @ %t.", $realtime);

ap_glitch_T_test9:                       assert property(glitch_p(T_test9, rstb_delay, 1'b1))
                                                T_test9_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! T_test9 @ %t.", $realtime);

ap_glitch_AD_ABC:                        assert property(glitch_p(AD_ABC, rstb_delay, 1'b1))
                                                AD_ABC_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_ABC @ %t.", $realtime);

ap_glitch_AD_DEF0:                       assert property(glitch_p(AD_DEF[0], rstb_delay, 1'b1))
                                                AD_DEF_0_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_DEF_0 @ %t.", $realtime);

ap_glitch_AD_DEF1:                       assert property(glitch_p(AD_DEF[1], rstb_delay, 1'b1))
                                                AD_DEF_1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_DEF_1 @ %t.", $realtime);

ap_glitch_AD_DEF2:                       assert property(glitch_p(AD_DEF[2], rstb_delay, 1'b1))
                                                AD_DEF_2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_DEF_2 @ %t.", $realtime);

ap_glitch_AD_DEF3:                       assert property(glitch_p(AD_DEF[3], rstb_delay, 1'b1))
                                                AD_DEF_3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_DEF_3 @ %t.", $realtime);

ap_glitch_AD_test1:                      assert property(glitch_p(AD_test1, rstb_delay, 1'b1))
                                                AD_test1_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test1 @ %t.", $realtime);

ap_glitch_AD_test2:                      assert property(glitch_p(AD_test2, rstb_delay, 1'b1))
                                                AD_test2_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test2 @ %t.", $realtime);

ap_glitch_AD_test3:                      assert property(glitch_p(AD_test3, rstb_delay, 1'b1))
                                                AD_test3_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test3 @ %t.", $realtime);

ap_glitch_AD_test4:                      assert property(glitch_p(AD_test4, rstb_delay, 1'b1))
                                                AD_test4_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test4 @ %t.", $realtime);

ap_glitch_AD_test5:                      assert property(glitch_p(AD_test5, rstb_delay, 1'b1))
                                                AD_test5_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test5 @ %t.", $realtime);

ap_glitch_AD_test6:                      assert property(glitch_p(AD_test6, rstb_delay, 1'b1))
                                                AD_test6_pass += 1;
                                         else $display("  [ASSERT] Glitch Warning! AD_test6 @ %t.", $realtime);

final
begin
    $display("");
    $display("[ASSERT] Glitch Assertion Summary");
    $display("[ASSERT] Glitch Check DA_test1_pass:                                %d", DA_test1_pass);
    $display("[ASSERT] Glitch Check DA_test2_0_pass:                              %d", DA_test2_0_pass);
    $display("[ASSERT] Glitch Check DA_test2_1_pass:                              %d", DA_test2_1_pass);
    $display("[ASSERT] Glitch Check DA_test2_2_pass:                              %d", DA_test2_2_pass);
    $display("[ASSERT] Glitch Check DA_test2_3_pass:                              %d", DA_test2_3_pass);
    $display("[ASSERT] Glitch Check DA_test2_4_pass:                              %d", DA_test2_4_pass);
    $display("[ASSERT] Glitch Check DA_test2_5_pass:                              %d", DA_test2_5_pass);
    $display("[ASSERT] Glitch Check DA_test2_6_pass:                              %d", DA_test2_6_pass);
    $display("[ASSERT] Glitch Check DA_test2_7_pass:                              %d", DA_test2_7_pass);
    $display("[ASSERT] Glitch Check DA_test2_8_pass:                              %d", DA_test2_8_pass);
    $display("[ASSERT] Glitch Check DA_test2_9_pass:                              %d", DA_test2_9_pass);
    $display("[ASSERT] Glitch Check DA_test2_10_pass:                             %d", DA_test2_10_pass);
    $display("[ASSERT] Glitch Check DA_test2_11_pass:                             %d", DA_test2_11_pass);
    $display("[ASSERT] Glitch Check DA_test2_12_pass:                             %d", DA_test2_12_pass);
    $display("[ASSERT] Glitch Check DA_test2_13_pass:                             %d", DA_test2_13_pass);
    $display("[ASSERT] Glitch Check DA_test2_14_pass:                             %d", DA_test2_14_pass);
    $display("[ASSERT] Glitch Check DA_test2_15_pass:                             %d", DA_test2_15_pass);
    $display("[ASSERT] Glitch Check DA_test2_16_pass:                             %d", DA_test2_16_pass);
    $display("[ASSERT] Glitch Check DA_test2_17_pass:                             %d", DA_test2_17_pass);
    $display("[ASSERT] Glitch Check DA_test2_18_pass:                             %d", DA_test2_18_pass);
    $display("[ASSERT] Glitch Check DA_test2_19_pass:                             %d", DA_test2_19_pass);
    $display("[ASSERT] Glitch Check DA_test2_20_pass:                             %d", DA_test2_20_pass);
    $display("[ASSERT] Glitch Check DA_test2_21_pass:                             %d", DA_test2_21_pass);
    $display("[ASSERT] Glitch Check DA_test2_22_pass:                             %d", DA_test2_22_pass);
    $display("[ASSERT] Glitch Check DA_test2_23_pass:                             %d", DA_test2_23_pass);
    $display("[ASSERT] Glitch Check DA_test2_24_pass:                             %d", DA_test2_24_pass);
    $display("[ASSERT] Glitch Check DA_test2_25_pass:                             %d", DA_test2_25_pass);
    $display("[ASSERT] Glitch Check DA_test2_26_pass:                             %d", DA_test2_26_pass);
    $display("[ASSERT] Glitch Check DA_test2_27_pass:                             %d", DA_test2_27_pass);
    $display("[ASSERT] Glitch Check DA_test2_28_pass:                             %d", DA_test2_28_pass);
    $display("[ASSERT] Glitch Check DA_test2_29_pass:                             %d", DA_test2_29_pass);
    $display("[ASSERT] Glitch Check DA_test2_30_pass:                             %d", DA_test2_30_pass);
    $display("[ASSERT] Glitch Check DA_test2_31_pass:                             %d", DA_test2_31_pass);
    $display("[ASSERT] Glitch Check DA_test2_32_pass:                             %d", DA_test2_32_pass);
    $display("[ASSERT] Glitch Check DA_test2_33_pass:                             %d", DA_test2_33_pass);
    $display("[ASSERT] Glitch Check DA_test2_34_pass:                             %d", DA_test2_34_pass);
    $display("[ASSERT] Glitch Check DA_test2_35_pass:                             %d", DA_test2_35_pass);
    $display("[ASSERT] Glitch Check DA_test2_36_pass:                             %d", DA_test2_36_pass);
    $display("[ASSERT] Glitch Check DA_test2_37_pass:                             %d", DA_test2_37_pass);
    $display("[ASSERT] Glitch Check DA_test2_38_pass:                             %d", DA_test2_38_pass);
    $display("[ASSERT] Glitch Check DA_test2_39_pass:                             %d", DA_test2_39_pass);
    $display("[ASSERT] Glitch Check DA_test2_40_pass:                             %d", DA_test2_40_pass);
    $display("[ASSERT] Glitch Check DA_test2_41_pass:                             %d", DA_test2_41_pass);
    $display("[ASSERT] Glitch Check DA_test2_42_pass:                             %d", DA_test2_42_pass);
    $display("[ASSERT] Glitch Check DA_test2_43_pass:                             %d", DA_test2_43_pass);
    $display("[ASSERT] Glitch Check DA_test2_44_pass:                             %d", DA_test2_44_pass);
    $display("[ASSERT] Glitch Check DA_test2_45_pass:                             %d", DA_test2_45_pass);
    $display("[ASSERT] Glitch Check DA_test2_46_pass:                             %d", DA_test2_46_pass);
    $display("[ASSERT] Glitch Check DA_test2_47_pass:                             %d", DA_test2_47_pass);
    $display("[ASSERT] Glitch Check DA_test2_48_pass:                             %d", DA_test2_48_pass);
    $display("[ASSERT] Glitch Check DA_test2_49_pass:                             %d", DA_test2_49_pass);
    $display("[ASSERT] Glitch Check DA_test2_50_pass:                             %d", DA_test2_50_pass);
    $display("[ASSERT] Glitch Check DA_test2_51_pass:                             %d", DA_test2_51_pass);
    $display("[ASSERT] Glitch Check DA_test2_52_pass:                             %d", DA_test2_52_pass);
    $display("[ASSERT] Glitch Check DA_test2_53_pass:                             %d", DA_test2_53_pass);
    $display("[ASSERT] Glitch Check DA_test2_54_pass:                             %d", DA_test2_54_pass);
    $display("[ASSERT] Glitch Check DA_test2_55_pass:                             %d", DA_test2_55_pass);
    $display("[ASSERT] Glitch Check DA_test2_56_pass:                             %d", DA_test2_56_pass);
    $display("[ASSERT] Glitch Check DA_test2_57_pass:                             %d", DA_test2_57_pass);
    $display("[ASSERT] Glitch Check DA_test2_58_pass:                             %d", DA_test2_58_pass);
    $display("[ASSERT] Glitch Check DA_test2_59_pass:                             %d", DA_test2_59_pass);
    $display("[ASSERT] Glitch Check DA_test2_60_pass:                             %d", DA_test2_60_pass);
    $display("[ASSERT] Glitch Check DA_test2_61_pass:                             %d", DA_test2_61_pass);
    $display("[ASSERT] Glitch Check DA_test2_62_pass:                             %d", DA_test2_62_pass);
    $display("[ASSERT] Glitch Check DA_test2_63_pass:                             %d", DA_test2_63_pass);
    $display("[ASSERT] Glitch Check TS_ac_0_pass:                                 %d", TS_ac_0_pass);
    $display("[ASSERT] Glitch Check TS_ac_1_pass:                                 %d", TS_ac_1_pass);
    $display("[ASSERT] Glitch Check TS_ac_2_pass:                                 %d", TS_ac_2_pass);
    $display("[ASSERT] Glitch Check TS_ac_3_pass:                                 %d", TS_ac_3_pass);
    $display("[ASSERT] Glitch Check TS_ac_4_pass:                                 %d", TS_ac_4_pass);
    $display("[ASSERT] Glitch Check TS_ap_pass:                                   %d", TS_ap_pass);
    $display("[ASSERT] Glitch Check TS_gg_enl_pass:                               %d", TS_gg_enl_pass);
    $display("[ASSERT] Glitch Check TS_test1_pass:                                %d", TS_test1_pass);
    $display("[ASSERT] Glitch Check TS_test2_pass:                                %d", TS_test2_pass);
    $display("[ASSERT] Glitch Check TS_test3_pass:                                %d", TS_test3_pass);
    $display("[ASSERT] Glitch Check TS_test4_pass:                                %d", TS_test4_pass);
    $display("[ASSERT] Glitch Check TS_test5_pass:                                %d", TS_test5_pass);
    $display("[ASSERT] Glitch Check TS_test6_pass:                                %d", TS_test6_pass);
    $display("[ASSERT] Glitch Check TS_test7_pass:                                %d", TS_test7_pass);
    $display("[ASSERT] Glitch Check TS_test8_0_pass:                              %d", TS_test8_0_pass);
    $display("[ASSERT] Glitch Check TS_test8_1_pass:                              %d", TS_test8_1_pass);
    $display("[ASSERT] Glitch Check TS_test8_2_pass:                              %d", TS_test8_2_pass);
    $display("[ASSERT] Glitch Check TS_test8_3_pass:                              %d", TS_test8_3_pass);
    $display("[ASSERT] Glitch Check T_O_pass:                                     %d", T_O_pass);
    $display("[ASSERT] Glitch Check T_a_0_pass:                                   %d", T_a_0_pass);
    $display("[ASSERT] Glitch Check T_a_1_pass:                                   %d", T_a_1_pass);
    $display("[ASSERT] Glitch Check T_a_2_pass:                                   %d", T_a_2_pass);
    $display("[ASSERT] Glitch Check T_b_pass:                                     %d", T_b_pass);
    $display("[ASSERT] Glitch Check T_c_pass:                                     %d", T_c_pass);
    $display("[ASSERT] Glitch Check T_d_pass:                                     %d", T_d_pass);
    $display("[ASSERT] Glitch Check T_e_pass:                                     %d", T_e_pass);
    $display("[ASSERT] Glitch Check T_f_pass:                                     %d", T_f_pass);
    $display("[ASSERT] Glitch Check T_g_pass:                                     %d", T_g_pass);
    $display("[ASSERT] Glitch Check T_h_pass:                                     %d", T_h_pass);
    $display("[ASSERT] Glitch Check T_i_pass:                                     %d", T_i_pass);
    $display("[ASSERT] Glitch Check T_jj_pass:                                    %d", T_jj_pass);
    $display("[ASSERT] Glitch Check T_kk_pass:                                    %d", T_kk_pass);
    $display("[ASSERT] Glitch Check T_ll_pass:                                    %d", T_ll_pass);
    $display("[ASSERT] Glitch Check T_m_pass:                                     %d", T_m_pass);
    $display("[ASSERT] Glitch Check T_n_pass:                                     %d", T_n_pass);
    $display("[ASSERT] Glitch Check T_p_pass:                                     %d", T_p_pass);
    $display("[ASSERT] Glitch Check T_q_pass:                                     %d", T_q_pass);
    $display("[ASSERT] Glitch Check T_test1_pass:                                 %d", T_test1_pass);
    $display("[ASSERT] Glitch Check T_test10_pass:                                %d", T_test10_pass);
    $display("[ASSERT] Glitch Check T_test11_pass:                                %d", T_test11_pass);
    $display("[ASSERT] Glitch Check T_test12_pass:                                %d", T_test12_pass);
    $display("[ASSERT] Glitch Check T_test13_pass:                                %d", T_test13_pass);
    $display("[ASSERT] Glitch Check T_test14_pass:                                %d", T_test14_pass);
    $display("[ASSERT] Glitch Check T_test15_pass:                                %d", T_test15_pass);
    $display("[ASSERT] Glitch Check T_test16_pass:                                %d", T_test16_pass);
    $display("[ASSERT] Glitch Check T_test17_pass:                                %d", T_test17_pass);
    $display("[ASSERT] Glitch Check T_test2_pass:                                 %d", T_test2_pass);
    $display("[ASSERT] Glitch Check T_test3_pass:                                 %d", T_test3_pass);
    $display("[ASSERT] Glitch Check T_test4_pass:                                 %d", T_test4_pass);
    $display("[ASSERT] Glitch Check T_test5_pass:                                 %d", T_test5_pass);
    $display("[ASSERT] Glitch Check T_test6_pass:                                 %d", T_test6_pass);
    $display("[ASSERT] Glitch Check T_test7_pass:                                 %d", T_test7_pass);
    $display("[ASSERT] Glitch Check T_test8_pass:                                 %d", T_test8_pass);
    $display("[ASSERT] Glitch Check T_test9_pass:                                 %d", T_test9_pass);
    $display("[ASSERT] Glitch Check AD_ABC_pass:                                  %d", AD_ABC_pass);
    $display("[ASSERT] Glitch Check AD_DEF_0_pass:                                %d", AD_DEF_0_pass);
    $display("[ASSERT] Glitch Check AD_DEF_1_pass:                                %d", AD_DEF_1_pass);
    $display("[ASSERT] Glitch Check AD_DEF_2_pass:                                %d", AD_DEF_2_pass);
    $display("[ASSERT] Glitch Check AD_DEF_3_pass:                                %d", AD_DEF_3_pass);
    $display("[ASSERT] Glitch Check AD_test1_pass:                                %d", AD_test1_pass);
    $display("[ASSERT] Glitch Check AD_test2_pass:                                %d", AD_test2_pass);
    $display("[ASSERT] Glitch Check AD_test3_pass:                                %d", AD_test3_pass);
    $display("[ASSERT] Glitch Check AD_test4_pass:                                %d", AD_test4_pass);
    $display("[ASSERT] Glitch Check AD_test5_pass:                                %d", AD_test5_pass);
    $display("[ASSERT] Glitch Check AD_test6_pass:                                %d", AD_test6_pass);
    $display("[ASSERT] Glitch Assertion End\n");
end

endmodule