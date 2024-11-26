# xlsx2SVA
## Desciption
perl script to generate SVA checker.   
Oftentimes Design Spec are provided in Spreadsheet format listing information such as signal Power-on reset value, Suspend value, ATPG tied value ... .   
This perl script parse such Spreasheet and generate SVA checker accordingly.   
For more information about SVA checker : https://github.com/Sbing-yuan/SVA_for_TG    
## Usage
perl xlsx2SVA.pl <.xlsx>   
output files:   
assert_checker_ADIF.v  
assert_checker_Glitch.v   
## Example
```
john_she@DESKTOP:/mnt/d/git repo/xlsx2SVA$ perl xlsx2SVA.pl test.xlsx
Time:       Tue Nov 26 22:13:08 2024
Path:       /mnt/d/git repo/xlsx2SVA
Script:     xlsx2SVA.pl
Input file: test.xlsx
Parsing Sheet History ...
End parsing Sheet History

Parsing Sheet sheet1 ...
All cols found
All cols found
End parsing Sheet sheet1

Parsing Sheet sheet2 ...
All cols found
All cols found
End parsing Sheet sheet2

Parsed AD Interface Information
================================================================================
|name                           |        BW |       por |      atpg |      susp|
================================================================================
|T_test1                        |         1 |         1 |        NA |        NA|
|T_test2                        |         1 |         0 |        NA |        NA|
|T_test3                        |         1 |         0 |        NA |        NA|
|T_test4                        |         1 |         1 |         1 |        NA|
|T_test5                        |         1 |         0 |         0 |        NA|
|T_test6                        |         1 |         0 |         0 |        NA|
|DA_test1                       |         1 |        NA |        NA |        NA|
|TS_test1                       |         1 |         0 |         0 |         0|
|TS_test2                       |         1 |         0 |         0 |         0|
|TS_test3                       |         1 |         1 |         1 |         1|
|T_test7                        |         1 |         1 |         1 |        NA|
|T_test8                        |         1 |         0 |         1 |        NA|
|T_test9                        |         1 |         0 |         0 |        NA|
|T_test10                       |         1 |         0 |         0 |        NA|
|T_test11                       |         1 |         0 |         0 |        NA|
|T_test12                       |         1 |         0 |         0 |        NA|
|T_test13                       |         1 |         1 |        NA |        NA|
|T_test14                       |         1 |         1 |        NA |        NA|
|DA_test2                       |        64 |        NA |        NA |        NA|
|TS_test4                       |         1 |         0 |         1 |        NA|
|TS_test5                       |         1 |         0 |         1 |        NA|
|T_test15                       |         1 |         0 |         0 |         0|
|T_test16                       |         1 |         0 |         0 |         0|
|T_test17                       |         1 |         0 |         0 |         0|
|TS_test6                       |         1 |         1 |         0 |         1|
|TS_test7                       |         1 |         1 |         0 |         1|
|TS_test8                       |         4 |         1 |         1 |         1|
|T_a                            |         3 |         6 |        NA |        NA|
|T_b                            |         1 |         0 |        NA |        NA|
|T_c                            |         1 |         1 |        NA |        NA|
|T_d                            |         1 |         0 |        NA |        NA|
|T_e                            |         1 |         0 |        NA |        NA|
|T_f                            |         1 |         0 |        NA |        NA|
|T_g                            |         1 |         1 |        NA |        NA|
|T_h                            |         1 |         1 |        NA |        NA|
|T_i                            |         1 |         1 |        NA |        NA|
|T_jj                           |         1 |         0 |        NA |        NA|
|T_kk                           |         1 |         1 |        NA |        NA|
|T_ll                           |         1 |         1 |        NA |        NA|
|T_m                            |         1 |         1 |        NA |        NA|
|T_n                            |         1 |         1 |        NA |        NA|
|T_O                            |         1 |         0 |        NA |        NA|
|T_p                            |         1 |         1 |        NA |        NA|
|T_q                            |         1 |         1 |        NA |        NA|
|TS_ap                          |         1 |        NA |        NA |        NA|
|TS_ac                          |         5 |        16 |        NA |        NA|
|TS_gg_enl                      |         1 |         1 |         1 |         1|
================================================================================

============================================
|name                           |        BW|
============================================
|AD_test1                       |         1|
|AD_test2                       |         1|
|AD_test3                       |         1|
|AD_test4                       |         1|
|AD_test5                       |         1|
|AD_test6                       |         1|
|AD_ABC                         |         1|
|AD_DEF                         |         4|
============================================

Generate "assert_checker_Glitch.v"
Generate "assert_checker_ADIF.v"
```
