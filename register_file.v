module d_ff (
    input D, clk, reset,
    output Q, Qbar
);
    wire w1, w2;

    nand(w1, D, clk);
    nand(w2, ~D, clk);
    nand(Q, w1, Qbar);
    nand(Qbar, w2, Q);
endmodule

module register (
    input [7:0] D,
    input clk, reset,
    output [7:0] Q
);
    wire [7:0] Qbar;
    d_ff dffs [7:0] (D, clk, reset, Q, Qbar);
endmodule

module decoder3to8 (
    input [2:0] addr,
    output [7:0] out
);
    assign out[0] = ~addr[2] & ~addr[1] & ~addr[0];
    assign out[1] = ~addr[2] & ~addr[1] & addr[0];
    assign out[2] = ~addr[2] & addr[1] & ~addr[0];
    assign out[3] = ~addr[2] & addr[1] & addr[0];
    assign out[4] = addr[2] & ~addr[1] & ~addr[0];
    assign out[5] = addr[2] & ~addr[1] & addr[0];
    assign out[6] = addr[2] & addr[1] & ~addr[0];
    assign out[7] = addr[2] & addr[1] & addr[0];
endmodule

module register_file (
    input [2:0] write_addr,
    input [2:0] read_addr,
    input [7:0] write_data,
    input write_enable,
    input clk, reset,
    output [7:0] read_data
);
    wire [7:0] decoded_write;
    wire [7:0] registers [7:0];

    decoder3to8 dec (.addr(write_addr), .out(decoded_write));

    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) begin : reg_block
            wire write_en = decoded_write[i] & write_enable;
            register reg_inst (.D(write_data), .clk(write_en), .reset(reset), .Q(registers[i]));
        end
    endgenerate

    assign read_data = registers[read_addr];
endmodule
