module mult4 (
    input  [3:0] A, B,
    output [7:0] X
);

    wire [3:0] p0, p1, p2, p3;
    wire [3:0] sum1, sum2, sum3;
    wire [2:0] carry;
    wire [2:0] unused_overflow;

    // Partial products
    assign p0 = A & {4{B[0]}};
    assign p1 = A & {4{B[1]}};
    assign p2 = A & {4{B[2]}};
    assign p3 = A & {4{B[3]}};

    // Add partial products column by column
    add4 a1 (
        .carryin(1'b0),
        .X({1'b0, p0[3:1]}),
        .Y(p1),
        .S(sum1),
        .carryout(carry[0]),
        .ovf(unused_overflow[0])
    );

    add4 a2 (
        .carryin(1'b0),
        .X({carry[0], sum1[3:1]}),
        .Y(p2),
        .S(sum2),
        .carryout(carry[1]),
        .ovf(unused_overflow[1])
    );

    add4 a3 (
        .carryin(1'b0),
        .X({carry[1], sum2[3:1]}),
        .Y(p3),
        .S(sum3),
        .carryout(carry[2]),
        .ovf(unused_overflow[2])
    );

    // Product output
    assign X[0]   = p0[0];
    assign X[1]   = sum1[0];
    assign X[2]   = sum2[0];
    assign X[6:3] = sum3;
    assign X[7]   = carry[2];

endmodule