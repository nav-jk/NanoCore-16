#  NanoCore-16: A 16-bit RISC CPU Built from First Principles

**NanoCore-16** is a fully functional, 16-bit RISC-style CPU designed and implemented from scratch using only logic-level components — **without Verilog or HDL**. Built in the **Digital** logic simulation environment, this project replicates the fundamental design of a real processor by manually wiring the datapath, control logic, ALU, register file, memory, and instruction decoder.

---

##  Features

- **16-bit wide architecture**
- **4 general-purpose registers** (`R0`–`R3`)
- **Instruction support:**
  - Arithmetic: `ADD`, `SUB`
  - Logic: `AND`, `OR`, `XOR`
  - Data movement: `MOVE`, `LOAD`
  - Control flow: `JUMP`, `BEQ` (branch if equal)
- **Custom instruction set architecture (ISA)** with immediate and register modes
- **Manual instruction encoding** using [CustomASM](https://github.com/HLorenzi/customasm)
- **ROM/RAM-based program memory**
- **Program counter (PC)** supports 16 instructions (`PC = 0–15`)

---

##  Verilog Port Under Development

A hardware description language (HDL) implementation of **NanoCore-16 in Verilog** is currently in progress. This port will reproduce the same architecture and instruction set, enabling simulation in tools like **ModelSim** or deployment to **FPGAs**.

---

##  Educational Value

NanoCore-16 was built to:

- Deepen understanding of computer architecture
- Simulate the behavior of a low-level CPU without using HDL
- Showcase system-level design thinking and digital logic fluency

---
