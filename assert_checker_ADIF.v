//*********************************************************************************************************
// FILE NAME         : assert_checker_ADIF.v
// ABSTRACT          : Assertion Top Module for ADInterface check
// USER              : john_she
// DATE              : Tue Nov 26 22:13:08 2024
// WORKING DIRECTORY : /mnt/d/git repo/xlsx2SVA
//*********************************************************************************************************

module assert_checker_ADIF (
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
    input                 rstb,
    input                 atpg,
    input                 susp
);

parameter CHK_STROB = 20; //change Strobe time

reg por_chk;
reg atpg_chk;
reg susp_chk;
initial begin
    por_chk   = 1'b0;
    atpg_chk  = 1'b0;
    susp_chk  = 1'b0;
end

//=======================================================================================
//  POR_VAL                                                                              
//=======================================================================================
integer T_test1_por_val;                          parameter T_test1_por_ans = 1;
integer T_test2_por_val;                          parameter T_test2_por_ans = 0;
integer T_test3_por_val;                          parameter T_test3_por_ans = 0;
integer T_test4_por_val;                          parameter T_test4_por_ans = 1;
integer T_test5_por_val;                          parameter T_test5_por_ans = 0;
integer T_test6_por_val;                          parameter T_test6_por_ans = 0;
integer TS_test1_por_val;                         parameter TS_test1_por_ans = 0;
integer TS_test2_por_val;                         parameter TS_test2_por_ans = 0;
integer TS_test3_por_val;                         parameter TS_test3_por_ans = 1;
integer T_test7_por_val;                          parameter T_test7_por_ans = 1;
integer T_test8_por_val;                          parameter T_test8_por_ans = 0;
integer T_test9_por_val;                          parameter T_test9_por_ans = 0;
integer T_test10_por_val;                         parameter T_test10_por_ans = 0;
integer T_test11_por_val;                         parameter T_test11_por_ans = 0;
integer T_test12_por_val;                         parameter T_test12_por_ans = 0;
integer T_test13_por_val;                         parameter T_test13_por_ans = 1;
integer T_test14_por_val;                         parameter T_test14_por_ans = 1;
integer TS_test4_por_val;                         parameter TS_test4_por_ans = 0;
integer TS_test5_por_val;                         parameter TS_test5_por_ans = 0;
integer T_test15_por_val;                         parameter T_test15_por_ans = 0;
integer T_test16_por_val;                         parameter T_test16_por_ans = 0;
integer T_test17_por_val;                         parameter T_test17_por_ans = 0;
integer TS_test6_por_val;                         parameter TS_test6_por_ans = 1;
integer TS_test7_por_val;                         parameter TS_test7_por_ans = 1;
integer TS_test8_por_val;                         parameter TS_test8_por_ans = 1;
integer T_a_por_val;                              parameter T_a_por_ans = 6;
integer T_b_por_val;                              parameter T_b_por_ans = 0;
integer T_c_por_val;                              parameter T_c_por_ans = 1;
integer T_d_por_val;                              parameter T_d_por_ans = 0;
integer T_e_por_val;                              parameter T_e_por_ans = 0;
integer T_f_por_val;                              parameter T_f_por_ans = 0;
integer T_g_por_val;                              parameter T_g_por_ans = 1;
integer T_h_por_val;                              parameter T_h_por_ans = 1;
integer T_i_por_val;                              parameter T_i_por_ans = 1;
integer T_jj_por_val;                             parameter T_jj_por_ans = 0;
integer T_kk_por_val;                             parameter T_kk_por_ans = 1;
integer T_ll_por_val;                             parameter T_ll_por_ans = 1;
integer T_m_por_val;                              parameter T_m_por_ans = 1;
integer T_n_por_val;                              parameter T_n_por_ans = 1;
integer T_O_por_val;                              parameter T_O_por_ans = 0;
integer T_p_por_val;                              parameter T_p_por_ans = 1;
integer T_q_por_val;                              parameter T_q_por_ans = 1;
integer TS_ac_por_val;                            parameter TS_ac_por_ans = 16;
integer TS_gg_enl_por_val;                        parameter TS_gg_enl_por_ans = 1;

