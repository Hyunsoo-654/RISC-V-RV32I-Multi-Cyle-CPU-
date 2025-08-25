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

## Motivation
- Started from a **single-cycle CPU** implementation to understand the basic datapath and control signal flow.
- Extended to a **multi-cycle CPU** to study how instructions can be executed over multiple clock cycles using an FSM-based control unit.
- Goal: not high performance, but **clarity and educational value**.

## Features
- Supports the full RV32I instruction set
- FSM-based control unit with states: FETCH, DECODE, EXECUTE, MEM, WB
- Separate modules:
  - ControlUnit
  - DataPath
  - ROM 
  - RAM
  - CPU
  - MCU

## Project Structure
- `src/` : Verilog/SystemVerilog source files
  - `MCU.sv` : TOP
  - `CPU_RV32I.sv` : CPU module
  - `ControlUnit.sv` : FSM-based control
  - `DataPath.sv` : Data path implementation
  - `RAM.sv` : Data memory module
  - `ROM.sv` : Instruction memory module
- `testbench/` : Testbench for simulation
- `code.mem` : Example machine code for testing
