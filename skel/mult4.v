
module mult4 (
	     input [3:0] A, B,
	     output [7:0] X
	     );

    wire [3:0] p1; // p for partial
    wire [3:0] p2;
    wire [3:0] p3;
    wire [3:0] p4;
    
    wire [3:0] sum1;
    wire [3:0] sum2;
    wire [3:0] sum3;
    
    wire [2:0] carry; 
    
    wire [2:0] unused_overflow;  
    
    assign p0 = A & B[0];
    assign p1 = A & B[1];
    assign p2 = A & B[2];
    assign p3 = A & B[3];
    
    add4 a1(
        .carryin(0), 
        .X({1'b0, p1[3:1]}), 
        .Y(p2), 
        .S(sum1),
        .carryout(carry[0]), 
        .ovf(unused_overflow[0])
    );
    
    add4 a2(
        .carryin(0), 
        .X({carry[0], p2[3:1]}), 
        .Y(p3), 
        .S(sum2),
        .carryout(carry[1]), 
        .ovf(unused_overflow[1])
    );
    
    add4 a3(
        .carryin(0), 
        .X({carry[1], p3[3:1]}), 
        .Y(p4),
        .S(sum3),
        .carryout(carry[2]), 
        .ovf(unused_overflow[2])
    );
    
    assign X[0]     = p1[0];
    assign X[1]     = sum1[0];
    assign X[2]     = sum2[0];
    assign X[6:3]   = sum3;
    assign X[7]     = carry[2];
   
endmodule // mult4

