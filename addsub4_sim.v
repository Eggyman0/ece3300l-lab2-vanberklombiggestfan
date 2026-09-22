module addsub4_sim ()
reg [3:0] A;
reg [3:0] B;
reg subsel;

wire [3:0] X;
wire cout, ovf;

addsub4 uut(A, B, subsel);
initial begin
subsel = 0; A = 4; B = 6;
#1

subsel = 1;
#1

A = 6; B = 4;
#1
end
endmodule

