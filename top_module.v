module Alu_Reg (
    input clk, reset,
    input [7:0] A, B,
    input [1:0] opcode,
    input [2:0] write_addr, read_addr,
    input write_enable,
    output [7:0] alu_result,
    output [7:0] read_data
);
    wire [7:0] alu_out;

    // ALU instance
    ALU alu_inst (.A(A), .B(B), .opcode(opcode), .result(alu_out));

    // Register file instance
    register_file reg_file_inst (
        .write_addr(write_addr),
        .read_addr(read_addr),
        .write_data(alu_out),
        .write_enable(write_enable),
        .clk(clk),
        .reset(reset),
        .read_data(read_data)
    );

    assign alu_result = alu_out;
endmodule
