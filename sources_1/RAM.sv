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

// module RAM (
//     input  logic        clk,
//     input  logic        we,
//     input logic [2:0] func3,
//     input  logic [31:0] addr,
//     input  logic [31:0] wData,
//     output logic [31:0] rData
// );
//     logic [31:0] mem[0:2**6-1];  // 0x00 ~ 0x0f => 0x10 * 4 => 0x40

//         // always_ff @(posedge clk) begin
//         //     if (we) mem[addr[31:2]] <= wData;
//         // end

//     always_ff @(posedge clk) begin
//         if (we) begin
//             case (func3[1:0])
//                 2'b00: begin // SB
//                     case (addr[1:0])
//                         2'b00:   mem[addr[31:2]][7:0] <= wData[7:0];
//                         2'b01:   mem[addr[31:2]][15:8] <= wData[15:8];
//                         2'b10:   mem[addr[31:2]][23:16] <= wData[23:16];
//                         2'b11:   mem[addr[31:2]][31:24] <= wData[31:24];
//                         default: mem[addr[31:2]][7:0] <= wData[7:0];
//                     endcase
//                 end 
//                 2'b01: begin // SH
//                     case (addr[1:0])
                        
//                     endcase
//                 end 
//                 2'b10: begin // SW
//                     mem[addr[31:2]] <= wData;
//                 end 
//             endcase
//         end
//     end

//     assign rData = mem[addr[31:2]];

// endmodule

