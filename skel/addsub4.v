module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

    wire [3:0] add;
    
	assign add = subsel ? ~B : B;

	add4 adding(
		.carryin(subsel),
		.X(A),
		.Y(add),
		.S(X),
		.carryout(cout),
		.ovf(ovf)
	);
   
endmodule