//=======================================================================================
//  ATPG_VAL                                                                              
//=======================================================================================
integer T_test4_atpg_val;                         parameter T_test4_atpg_ans = 1;
integer T_test5_atpg_val;                         parameter T_test5_atpg_ans = 0;
integer T_test6_atpg_val;                         parameter T_test6_atpg_ans = 0;
integer TS_test1_atpg_val;                        parameter TS_test1_atpg_ans = 0;
integer TS_test2_atpg_val;                        parameter TS_test2_atpg_ans = 0;
integer TS_test3_atpg_val;                        parameter TS_test3_atpg_ans = 1;
integer T_test7_atpg_val;                         parameter T_test7_atpg_ans = 1;
integer T_test8_atpg_val;                         parameter T_test8_atpg_ans = 1;
integer T_test9_atpg_val;                         parameter T_test9_atpg_ans = 0;
integer T_test10_atpg_val;                        parameter T_test10_atpg_ans = 0;
integer T_test11_atpg_val;                        parameter T_test11_atpg_ans = 0;
integer T_test12_atpg_val;                        parameter T_test12_atpg_ans = 0;
integer TS_test4_atpg_val;                        parameter TS_test4_atpg_ans = 1;
integer TS_test5_atpg_val;                        parameter TS_test5_atpg_ans = 1;
integer T_test15_atpg_val;                        parameter T_test15_atpg_ans = 0;
integer T_test16_atpg_val;                        parameter T_test16_atpg_ans = 0;
integer T_test17_atpg_val;                        parameter T_test17_atpg_ans = 0;
integer TS_test6_atpg_val;                        parameter TS_test6_atpg_ans = 0;
integer TS_test7_atpg_val;                        parameter TS_test7_atpg_ans = 0;
integer TS_test8_atpg_val;                        parameter TS_test8_atpg_ans = 1;
integer TS_gg_enl_atpg_val;                       parameter TS_gg_enl_atpg_ans = 1;

//=======================================================================================
//  SUSP_VAL                                                                              
//=======================================================================================
integer TS_test1_susp_val;                        parameter TS_test1_susp_ans = 0;
integer TS_test2_susp_val;                        parameter TS_test2_susp_ans = 0;
integer TS_test3_susp_val;                        parameter TS_test3_susp_ans = 1;
integer T_test15_susp_val;                        parameter T_test15_susp_ans = 0;
integer T_test16_susp_val;                        parameter T_test16_susp_ans = 0;
integer T_test17_susp_val;                        parameter T_test17_susp_ans = 0;
integer TS_test6_susp_val;                        parameter TS_test6_susp_ans = 1;
integer TS_test7_susp_val;                        parameter TS_test7_susp_ans = 1;
integer TS_test8_susp_val;                        parameter TS_test8_susp_ans = 1;
integer TS_gg_enl_susp_val;                       parameter TS_gg_enl_susp_ans = 1;

