
module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

   reg [3:0]		add;
   
   always @(A, B, subsel)
    begin

	(subsel = 1) ? add = ~B :  add = B;

	add4 adding(
		.carryin(subsel),
		.X(A),
		.Y(add),
		.S(X),
		.carryout(cout),
		.ovf(ovf)
	)
    end
   
endmodule

