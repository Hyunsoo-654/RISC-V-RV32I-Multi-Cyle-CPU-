# RV32I Multi-Cycle CPU

This project is a Verilog/SystemVerilog implementation of a **RV32I Multi-Cycle CPU**.  
It extends from my previous **single-cycle CPU design** into a multi-cycle architecture using an FSM-based control unit.

The CPU executes RISC-V RV32I instructions in five stages:
1. IF (Instruction Fetch)
2. ID (Instruction Decode / Register Fetch)
3. EX (Execute / ALU operations)
4. MEM (Memory access)
5. WB (Write back)

The purpose of this project is to better understand CPU micro-architecture, instruction execution flow, and control signal generation.