//=======================================================================================
//  assert_ADinterface                                                                   
//=======================================================================================
always@(rstb) 
begin
    #(CHK_STROB);
    if(!rstb && !atpg)
    begin
        por_chk = 1'b1;
        $display("[ASSERT] POR check @ %t", $realtime);
        T_test1_por_val                           =  T_test1;         
        T_test2_por_val                           =  T_test2;         
        T_test3_por_val                           =  T_test3;         
        T_test4_por_val                           =  T_test4;         
        T_test5_por_val                           =  T_test5;         
        T_test6_por_val                           =  T_test6;         
        TS_test1_por_val                          =  TS_test1;        
        TS_test2_por_val                          =  TS_test2;        
        TS_test3_por_val                          =  TS_test3;        
        T_test7_por_val                           =  T_test7;         
        T_test8_por_val                           =  T_test8;         
        T_test9_por_val                           =  T_test9;         
        T_test10_por_val                          =  T_test10;        
        T_test11_por_val                          =  T_test11;        
        T_test12_por_val                          =  T_test12;        
        T_test13_por_val                          =  T_test13;        
        T_test14_por_val                          =  T_test14;        
        TS_test4_por_val                          =  TS_test4;        
        TS_test5_por_val                          =  TS_test5;        
        T_test15_por_val                          =  T_test15;        
        T_test16_por_val                          =  T_test16;        
        T_test17_por_val                          =  T_test17;        
        TS_test6_por_val                          =  TS_test6;        
        TS_test7_por_val                          =  TS_test7;        
        TS_test8_por_val                          =  TS_test8;        
        T_a_por_val                               =  T_a;             
        T_b_por_val                               =  T_b;             
        T_c_por_val                               =  T_c;             
        T_d_por_val                               =  T_d;             
        T_e_por_val                               =  T_e;             
        T_f_por_val                               =  T_f;             
        T_g_por_val                               =  T_g;             
        T_h_por_val                               =  T_h;             
        T_i_por_val                               =  T_i;             
        T_jj_por_val                              =  T_jj;            
        T_kk_por_val                              =  T_kk;            
        T_ll_por_val                              =  T_ll;            
        T_m_por_val                               =  T_m;             
        T_n_por_val                               =  T_n;             
        T_O_por_val                               =  T_O;             
        T_p_por_val                               =  T_p;             
        T_q_por_val                               =  T_q;             
        TS_ac_por_val                             =  TS_ac;           
        TS_gg_enl_por_val                         =  TS_gg_enl;       

        ap_chk_por_T_test1:                       assert(T_test1_por_val == T_test1_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test1", $realtime);

        ap_chk_por_T_test2:                       assert(T_test2_por_val == T_test2_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test2", $realtime);

        ap_chk_por_T_test3:                       assert(T_test3_por_val == T_test3_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test3", $realtime);

        ap_chk_por_T_test4:                       assert(T_test4_por_val == T_test4_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test4", $realtime);

        ap_chk_por_T_test5:                       assert(T_test5_por_val == T_test5_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test5", $realtime);

        ap_chk_por_T_test6:                       assert(T_test6_por_val == T_test6_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test6", $realtime);

        ap_chk_por_TS_test1:                      assert(TS_test1_por_val == TS_test1_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test1", $realtime);

        ap_chk_por_TS_test2:                      assert(TS_test2_por_val == TS_test2_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test2", $realtime);

        ap_chk_por_TS_test3:                      assert(TS_test3_por_val == TS_test3_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test3", $realtime);

        ap_chk_por_T_test7:                       assert(T_test7_por_val == T_test7_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test7", $realtime);

        ap_chk_por_T_test8:                       assert(T_test8_por_val == T_test8_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test8", $realtime);

        ap_chk_por_T_test9:                       assert(T_test9_por_val == T_test9_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test9", $realtime);

        ap_chk_por_T_test10:                      assert(T_test10_por_val == T_test10_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test10", $realtime);

        ap_chk_por_T_test11:                      assert(T_test11_por_val == T_test11_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test11", $realtime);

        ap_chk_por_T_test12:                      assert(T_test12_por_val == T_test12_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test12", $realtime);

        ap_chk_por_T_test13:                      assert(T_test13_por_val == T_test13_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test13", $realtime);

        ap_chk_por_T_test14:                      assert(T_test14_por_val == T_test14_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test14", $realtime);

        ap_chk_por_TS_test4:                      assert(TS_test4_por_val == TS_test4_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test4", $realtime);

        ap_chk_por_TS_test5:                      assert(TS_test5_por_val == TS_test5_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test5", $realtime);

        ap_chk_por_T_test15:                      assert(T_test15_por_val == T_test15_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test15", $realtime);

        ap_chk_por_T_test16:                      assert(T_test16_por_val == T_test16_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test16", $realtime);

        ap_chk_por_T_test17:                      assert(T_test17_por_val == T_test17_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_test17", $realtime);

        ap_chk_por_TS_test6:                      assert(TS_test6_por_val == TS_test6_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test6", $realtime);

        ap_chk_por_TS_test7:                      assert(TS_test7_por_val == TS_test7_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test7", $realtime);

        ap_chk_por_TS_test8:                      assert(TS_test8_por_val == TS_test8_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_test8", $realtime);

        ap_chk_por_T_a:                           assert(T_a_por_val == T_a_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_a", $realtime);

        ap_chk_por_T_b:                           assert(T_b_por_val == T_b_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_b", $realtime);

        ap_chk_por_T_c:                           assert(T_c_por_val == T_c_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_c", $realtime);

        ap_chk_por_T_d:                           assert(T_d_por_val == T_d_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_d", $realtime);

        ap_chk_por_T_e:                           assert(T_e_por_val == T_e_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_e", $realtime);

        ap_chk_por_T_f:                           assert(T_f_por_val == T_f_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_f", $realtime);

        ap_chk_por_T_g:                           assert(T_g_por_val == T_g_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_g", $realtime);

        ap_chk_por_T_h:                           assert(T_h_por_val == T_h_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_h", $realtime);

        ap_chk_por_T_i:                           assert(T_i_por_val == T_i_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_i", $realtime);

        ap_chk_por_T_jj:                          assert(T_jj_por_val == T_jj_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_jj", $realtime);

        ap_chk_por_T_kk:                          assert(T_kk_por_val == T_kk_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_kk", $realtime);

        ap_chk_por_T_ll:                          assert(T_ll_por_val == T_ll_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_ll", $realtime);

        ap_chk_por_T_m:                           assert(T_m_por_val == T_m_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_m", $realtime);

        ap_chk_por_T_n:                           assert(T_n_por_val == T_n_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_n", $realtime);

        ap_chk_por_T_O:                           assert(T_O_por_val == T_O_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_O", $realtime);

        ap_chk_por_T_p:                           assert(T_p_por_val == T_p_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_p", $realtime);

        ap_chk_por_T_q:                           assert(T_q_por_val == T_q_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check T_q", $realtime);

        ap_chk_por_TS_ac:                         assert(TS_ac_por_val == TS_ac_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_ac", $realtime);

        ap_chk_por_TS_gg_enl:                     assert(TS_gg_enl_por_val == TS_gg_enl_por_ans)
                                                  else   $display("[ASSERT] Error @ %t, POR check TS_gg_enl", $realtime);

    end
end

always@(atpg)
begin
    #(CHK_STROB);
    if(atpg && rstb)
    begin
        atpg_chk = 1'b1;
        $display("[ASSERT] ATPG check @ %t", $realtime);
        T_test4_atpg_val                          =  T_test4;         
        T_test5_atpg_val                          =  T_test5;         
        T_test6_atpg_val                          =  T_test6;         
        TS_test1_atpg_val                         =  TS_test1;        
        TS_test2_atpg_val                         =  TS_test2;        
        TS_test3_atpg_val                         =  TS_test3;        
        T_test7_atpg_val                          =  T_test7;         
        T_test8_atpg_val                          =  T_test8;         
        T_test9_atpg_val                          =  T_test9;         
        T_test10_atpg_val                         =  T_test10;        
        T_test11_atpg_val                         =  T_test11;        
        T_test12_atpg_val                         =  T_test12;        
        TS_test4_atpg_val                         =  TS_test4;        
        TS_test5_atpg_val                         =  TS_test5;        
        T_test15_atpg_val                         =  T_test15;        
        T_test16_atpg_val                         =  T_test16;        
        T_test17_atpg_val                         =  T_test17;        
        TS_test6_atpg_val                         =  TS_test6;        
        TS_test7_atpg_val                         =  TS_test7;        
        TS_test8_atpg_val                         =  TS_test8;        
        TS_gg_enl_atpg_val                        =  TS_gg_enl;       

        ap_chk_atpg_T_test4:                      assert(T_test4_atpg_val == T_test4_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test4", $realtime);

        ap_chk_atpg_T_test5:                      assert(T_test5_atpg_val == T_test5_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test5", $realtime);

        ap_chk_atpg_T_test6:                      assert(T_test6_atpg_val == T_test6_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test6", $realtime);

        ap_chk_atpg_TS_test1:                     assert(TS_test1_atpg_val == TS_test1_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test1", $realtime);

        ap_chk_atpg_TS_test2:                     assert(TS_test2_atpg_val == TS_test2_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test2", $realtime);

        ap_chk_atpg_TS_test3:                     assert(TS_test3_atpg_val == TS_test3_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test3", $realtime);

        ap_chk_atpg_T_test7:                      assert(T_test7_atpg_val == T_test7_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test7", $realtime);

        ap_chk_atpg_T_test8:                      assert(T_test8_atpg_val == T_test8_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test8", $realtime);

        ap_chk_atpg_T_test9:                      assert(T_test9_atpg_val == T_test9_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test9", $realtime);

        ap_chk_atpg_T_test10:                     assert(T_test10_atpg_val == T_test10_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test10", $realtime);

        ap_chk_atpg_T_test11:                     assert(T_test11_atpg_val == T_test11_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test11", $realtime);

        ap_chk_atpg_T_test12:                     assert(T_test12_atpg_val == T_test12_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test12", $realtime);

        ap_chk_atpg_TS_test4:                     assert(TS_test4_atpg_val == TS_test4_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test4", $realtime);

        ap_chk_atpg_TS_test5:                     assert(TS_test5_atpg_val == TS_test5_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test5", $realtime);

        ap_chk_atpg_T_test15:                     assert(T_test15_atpg_val == T_test15_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test15", $realtime);

        ap_chk_atpg_T_test16:                     assert(T_test16_atpg_val == T_test16_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test16", $realtime);

        ap_chk_atpg_T_test17:                     assert(T_test17_atpg_val == T_test17_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check T_test17", $realtime);

        ap_chk_atpg_TS_test6:                     assert(TS_test6_atpg_val == TS_test6_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test6", $realtime);

        ap_chk_atpg_TS_test7:                     assert(TS_test7_atpg_val == TS_test7_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test7", $realtime);

        ap_chk_atpg_TS_test8:                     assert(TS_test8_atpg_val == TS_test8_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_test8", $realtime);

        ap_chk_atpg_TS_gg_enl:                    assert(TS_gg_enl_atpg_val == TS_gg_enl_atpg_ans)
                                                  else   $display("[ASSERT] Error @ %t, ATPG check TS_gg_enl", $realtime);

    end
end

always@(susp)
begin
    #(CHK_STROB);
    if(susp && ~atpg)
    begin
        susp_chk = 1'b1;
        $display("[ASSERT] Suspend check @ %t", $realtime);
        TS_test1_susp_val                         =  TS_test1;        
        TS_test2_susp_val                         =  TS_test2;        
        TS_test3_susp_val                         =  TS_test3;        
        T_test15_susp_val                         =  T_test15;        
        T_test16_susp_val                         =  T_test16;        
        T_test17_susp_val                         =  T_test17;        
        TS_test6_susp_val                         =  TS_test6;        
        TS_test7_susp_val                         =  TS_test7;        
        TS_test8_susp_val                         =  TS_test8;        
        TS_gg_enl_susp_val                        =  TS_gg_enl;       

        ap_chk_susp_TS_test1:                     assert(TS_test1_susp_val == TS_test1_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test1", $realtime);

        ap_chk_susp_TS_test2:                     assert(TS_test2_susp_val == TS_test2_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test2", $realtime);

        ap_chk_susp_TS_test3:                     assert(TS_test3_susp_val == TS_test3_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test3", $realtime);

        ap_chk_susp_T_test15:                     assert(T_test15_susp_val == T_test15_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check T_test15", $realtime);

        ap_chk_susp_T_test16:                     assert(T_test16_susp_val == T_test16_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check T_test16", $realtime);

        ap_chk_susp_T_test17:                     assert(T_test17_susp_val == T_test17_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check T_test17", $realtime);

        ap_chk_susp_TS_test6:                     assert(TS_test6_susp_val == TS_test6_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test6", $realtime);

        ap_chk_susp_TS_test7:                     assert(TS_test7_susp_val == TS_test7_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test7", $realtime);

        ap_chk_susp_TS_test8:                     assert(TS_test8_susp_val == TS_test8_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_test8", $realtime);

        ap_chk_susp_TS_gg_enl:                    assert(TS_gg_enl_susp_val == TS_gg_enl_susp_ans)
                                                  else   $display("[ASSERT] Error @ %t, Suspend check TS_gg_enl", $realtime);

    end
end

final
begin
    $display("");
    $display("[ASSERT] ADInterface Assertion Summary");
    $display("[ASSERT] NA         : no need to check");
    $display("[ASSERT] NoE        : no check event");
    $display("[ASSERT] val1       : val1 read and Pass");
    $display("[ASSERT] val1(val2) : val1 read but val2 should be read instead");
    $display("[ASSERT] =======================================================================");
    $display("[ASSERT] |Signal                           |%10s |%10s |%10s |", "POR", "ATPG", "Suspend");
    $display("[ASSERT] =======================================================================");
    $display("[ASSERT] |T_test1                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test1_por_val, T_test1_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test2                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test2_por_val, T_test2_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test3                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test3_por_val, T_test3_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test4                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test4_por_val, T_test4_por_ans),                                    chk_result_log(0, atpg_chk, T_test4_atpg_val, T_test4_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test5                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test5_por_val, T_test5_por_ans),                                    chk_result_log(0, atpg_chk, T_test5_atpg_val, T_test5_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test6                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test6_por_val, T_test6_por_ans),                                    chk_result_log(0, atpg_chk, T_test6_atpg_val, T_test6_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |DA_test1                         |%10s |%10s |%10s |",                                                                  chk_result_log(1, por_chk, 1, 1),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_test1                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test1_por_val, TS_test1_por_ans),                                  chk_result_log(0, atpg_chk, TS_test1_atpg_val, TS_test1_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test1_susp_val, TS_test1_susp_ans));
    $display("[ASSERT] |TS_test2                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test2_por_val, TS_test2_por_ans),                                  chk_result_log(0, atpg_chk, TS_test2_atpg_val, TS_test2_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test2_susp_val, TS_test2_susp_ans));
    $display("[ASSERT] |TS_test3                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test3_por_val, TS_test3_por_ans),                                  chk_result_log(0, atpg_chk, TS_test3_atpg_val, TS_test3_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test3_susp_val, TS_test3_susp_ans));
    $display("[ASSERT] |T_test7                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test7_por_val, T_test7_por_ans),                                    chk_result_log(0, atpg_chk, T_test7_atpg_val, T_test7_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test8                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test8_por_val, T_test8_por_ans),                                    chk_result_log(0, atpg_chk, T_test8_atpg_val, T_test8_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test9                          |%10s |%10s |%10s |",                                      chk_result_log(0, por_chk, T_test9_por_val, T_test9_por_ans),                                    chk_result_log(0, atpg_chk, T_test9_atpg_val, T_test9_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test10                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test10_por_val, T_test10_por_ans),                                  chk_result_log(0, atpg_chk, T_test10_atpg_val, T_test10_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test11                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test11_por_val, T_test11_por_ans),                                  chk_result_log(0, atpg_chk, T_test11_atpg_val, T_test11_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test12                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test12_por_val, T_test12_por_ans),                                  chk_result_log(0, atpg_chk, T_test12_atpg_val, T_test12_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test13                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test13_por_val, T_test13_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test14                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test14_por_val, T_test14_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |DA_test2                         |%10s |%10s |%10s |",                                                                  chk_result_log(1, por_chk, 1, 1),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_test4                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test4_por_val, TS_test4_por_ans),                                  chk_result_log(0, atpg_chk, TS_test4_atpg_val, TS_test4_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_test5                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test5_por_val, TS_test5_por_ans),                                  chk_result_log(0, atpg_chk, TS_test5_atpg_val, TS_test5_atpg_ans),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_test15                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test15_por_val, T_test15_por_ans),                                  chk_result_log(0, atpg_chk, T_test15_atpg_val, T_test15_atpg_ans),                                  chk_result_log(0, susp_chk, T_test15_susp_val, T_test15_susp_ans));
    $display("[ASSERT] |T_test16                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test16_por_val, T_test16_por_ans),                                  chk_result_log(0, atpg_chk, T_test16_atpg_val, T_test16_atpg_ans),                                  chk_result_log(0, susp_chk, T_test16_susp_val, T_test16_susp_ans));
    $display("[ASSERT] |T_test17                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, T_test17_por_val, T_test17_por_ans),                                  chk_result_log(0, atpg_chk, T_test17_atpg_val, T_test17_atpg_ans),                                  chk_result_log(0, susp_chk, T_test17_susp_val, T_test17_susp_ans));
    $display("[ASSERT] |TS_test6                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test6_por_val, TS_test6_por_ans),                                  chk_result_log(0, atpg_chk, TS_test6_atpg_val, TS_test6_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test6_susp_val, TS_test6_susp_ans));
    $display("[ASSERT] |TS_test7                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test7_por_val, TS_test7_por_ans),                                  chk_result_log(0, atpg_chk, TS_test7_atpg_val, TS_test7_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test7_susp_val, TS_test7_susp_ans));
    $display("[ASSERT] |TS_test8                         |%10s |%10s |%10s |",                                    chk_result_log(0, por_chk, TS_test8_por_val, TS_test8_por_ans),                                  chk_result_log(0, atpg_chk, TS_test8_atpg_val, TS_test8_atpg_ans),                                  chk_result_log(0, susp_chk, TS_test8_susp_val, TS_test8_susp_ans));
    $display("[ASSERT] |T_a                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_a_por_val, T_a_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_b                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_b_por_val, T_b_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_c                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_c_por_val, T_c_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_d                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_d_por_val, T_d_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_e                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_e_por_val, T_e_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_f                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_f_por_val, T_f_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_g                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_g_por_val, T_g_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_h                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_h_por_val, T_h_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_i                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_i_por_val, T_i_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_jj                             |%10s |%10s |%10s |",                                            chk_result_log(0, por_chk, T_jj_por_val, T_jj_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_kk                             |%10s |%10s |%10s |",                                            chk_result_log(0, por_chk, T_kk_por_val, T_kk_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_ll                             |%10s |%10s |%10s |",                                            chk_result_log(0, por_chk, T_ll_por_val, T_ll_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_m                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_m_por_val, T_m_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_n                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_n_por_val, T_n_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_O                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_O_por_val, T_O_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_p                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_p_por_val, T_p_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |T_q                              |%10s |%10s |%10s |",                                              chk_result_log(0, por_chk, T_q_por_val, T_q_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_ap                            |%10s |%10s |%10s |",                                                                  chk_result_log(1, por_chk, 1, 1),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_ac                            |%10s |%10s |%10s |",                                          chk_result_log(0, por_chk, TS_ac_por_val, TS_ac_por_ans),                                                                  chk_result_log(1, atpg_chk, 1, 1),                                                                  chk_result_log(1, susp_chk, 1, 1));
    $display("[ASSERT] |TS_gg_enl                        |%10s |%10s |%10s |",                                  chk_result_log(0, por_chk, TS_gg_enl_por_val, TS_gg_enl_por_ans),                                chk_result_log(0, atpg_chk, TS_gg_enl_atpg_val, TS_gg_enl_atpg_ans),                                chk_result_log(0, susp_chk, TS_gg_enl_susp_val, TS_gg_enl_susp_ans));
    $display("[ASSERT] =======================================================================");
end

endmodule

function string chk_result_log(input NA, input chk_flg, input integer val_read, input integer val_golden);
    if(NA) // no need to check
        chk_result_log = "NA";
    else if(!chk_flg) // should check but no check event
        chk_result_log = "NoE";
    else if(val_read == val_golden) // Pass 
        chk_result_log = $sformatf("%3d", val_read);
    else // Fail
        chk_result_log = $sformatf("%3d(%3d)", val_read, val_golden);
endfunction
