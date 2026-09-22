
module tb_lab2();
  
  reg [1:0] OP;
  reg [3:0] A, B;
  wire [9:0] out;
  
  calculator u1(.OP(OP), .A(A), .B(B), .out(out));
  
  initial begin
    OP = 2'b00;
    A = 4'b0101; //   5
    B = 4'b0010; // + 2
    #10 $display("%b",out);  // should output 00000111 = +7
    OP = 2'b10;
    A = 4'b0110; //   6
    B = 4'b1001; // * 9 
    #10 $display("%b",out);  // should output 00110110 = 54
        OP = 2'b10; A = 4'b0101; B = 4'b0011;
    #10 $display("%b",out);
    OP = 2'b01;
    A = 4'b0110; //   6
    B = 4'b0111; // - 7 
    #10 $display("%b",out);  // should output 00001111 = -1

// add at least 4 more tests to check your implementation	 

	  
    $finish;
  end
  
endmodule
		   
		   
