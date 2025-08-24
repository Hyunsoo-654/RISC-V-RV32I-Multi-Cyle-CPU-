`timescale 1ns / 1ps

module RAM (
    input  logic        clk,
    input  logic        we,
    input  logic [2:0]  func3,   
    input  logic [31:0] addr,
    input  logic [31:0] wData,   
    output logic [31:0] rData
);
    logic [31:0] mem[0:2**6-1];
    wire  [31:2] width = addr[31:2];

    always_ff @(posedge clk) begin
        if (we) begin
            case (func3)
                3'b000: begin // SB
                    mem[width][8*addr[1:0] +: 8] <= wData[7:0];
                end
                3'b001: begin // SH
                    mem[width][16*addr[1] +: 16] <= wData[15:0];
                end
                3'b010: begin // SW
                    mem[width] <= wData;
                end
                default: mem[width] <= wData; 
            endcase
        end
    end

    assign rData = mem[width];

endmodule

