#!/usr/local/bin/perl -w

use strict;
use Term::ANSIColor;
use Spreadsheet::XLSX;
#use HTML::Entities;
use List::Util qw[min max];
use Cwd;

sub showUsage {	print colored("Usage:   perl $0 <AD interface XLSX>\n", 'green'),
			                  "Example: perl $0 Spec.xlsx\n"};

#========================================================================================================
# Main Process
#========================================================================================================

if ($#ARGV < 0) {
   showUsage();
   exit 0;
}

my $creattime = localtime();
my $currentpath = getcwd();

printf("Time:       %s\n", $creattime);
printf("Path:       %s\n", $currentpath);
printf("Script:     %s\n", $0);
printf("Input file: %s\n", $ARGV[0]);

my $xlsx_file = Spreadsheet::XLSX->new($ARGV[0]);
my $sheet        ;
my $row          ;
my $col          ;
my $cell         ;
my $name_cell    ;
my $por_cell     ;
my $atpg_cell    ;
my $susp_cell    ;
my $Bus_Width    ;
my $name_col     ;
my $por_col      ;
my $atpg_col     ;
my $susp_col     ;
my $name_col_vld ;
my $por_col_vld  ;
my $atpg_col_vld ;
my $susp_col_vld ;
my @InPort_list  ;
my @OutPort_list ;
my %BW_hash      ;
my %POR_val_hash ;
my %ATPG_val_hash;
my %SUSP_val_hash;
my $por_chk_simlog;
my $atpg_chk_simlog;
my $susp_chk_simlog;

sub all_valid_col {
    my ($val0, $val1, $val2, $val3) = @_;

    if($val0 == 1 && $val1 == 1 && $val2 == 1 && $val3 == 1) {
        printf("All cols found\n");
        return 1;
    }
    else {
        return 0;
    }
}

sub is_Bus {
    my ($in) = @_;
    #printf("in: %s\n", $in);
    if($in =~ s/<(\d+):(\d+)>//) {
        #printf("is Bus\n");
        $Bus_Width = $1-$2+1;
    }
    elsif($in =~ s/&lt;(\d+):(\d+)&gt;//) {
        #printf("is Bus\n");
        $Bus_Width = $1-$2+1;
    }
    else {
        $Bus_Width = 1;
    }
    return $in;
}

sub rmSpace {
    my ($in) = @_;
    $in =~ s/\s+//g;
    return $in;
}

