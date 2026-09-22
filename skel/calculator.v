
module calculator (
		   input [1:0]	OP,
		   input [3:0]	A, B,
		   output [9:0]	out
		   );

    wire		cout, ovf;   // carry_out and overflow
    wire [3:0]	outa;        // adder output
    wire [7:0]	outm;        // multiplier output

    addsub4 operation1(
        .A(A),
        .B(B),
        .subsel(OP[0]),
        .X(outa), 
        .cout(cout), 
        .ovf(ovf)
    );
    
    mult4 operation2(
        .A(A),
        .B(B),
        .X(outm)
    );
    
    mux10 select(
        .in0({ovf, cout, 4'b0, outa}),
        .in1({2'b0, outm}),
        .sel(OP[1]),
        .out(out)
    );
	
endmodule // calculator
