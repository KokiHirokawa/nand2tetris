// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

load isNegative.hdl,
output-file isNegative.out,
compare-to isNegative.cmp,
output-list in%B2.16.2 out%B2.1.2;

set in %B0000000000000000,
eval,
output;

set in %B1111111111111111,
eval,
output;

set in %B0111111111111111,
eval,
output;

set in %B1000000000000000,
eval,
output;
