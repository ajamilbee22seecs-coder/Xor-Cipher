module xor_cipher (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  data_in,   // plaintext / ciphertext in
    input  wire [7:0]  key,       // XOR key
    output reg  [7:0]  data_out   // encrypted / decrypted out
);

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 8'b0;
        end else begin
            data_out <= data_in ^ key;
        end
    end

endmodule
