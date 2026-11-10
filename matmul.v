`timescale 1ns/1ps

module dot3 (
    input  wire signed [7:0] a0,
    input  wire signed [7:0] a1,
    input  wire signed [7:0] a2,
    input  wire signed [7:0] b0,
    input  wire signed [7:0] b1,
    input  wire signed [7:0] b2,
    output wire signed [31:0] y
);
    assign y = a0 * b0 + a1 * b1 + a2 * b2;
endmodule

module matmul #(
    parameter integer N = 3,
    parameter integer IN_W = 8,
    parameter integer OUT_W = 32
) (
    input  wire signed [N*N*IN_W-1:0]  a_flat,
    input  wire signed [N*N*IN_W-1:0]  b_flat,
    output wire signed [N*N*OUT_W-1:0] c_flat
);
    genvar i;
    genvar j;
    generate
        for (i = 0; i < N; i = i + 1) begin : rows
            for (j = 0; j < N; j = j + 1) begin : cols
                dot3 u_dot (
                    .a0(a_flat[((i*N+0)*IN_W) +: IN_W]),
                    .a1(a_flat[((i*N+1)*IN_W) +: IN_W]),
                    .a2(a_flat[((i*N+2)*IN_W) +: IN_W]),
                    .b0(b_flat[((0*N+j)*IN_W) +: IN_W]),
                    .b1(b_flat[((1*N+j)*IN_W) +: IN_W]),
                    .b2(b_flat[((2*N+j)*IN_W) +: IN_W]),
                    .y(c_flat[((i*N+j)*OUT_W) +: OUT_W])
                );
            end
        end
    endgenerate
endmodule

module tb;
    localparam integer N = 3;
    localparam integer IN_W = 8;
    localparam integer OUT_W = 32;
    reg  signed [N*N*IN_W-1:0]  a_flat;
    reg  signed [N*N*IN_W-1:0]  b_flat;
    wire signed [N*N*OUT_W-1:0] c_flat;
    integer expected [0:8];
    integer index;
    integer failures;

    matmul #(.N(N), .IN_W(IN_W), .OUT_W(OUT_W)) dut (
        .a_flat(a_flat),
        .b_flat(b_flat),
        .c_flat(c_flat)
    );

    initial begin
        a_flat = '0;
        b_flat = '0;
        a_flat[(0*IN_W) +: IN_W] = 1;
        a_flat[(1*IN_W) +: IN_W] = 2;
        a_flat[(2*IN_W) +: IN_W] = 3;
        a_flat[(3*IN_W) +: IN_W] = 4;
        a_flat[(4*IN_W) +: IN_W] = 5;
        a_flat[(5*IN_W) +: IN_W] = 6;
        a_flat[(6*IN_W) +: IN_W] = 7;
        a_flat[(7*IN_W) +: IN_W] = 8;
        a_flat[(8*IN_W) +: IN_W] = 9;

        b_flat[(0*IN_W) +: IN_W] = 9;
        b_flat[(1*IN_W) +: IN_W] = 8;
        b_flat[(2*IN_W) +: IN_W] = 7;
        b_flat[(3*IN_W) +: IN_W] = 6;
        b_flat[(4*IN_W) +: IN_W] = 5;
        b_flat[(5*IN_W) +: IN_W] = 4;
        b_flat[(6*IN_W) +: IN_W] = 3;
        b_flat[(7*IN_W) +: IN_W] = 2;
        b_flat[(8*IN_W) +: IN_W] = 1;

        expected[0] = 30;  expected[1] = 24;  expected[2] = 18;
        expected[3] = 84;  expected[4] = 69;  expected[5] = 54;
        expected[6] = 138; expected[7] = 114; expected[8] = 90;

        #1;
        failures = 0;
        $display("Verilog result (3x3):");
        for (index = 0; index < N*N; index = index + 1) begin
            $write("%0d%s", $signed(c_flat[(index*OUT_W) +: OUT_W]),
                   (index % N == N-1) ? "\n" : " ");
            if ($signed(c_flat[(index*OUT_W) +: OUT_W]) !== expected[index])
                failures = failures + 1;
        end
        if (failures == 0)
            $display("PASS: Verilog output matches C reference.");
        else
            $display("FAIL: %0d mismatches.", failures);
        $finish;
    end
endmodule
