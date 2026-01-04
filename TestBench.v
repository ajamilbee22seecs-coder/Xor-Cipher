module xor_cipher_tb();

    reg clk;
    reg rst;
    reg [7:0] data_in;
    reg [7:0] key;
    wire [7:0] data_out;

    xor_cipher dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .key(key),
        .data_out(data_out)
    );

    // Clock generation (same style as your RISC-V TB)
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b0;
        data_in = 8'b0;
        key = 8'b0;

        // Reset sequence
        #2  rst = 1'b1;
        #6  rst = 1'b0;

        // Test vectors
        #10 data_in = 8'hAA; key = 8'h0F; // Expect A5
        #10 data_in = 8'h55; key = 8'hFF; // Expect AA
        #10 data_in = 8'h00; key = 8'h12; // Expect 12
        #10 data_in = 8'hF0; key = 8'h0F; // Expect FF

        #50 $stop;
    end

endmodule
