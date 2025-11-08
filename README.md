#Memory Design - SystemVerilog

This project implements a memory module using SystemVerilog with advanced testbench features. The design demonstrates read and write operations, address-based access, and data verification using structured and object-oriented SystemVerilog constructs.

**Overview**:
The SystemVerilog memory project focuses on modeling a synthesizable memory unit and verifying its behavior using both procedural and class-based testbenches. It highlights how SystemVerilog improves design abstraction, parameterization, and verification capabilities compared to traditional Verilog.

**Main Features**:

Parameterized memory depth and width.

Synchronous write and asynchronous read logic.

Structured testbench with stimulus generation and data checking.

Use of SystemVerilog data types like logic and bit.

Enhanced readability and maintainability using procedural blocks.

**Design Details**:
The memory module is implemented using a parameterized two-dimensional array.
Data is written into memory on the positive edge of the clock when the write enable signal is asserted.
During a read operation, the data at the specified address is read asynchronously.
SystemVerilog logic type is used to handle both combinational and sequential assignments, ensuring better synthesis compatibility.
This memory design can serve as a basic model for cache memory, register files, or instruction memory in processor-based systems.

**Testbench Description**:
The testbench generates clock and reset signals, applies multiple write and read transactions, and verifies data integrity.
It uses SystemVerilog procedural blocks for generating stimuli and assertions for checking results.
Optionally, the design can be extended using classes and randomized testcases for functional coverage.
