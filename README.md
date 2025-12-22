# Memory Verification Project using UVM (SystemVerilog)

This repository contains a **SystemVerilog + UVM based memory verification project**.  
The project is developed incrementally to demonstrate **core UVM concepts**, **best practices**, and **industry-standard verification flow** for a memory DUT.

It is intended for **learning, practice, and portfolio showcase** in the semiconductor / VLSI verification domain.

---

## 📌 Project Objectives

- Verify a memory design using **SystemVerilog and UVM**
- Understand **UVM architecture and phases**
- Implement **read/write verification**
- Build a **scoreboard for data checking**
- Use **TLM analysis ports**, `uvm_config_db`, and `uvm_resource_db`
- Practice **assertions, objections, and sequences**
- Develop a reusable and scalable UVM environment

---

## 📁 Repository Structure

memory_project_undergoing-uvm-systemverilog
│
├── phase1/
│ └── Basic memory RTL and initial testbench/
│
├── phase2/
│ └── Introduction of UVM components/
│
├── phase3/
│ └── Enhanced UVM environment and sequences/
│
├── UVM_config_db/
│ └── Examples using uvm_config_db/
│
├── resource_db/
│ └── Examples using uvm_resource_db/
│
├── auto_data_retrival/
│ └── Automatic data handling mechanisms/
│
├── AXI_interface/
│ └── AXI-based interface experiments/
│
├── Overriding/
│ └── Factory and type overriding examples/
│
├── memory.v/
│ └── Memory RTL (DUT)/
│
├── mem_tx.sv/
│ └── Sequence item (transaction)/
│
├── mem_agent.sv/
│ └── Agent (sequencer, driver, monitor, coverage)/
│
├── mem_mon.sv/
│ └── Monitor with analysis port/
│
├── mem_sbd.sv/
│ └── Scoreboard/
│
├── mem_assertion.sv/
│ └── SystemVerilog Assertions/
│
├── test_lib.sv/
│ └── Test cases and sequences/
│
├── top.sv/
│ └── Top module (DUT + interface + UVM start)/
│
├── run.do/
│ └── Questa/ModelSim simulation script/
│
└── README.md


---

## 🧠 UVM Architecture Overview

The verification environment follows standard UVM layering:

- **Transaction (`mem_tx`)**
- **Sequence & Sequencer**
- **Driver**
- **Monitor**
- **Agent**
- **Environment**
- **Scoreboard**
- **Test**

### Data Flow:

Sequence → Sequencer → Driver → DUT
↓
Monitor → Scoreboard

---

## 🛠 Key Features Implemented

- ✔ Memory Read / Write verification
- ✔ UVM Sequences and Sequence Items
- ✔ TLM Analysis Port for scoreboard connection
- ✔ Scoreboard with data comparison
- ✔ `uvm_config_db` for configuration
- ✔ Assertions for protocol checking
- ✔ Objection-based run control
- ✔ Modular and reusable UVM components

---

## 🧪 Scoreboard Functionality

The scoreboard:
- Stores write transactions in an associative array
- Compares read data with expected values
- Tracks:
  - Matching transactions
  - Mismatching transactions

All checking is done **passively** inside the `write()` method using the analysis port.

---

## ⏱ Objection Handling

- Tests raise objections in `run_phase`
- Objections are dropped **only after sequences complete**
- Prevents premature end of simulation

Correct pattern:
```systemverilog
phase.raise_objection(this);
seq.start(sequencer);
phase.drop_objection(this);

▶️ How to Run the Simulation
Prerequisites

UVM-capable simulator (Questa / ModelSim / VCS / Xcelium)

UVM 1.2 or simulator built-in UVM

🧠 Learning Outcomes

Through this project, the following UVM concepts are practiced:

-UVM Phases (build, connect, run)
-TLM communication
-Scoreboard design
-Driver–Sequencer handshake
-Objection mechanism
-Debugging common UVM issues
-Best practices for verification environments

Ganesh H R
Design Verification (UVM/SystemVerilog)
Fresher | Semiconductor Verification Enthusiast
