module ALU (
    input [7:0] A, B,
    input [1:0] opcode,
    output [7:0] result
);
    wire [7:0] and_out, or_out, nand_out, nor_out;
    wire [7:0] mux0, mux1;

    // AND operation
    and and_gates [7:0] (and_out, A, B);

    // OR operation
    or or_gates [7:0] (or_out, A, B);

    // NAND operation
    nand nand_gates [7:0] (nand_out, A, B);

    // NOR operation
    nor nor_gates [7:0] (nor_out, A, B);

    // 4-to-1 multiplexer implementation
    assign mux0 = (opcode[0] == 1'b0) ? and_out : or_out;
    assign mux1 = (opcode[0] == 1'b0) ? nand_out : nor_out;
    assign result = (opcode[1] == 1'b0) ? mux0 : mux1;

endmodule