#===============
# Main Process =
#===============
foreach $sheet (@{$xlsx_file -> {Worksheet}}) {
    printf("Parsing Sheet %s ...\n", $sheet->{Name});
    undef $name_col;
    undef $por_col ;
    undef $atpg_col;
    undef $susp_col;
    $name_col_vld  = 0;
    $por_col_vld   = 0;
    $atpg_col_vld  = 0;
    $susp_col_vld  = 0;
    # 1.  search name col, por_col, atpg_col, susp_col
    $sheet->{MaxRow} ||= $sheet->{MinRow};
    foreach $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
        $sheet->{MaxCol} ||= $sheet->{MinCol};
        foreach $col ($sheet->{MinCol} .. $sheet->{MaxCol}) {
            $cell = $sheet->{Cells}[$row][$col];
            if(defined $cell) {
                #printf("(%s, %s) => %s\n", $row, $col, $cell->{Val});
                if ($cell->{Val} =~ /^Name$/) {
                    $name_col = $col;    
                    $name_col_vld  = 1;
                    #printf("Name col found => %s\n", $col);
                }
                elsif ($cell->{Val} =~ /POR/ && $cell->{Val} =~ /Dec/) {
                    $por_col = $col;    
                    $por_col_vld  = 1;
                    #printf("POR default col found => %s\n", $col);
                }
                elsif ($cell->{Val} =~ /ATPG/) {
                    $atpg_col = $col;    
                    $atpg_col_vld  = 1;
                    #printf("ATPG col found => %s\n", $col);
                }
                elsif ($cell->{Val} =~ /Suspend/ && $cell->{Val} =~ /Dec/) {
                    $susp_col = $col;    
                    $susp_col_vld  = 1;
                    #printf("Suspend col found => %s\n", $col);
                }
            }
        }
        if(&all_valid_col($name_col_vld, $por_col_vld, $atpg_col_vld, $susp_col_vld)) {
            last; 
        }
    }

    # 2.a Parse T_xx, TS_xx, DA_xx in name col into @OutPort_list
    # 2.b Parse AD_xx in name col into @InPort_list
    # 2.c create hash with keys from @OutPort_list and InPort_list, key(T_xx, TS_xx, DA_xx) -> bw, por_val, atpg_val, susp_val
    #                                                               key(AD_xx) -> bw
    if(&all_valid_col($name_col_vld, $por_col_vld, $atpg_col_vld, $susp_col_vld)) {
        $sheet->{MaxRow} ||= $sheet->{MinRow};
        foreach $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
            $name_cell = $sheet->{Cells}[$row][$name_col];
            $por_cell  = $sheet->{Cells}[$row][$por_col];
            $atpg_cell = $sheet->{Cells}[$row][$atpg_col];
            $susp_cell = $sheet->{Cells}[$row][$susp_col];
            if(defined $name_cell) {
                my $cell_val = $name_cell->{Val};
                my $por_val  = $por_cell->{Val};
                my $atpg_val = $atpg_cell->{Val};
                my $susp_val = $susp_cell->{Val};
                if (($cell_val =~ /^T_/ || $cell_val =~ /^TS_/ || $cell_val =~ /^DA_/) && $cell_val !~ /xx/i) {
                    #printf("Output Port found => %s\n", $cell_val);
                    $cell_val = &is_Bus($cell_val); #remove bus bracket
                    $cell_val = &rmSpace($cell_val); #remove Space
                    push(@OutPort_list, $cell_val);
                    $BW_hash{$cell_val} = ($Bus_Width =~ /\b\d+\b/) ? int($Bus_Width) : $Bus_Width;
                    $POR_val_hash{$cell_val} = ($por_val =~ /\b\d+\b/) ? int($por_val) : $por_val;
                    $ATPG_val_hash{$cell_val} = ($atpg_val =~ /\b\d+\b/) ? int($atpg_val) : $atpg_val;
                    $SUSP_val_hash{$cell_val} = ($susp_val =~ /\b\d+\b/) ? int($susp_val) : $susp_val;
                }
                elsif (($cell_val =~ /^AD_/) &&  $cell_val !~ /xx/i) {
                    $cell_val = &is_Bus($cell_val); #remove bus bracket
                    $cell_val = &rmSpace($cell_val); #remove Space
                    push(@InPort_list, $cell_val);
                    #printf("Input Port found => %s\n", $cell_val);
                    $BW_hash{$cell_val} = ($Bus_Width =~ /\b\d+\b/) ? int($Bus_Width) : $Bus_Width;
                }
            }
        }
    }
    printf("End parsing Sheet %s\n\n", $sheet->{Name});
}

# Parsed results here
printf "%s\n", , colored("Parsed AD Interface Information", 'green');
printf("================================================================================\n");
printf("|%-30s |%10s |%10s |%10s |%10s|\n", "name","BW","por","atpg","susp");
printf("================================================================================\n");
foreach (@OutPort_list) {
    printf("|%-30s |%10s |%10s |%10s |%10s|\n", $_,$BW_hash{$_},$POR_val_hash{$_},$ATPG_val_hash{$_},$SUSP_val_hash{$_});
}
printf("================================================================================\n");

printf("\n");

printf("============================================\n");
printf("|%-30s |%10s|\n", "name","BW");
printf("============================================\n");
foreach (@InPort_list) {
    printf("|%-30s |%10s|\n", $_,$BW_hash{$_});
}
printf("============================================\n");

