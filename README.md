## How to Simulate:

1. Download all the files and store in a folder
2. Run the commands in terminal in the same path: 
   ```sh
   iverilog -o output ALU.v register_file.v top_module.v test.v
   ```
   ```sh
   vvp output
   ```
   ```sh
   gtkwave wave.vcd
   ```
---

# ALU and Register File Implementation for 8-bit Processor

## Problem Statement
Design an **Iverilog code** to implement:
1. **ALU**: Supports logical operations (`AND`, `OR`, `NAND`, `NOR`) based on a 2-bit opcode.
2. **Register File**:
   - Consists of 8 registers, each 8 bits in size.
   - Saves the result of the ALU operation in one of the registers.
   - Performs read operations to display the output.

## Guidelines
1. The **DDCO Hackathon** will be conducted on **20/11/24** from **1:30 PM to 3:30 PM**. Students must report with their team members in their respective classes by **1:30 PM** without fail.
   - **Note**: All students should bring all the submitted lab programs.
2. The **Iverilog code** must use **Gate-level modeling** or **Structural modeling** as practiced in lab sessions.
3. Students may reuse their **Iverilog lab codes** for this problem statement.
4. The following materials must be submitted:
   - **Iverilog code files**:
     - `module.v` (ALU and Register File implementation)
     - `testbench.v` (Testbench for simulation)
   - **PDF documentation**:
     - Snapshot of `module.v` code
     - Snapshot of `testbench.v` code
     - Console output in **decimal** snapshot
     - **GTKWave** waveform snapshot
5. All files must be zipped and uploaded with the name format: **SRN___all_student_SRN.zip**.

## Submission Checklist
1. `module.v` file containing:
   - ALU implementation for logical operations (`AND`, `OR`, `NAND`, `NOR`).
   - Register file implementation with 8 registers.
   - Concatenated ALU and Register File functionality.
2. `testbench.v` file for simulating the designed module.
3. A PDF containing:
   - Code snapshots (`module.v` and `testbench.v`).
   - Console output in decimal format.
   - Waveform snapshots using **GTKWave**.
4. Final zipped file named as per the format: **SRN___all_student_SRN.zip**.

