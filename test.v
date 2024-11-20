module test;
    reg clk, reset;
    reg [7:0] A, B;
    reg [1:0] opcode;
    reg [2:0] write_addr, read_addr;
    reg write_enable;
    wire [7:0] alu_result, read_data;

    Alu_Reg dut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .opcode(opcode),
        .write_addr(write_addr),
        .read_addr(read_addr),
        .write_enable(write_enable),
        .alu_result(alu_result),
        .read_data(read_data)
    );

    // Clock signal
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);

        reset = 1; #10; reset = 0;

        // Perform AND operation
        A = 8'b10101010; B = 8'b11001100; opcode = 2'b00;
        write_addr = 3'b000; write_enable = 1; #10;
        $display("AND Operation: A = %b (%d), B = %b (%d), Result = %b (%d)", A,A,B, B, alu_result,alu_result);

        // Perform OR operation
        A = 8'b10101010; B = 8'b11001100; opcode = 2'b01;
        write_addr = 3'b001; write_enable = 1; #10;
        $display("OR Operation: A = %b (%d), B = %b (%d), Result = %b (%d)", A,A,B, B, alu_result,alu_result);

        // Perform NAND operation
        A = 8'b10101010; B = 8'b11001100; opcode = 2'b10;
        write_addr = 3'b010; write_enable = 1; #10;
        $display("NAND Operation: A = %b (%d), B = %b (%d), Result = %b (%d)", A,A,B, B, alu_result,alu_result);

        // Perform NOR operation
        A = 8'b10101010; B = 8'b11001100; opcode = 2'b11;
        write_addr = 3'b011; write_enable = 1; #10;
        $display("NOR Operation: A = %b (%d), B = %b (%d), Result = %b (%d)", A,A,B, B, alu_result,alu_result);

        // Read data from registers
        write_enable = 0;
        read_addr = 3'b000; #10;
        $display("Read Data from Address %b: %b", read_addr, read_data);
        read_addr = 3'b001; #10;
        $display("Read Data from Address %b: %b", read_addr, read_data);
        read_addr = 3'b010; #10;
        $display("Read Data from Address %b: %b", read_addr, read_data);
        read_addr = 3'b011; #10;
        $display("Read Data from Address %b: %b", read_addr, read_data);

        $finish;
    end
endmodule