# 3.a  Gen Glitch SVA According to Hash information
my $assert_check_io_00 = "";
my $assert_check_pass_01 = "";
my $assert_check_ap_02 = "";
my $assert_check_final_03 = "";
my $assert_shell = "";

#========================================================================================================
# Generate Assertion Top
#========================================================================================================
$assert_check_io_00 .= "//*********************************************************************************************************\n";
$assert_check_io_00 .= "// FILE NAME         : assert_checker_Glitch.v\n";
$assert_check_io_00 .= "// ABSTRACT          : Assertion Top Module for glitch check\n";
$assert_check_io_00 .= "// USER              : $ENV{'USER'}\n";
$assert_check_io_00 .= "// DATE              : $creattime\n";
$assert_check_io_00 .= "// WORKING DIRECTORY : $currentpath\n";
$assert_check_io_00 .= "//*********************************************************************************************************\n";
$assert_check_io_00 .= "\n";
$assert_check_io_00 .= "module assert_checker_Glitch (\n";
#for loop for all Output ports
foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        $assert_check_io_00 .= sprintf("    input   [%d:0]         $_,\n", ($BW_hash{$_}-1));
    }
    else { # 1-bit singals
        $assert_check_io_00 .= sprintf("    input                 $_,\n");
    }
}

#for loop for all Input ports
foreach (sort(@InPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        $assert_check_io_00 .= sprintf("    input   [%d:0]         $_,\n", ($BW_hash{$_}-1));
    }
    else { # 1-bit singals
        $assert_check_io_00 .= sprintf("    input                 $_,\n");
    }
}
$assert_check_io_00 .= "    input                 clk,\n";
$assert_check_io_00 .= "    input                 rstb\n";
$assert_check_io_00 .= ");\n";
$assert_check_io_00 .= "\n";
$assert_check_io_00 .= "assign clk_delay = clk;\n";
$assert_check_io_00 .= "assign rstb_delay = rstb;\n";
$assert_check_io_00 .= "\n";
#print($assert_check_io_00);

#for loop for all Output ports
foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_pass_01 .= sprintf("integer $_" . "_$i". "_pass;\n");
        }
    }
    else {
        $assert_check_pass_01 .= sprintf("integer $_" . "_pass;\n");
    }
}

#for loop for all Input ports
foreach (sort(@InPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_pass_01 .= sprintf("integer $_" . "_$i". "_pass;\n");
        }
    }
    else {
        $assert_check_pass_01 .= sprintf("integer $_" . "_pass;\n");
    }
}

$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= sprintf("initial begin\n");
foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_pass_01 .= sprintf("    $_" . "_$i" . "_pass = 0;\n");
        }
    }
    else {
        $assert_check_pass_01 .= sprintf("    $_" . "_pass = 0;\n");
    }
}
foreach (sort(@InPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_pass_01 .= sprintf("    $_" . "_$i" . "_pass = 0;\n");
        }
    }
    else {
        $assert_check_pass_01 .= sprintf("    $_" . "_pass = 0;\n");
    }
}
$assert_check_pass_01 .= sprintf("end\n");
#print($assert_check_pass_01);

$assert_check_ap_02 .= "\n";
$assert_check_ap_02 .= "//=======================================================================================\n";
$assert_check_ap_02 .= "//  assert_glitch                                                                        \n";
$assert_check_ap_02 .= "//=======================================================================================\n";
$assert_check_ap_02 .= "realtime duration = 20ns;                                                                \n";
$assert_check_ap_02 .= "property glitch_p(sig, rstb, special_case);                                              \n";
$assert_check_ap_02 .= "    realtime first_change;                                                               \n";
$assert_check_ap_02 .= "    @(sig)                                                                               \n";
$assert_check_ap_02 .= "    disable iff((rstb & special_case) != 1'b1)                                           \n";
$assert_check_ap_02 .= "    (1, first_change = \$realtime) |=> ((\$realtime - first_change) >= duration);          \n";
$assert_check_ap_02 .= "endproperty                                                                              \n";
$assert_check_ap_02 .= "\n";

foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_ap_02 .= sprintf("\n");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", "ap_glitch_$_" . "$i:", "assert property(glitch_p($_". "[$i], rstb_delay, 1'b1))");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", ""                    , "       $_" . "_$i" . "_pass += 1;");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", ""                    , "else \$display(\"  [ASSERT] Glitch Warning! $_" . "_$i @ %t.\", \$realtime);");
        }
    }
    else { # 1-bit singals
        $assert_check_ap_02 .= sprintf("\n");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", "ap_glitch_$_:", "assert property(glitch_p($_, rstb_delay, 1'b1))");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", ""             , "       $_"  . "_pass += 1;");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", ""             , "else \$display(\"  [ASSERT] Glitch Warning! $_ @ %t.\", \$realtime);");
    }
}

foreach (sort(@InPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_ap_02 .= sprintf("\n");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", "ap_glitch_$_" . "$i:", "assert property(glitch_p($_". "[$i], rstb_delay, 1'b1))");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", ""                    , "       $_" . "_$i" . "_pass += 1;");
            $assert_check_ap_02 .= sprintf("%-40s %s\n", ""                    , "else \$display(\"  [ASSERT] Glitch Warning! $_" . "_$i @ %t.\", \$realtime);");
        }
    }
    else { # 1-bit singals
        $assert_check_ap_02 .= sprintf("\n");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", "ap_glitch_$_:", "assert property(glitch_p($_, rstb_delay, 1'b1))");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", ""             , "       $_"  . "_pass += 1;");
        $assert_check_ap_02 .= sprintf("%-40s %s\n", ""             , "else \$display(\"  [ASSERT] Glitch Warning! $_ @ %t.\", \$realtime);");
    }
}
#print($assert_check_ap_02);

$assert_check_final_03 .= "\n";
$assert_check_final_03 .= "final\n";
$assert_check_final_03 .= "begin\n";
$assert_check_final_03 .= '    $display("");' . "\n";
$assert_check_final_03 .= '    $display("[ASSERT] Glitch Assertion Summary");' . "\n";

foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_final_03 .= sprintf("%s%-40s%s%s\n", '    $display("[ASSERT] Glitch Check ', "$_" . "_$i" . "_pass:" , '      %d", ' ,  "$_" . "_$i" . "_pass);" );
        }
    }
    else {
        $assert_check_final_03 .= sprintf("%s%-40s%s%s\n", '    $display("[ASSERT] Glitch Check ', "$_" . "_pass:" , '      %d", ' ,  "$_" . "_pass);" );
    }
}

foreach (sort(@InPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        foreach my $i (0..($BW_hash{$_}-1)) {
            $assert_check_final_03 .= sprintf("%s%-40s%s%s\n", '    $display("[ASSERT] Glitch Check ', "$_" . "_$i" . "_pass:" , '      %d", ' ,  "$_" . "_$i" . "_pass);" );
        }
    }
    else {
        $assert_check_final_03 .= sprintf("%s%-40s%s%s\n", '    $display("[ASSERT] Glitch Check ', "$_" . "_pass:" , '      %d", ' ,  "$_" . "_pass);" );
    }
}

$assert_check_final_03 .= '    $display("[ASSERT] Glitch Assertion End\n");' . "\n";
$assert_check_final_03 .= "end\n";
$assert_check_final_03 .= "\n";
$assert_check_final_03 .= "endmodule";
#print($assert_check_final_03);

#========================================================================================================
# Generate assert_checker_Glitchv
#========================================================================================================
print "\nGenerate \"". colored("assert_checker_Glitch.v", 'yellow'). "\"\n";
open(OUT1,">./assert_checker_Glitch.v") or DieMessage("open file ./assert_checker_Glitch.v failed!!");
print OUT1 $assert_check_io_00;
print OUT1 $assert_check_pass_01;
print OUT1 $assert_check_ap_02;
print OUT1 $assert_check_final_03;
close OUT1;

# 3.b  Gen IF SVA According to Hash information
$assert_check_io_00 = "";
$assert_check_pass_01 = "";
$assert_check_ap_02 = "";
$assert_check_final_03 = "";
$assert_shell = "";

#========================================================================================================
# Generate Assertion Top
#========================================================================================================
$assert_check_io_00 .= "//*********************************************************************************************************\n";
$assert_check_io_00 .= "// FILE NAME         : assert_checker_ADIF.v\n";
$assert_check_io_00 .= "// ABSTRACT          : Assertion Top Module for ADInterface check\n";
$assert_check_io_00 .= "// USER              : $ENV{'USER'}\n";
$assert_check_io_00 .= "// DATE              : $creattime\n";
$assert_check_io_00 .= "// WORKING DIRECTORY : $currentpath\n";
$assert_check_io_00 .= "//*********************************************************************************************************\n";
$assert_check_io_00 .= "\n";
$assert_check_io_00 .= "module assert_checker_ADIF (\n";
#for loop for all Output ports
foreach (sort(@OutPort_list)) {
    if($BW_hash{$_} > 1) {# multi-bit signals
        $assert_check_io_00 .= sprintf("    input   [%d:0]         $_,\n", ($BW_hash{$_}-1));
    }
    else { # 1-bit singals
        $assert_check_io_00 .= sprintf("    input                 $_,\n");
    }
}
$assert_check_io_00 .= "    input                 rstb,\n";
$assert_check_io_00 .= "    input                 atpg,\n";
$assert_check_io_00 .= "    input                 susp\n";
$assert_check_io_00 .= ");\n";
#print($assert_check_io_00);

$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= "parameter CHK_STROB = 20; //change Strobe time\n";
$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= "reg por_chk;\n";
$assert_check_pass_01 .= "reg atpg_chk;\n";
$assert_check_pass_01 .= "reg susp_chk;\n";
$assert_check_pass_01 .= "initial begin\n";
$assert_check_pass_01 .= "    por_chk   = 1'b0;\n";
$assert_check_pass_01 .= "    atpg_chk  = 1'b0;\n";
$assert_check_pass_01 .= "    susp_chk  = 1'b0;\n";
$assert_check_pass_01 .= "end\n";
$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= "//=======================================================================================\n";
$assert_check_pass_01 .= "//  POR_VAL                                                                              \n";
$assert_check_pass_01 .= "//=======================================================================================\n";
foreach (@OutPort_list) {
    if($POR_val_hash{$_} ne "NA") {
        $assert_check_pass_01 .= sprintf("%-50s%s\n", "integer $_" . "_por_val;" , "parameter $_" . "_por_ans = $POR_val_hash{$_};");
    }
}
$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= "//=======================================================================================\n";
$assert_check_pass_01 .= "//  ATPG_VAL                                                                              \n";
$assert_check_pass_01 .= "//=======================================================================================\n";
foreach (@OutPort_list) {
    if($ATPG_val_hash{$_} ne "NA") {
        $assert_check_pass_01 .= sprintf("%-50s%s\n", "integer $_" . "_atpg_val;" , "parameter $_" . "_atpg_ans = $ATPG_val_hash{$_};");
    }
}
$assert_check_pass_01 .= "\n";
$assert_check_pass_01 .= "//=======================================================================================\n";
$assert_check_pass_01 .= "//  SUSP_VAL                                                                              \n";
$assert_check_pass_01 .= "//=======================================================================================\n";
foreach (@OutPort_list) {
    if($SUSP_val_hash{$_} ne "NA") {
        $assert_check_pass_01 .= sprintf("%-50s%s\n", "integer $_" . "_susp_val;" , "parameter $_" . "_susp_ans = $SUSP_val_hash{$_};");
    }
}
$assert_check_pass_01 .= "\n";
#print($assert_check_pass_01);

$assert_check_ap_02 .= "//=======================================================================================\n";
$assert_check_ap_02 .= "//  assert_ADinterface                                                                   \n";
$assert_check_ap_02 .= "//=======================================================================================\n";
$assert_check_ap_02 .= "always@(rstb) \n";
$assert_check_ap_02 .= "begin\n";
$assert_check_ap_02 .= "    #(CHK_STROB);\n";
$assert_check_ap_02 .= "    if(!rstb && !atpg)\n";
$assert_check_ap_02 .= "    begin\n";
$assert_check_ap_02 .= "        por_chk = 1'b1;\n";
$assert_check_ap_02 .= "        \$display(\"[ASSERT] POR check @ %t\", \$realtime);\n";
foreach (@OutPort_list) {
    if($POR_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%-20s\n", "        $_"."_por_val", "=  $_;");
    }
}
$assert_check_ap_02 .= "\n";
foreach (@OutPort_list) {
    if($POR_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%s\n", "        ap_chk_por_$_: ", "assert($_"."_por_val == " . "$_" . "_por_ans)");
        $assert_check_ap_02 .=  sprintf("%54s%s\n" , "else", "   \$display(\"[ASSERT] Error @ %t, POR check $_\", \$realtime);"  );
        $assert_check_ap_02 .= "\n";
    }
}
$assert_check_ap_02 .= "    end\n";
$assert_check_ap_02 .= "end\n";
$assert_check_ap_02 .= "\n";
$assert_check_ap_02 .= "always@(atpg)\n"; 
$assert_check_ap_02 .= "begin\n";
$assert_check_ap_02 .= "    #(CHK_STROB);\n";
$assert_check_ap_02 .= "    if(atpg && rstb)\n";
$assert_check_ap_02 .= "    begin\n";
$assert_check_ap_02 .= "        atpg_chk = 1'b1;\n";
$assert_check_ap_02 .= "        \$display(\"[ASSERT] ATPG check @ %t\", \$realtime);\n";
foreach (@OutPort_list) {
    if($ATPG_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%-20s\n", "        $_"."_atpg_val", "=  $_;");
    }
}
$assert_check_ap_02 .= "\n";
foreach (@OutPort_list) {
    if($ATPG_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%s\n", "        ap_chk_atpg_$_: ", "assert($_"."_atpg_val == " . "$_" . "_atpg_ans)");
        $assert_check_ap_02 .=  sprintf("%54s%s\n" , "else", "   \$display(\"[ASSERT] Error @ %t, ATPG check $_\", \$realtime);"  );
        $assert_check_ap_02 .= "\n";
    }
}
$assert_check_ap_02 .= "    end\n";
$assert_check_ap_02 .= "end\n";
$assert_check_ap_02 .= "\n";
$assert_check_ap_02 .= "always@(susp)\n"; 
$assert_check_ap_02 .= "begin\n";
$assert_check_ap_02 .= "    #(CHK_STROB);\n";
$assert_check_ap_02 .= "    if(susp && ~atpg)\n";
$assert_check_ap_02 .= "    begin\n";
$assert_check_ap_02 .= "        susp_chk = 1'b1;\n";
$assert_check_ap_02 .= "        \$display(\"[ASSERT] Suspend check @ %t\", \$realtime);\n";
foreach (@OutPort_list) {
    if($SUSP_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%-20s\n", "        $_"."_susp_val", "=  $_;");
    }
}
$assert_check_ap_02 .= "\n";
foreach (@OutPort_list) {
    if($SUSP_val_hash{$_} ne "NA") {
        $assert_check_ap_02 .=  sprintf("%-50s%s\n", "        ap_chk_susp_$_: ", "assert($_"."_susp_val == " . "$_" . "_susp_ans)");
        $assert_check_ap_02 .=  sprintf("%54s%s\n" , "else", "   \$display(\"[ASSERT] Error @ %t, Suspend check $_\", \$realtime);"  );
        $assert_check_ap_02 .= "\n";
    }
}
$assert_check_ap_02 .= "    end\n";
$assert_check_ap_02 .= "end\n";
$assert_check_ap_02 .= "\n";

#print($assert_check_ap_02);

$assert_check_final_03 .= "final\n";
$assert_check_final_03 .= "begin\n";
$assert_check_final_03 .= "    \$display(\"\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] ADInterface Assertion Summary\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] NA         : no need to check\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] NoE        : no check event\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] val1       : val1 read and Pass\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] val1(val2) : val1 read but val2 should be read instead\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] =======================================================================\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] |Signal                           |%10s |%10s |%10s |\", \"POR\", \"ATPG\", \"Suspend\");\n";
$assert_check_final_03 .= "    \$display(\"[ASSERT] =======================================================================\");\n";
foreach (@OutPort_list) {
    if($POR_val_hash{$_} ne "NA") {
        $por_chk_simlog = "chk_result_log(0, por_chk, $_"."_por_val, $_" . "_por_ans)";
    }
    else {
        $por_chk_simlog = "chk_result_log(1, por_chk, 1, 1)";
    }

    if($ATPG_val_hash{$_} ne "NA") {
        $atpg_chk_simlog = "chk_result_log(0, atpg_chk, $_"."_atpg_val, $_" . "_atpg_ans)";
    }
    else {
        $atpg_chk_simlog = "chk_result_log(1, atpg_chk, 1, 1)";
    }

    if($SUSP_val_hash{$_} ne "NA") {
        $susp_chk_simlog = "chk_result_log(0, susp_chk, $_"."_susp_val, $_" . "_susp_ans)";
    }
    else {
        $susp_chk_simlog = "chk_result_log(1, susp_chk, 1, 1)";
    }

    $assert_check_final_03 .= sprintf("%s%-33s%s%100s%100s%100s\n" , 
    "    \$display(\"[ASSERT] |", 
    "$_", 
    "|%10s |%10s |%10s |\",", 
    "$por_chk_simlog, ", 
    "$atpg_chk_simlog, ", 
    "$susp_chk_simlog);" 
    );
}
$assert_check_final_03 .= "    \$display(\"[ASSERT] =======================================================================\");\n";
$assert_check_final_03 .= "end\n";
$assert_check_final_03 .= "\n";
$assert_check_final_03 .= "endmodule\n";
$assert_check_final_03 .= "\n";
$assert_check_final_03 .= "function string chk_result_log(input NA, input chk_flg, input integer val_read, input integer val_golden);\n";
$assert_check_final_03 .= "    if(NA) // no need to check\n";
$assert_check_final_03 .= "        chk_result_log = \"NA\";\n";
$assert_check_final_03 .= "    else if(!chk_flg) // should check but no check event\n";
$assert_check_final_03 .= "        chk_result_log = \"NoE\";\n";
$assert_check_final_03 .= "    else if(val_read == val_golden) // Pass \n";
$assert_check_final_03 .= "        chk_result_log = \$sformatf(\"%3d\", val_read);\n";
$assert_check_final_03 .= "    else // Fail\n";
$assert_check_final_03 .= "        chk_result_log = \$sformatf(\"%3d(%3d)\", val_read, val_golden);\n";
$assert_check_final_03 .= "endfunction\n";

#print($assert_check_final_03);

#========================================================================================================
# Generate assert_checker_ADInterface
#========================================================================================================
print "Generate \"". colored("assert_checker_ADIF.v", 'yellow'). "\"\n";
open(OUT1,">./assert_checker_ADIF.v") or DieMessage("open file ./assert_checker_ADIF.v failed!!");
print OUT1 $assert_check_io_00;
print OUT1 $assert_check_pass_01;
print OUT1 $assert_check_ap_02;
print OUT1 $assert_check_final_03;
close OUT1;
