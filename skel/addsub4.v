
module addsub4 (
	       input [3:0] A, B,
	       input subsel,
	       output [3:0] X,
	       output cout, ovf
	       );

   reg [4:0]		  C;
   reg [3:0]		add;
   integer		      k;
   
   always @(A, B, subsel)
    begin

	(subsel = 1) ? add = ~B :  add = B;

	for (k = 0; k < 4; k = k+1)
	  begin
	     S[k] = A[k] ^ twos[k] ^ C[k];
	     C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
 	  end
	carryout = C[4];
	ovf = C[4] ^ C[3];
    end
   
endmodule

