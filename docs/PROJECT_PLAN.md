# 🧠 Personal Chip Design Project Plan  
### 반도체 설계 토탈프로젝트

---

## 1️⃣ Project Title
**Traffic Light Controller with 7-Segment Display**

---

## 2️⃣ Objective
Design a digital traffic light controller using an FSM (Finite State Machine)  
that controls Red, Yellow, and Green LEDs based on timing logic,  
and display the remaining time on a 7-segment display.

---

## 3️⃣ System Overview
The system operates with three states (RED → GREEN → YELLOW → RED).  
Each state maintains a fixed duration (10s / 7s / 3s) using a counter,  
and the remaining seconds are shown on a 7-segment display.

---

### 4️⃣ Block Diagram

### 🔷 4️⃣ Block Diagram

                    ┌────────────────────────────────────────────────────┐
                    │                     Top Module                     │
                    │────────────────────────────────────────────────────│
                    │                                                    │
                    │   ┌────────────┐                                   │
                    │   │ Clock Div. │  →  저속 클록(1Hz) 생성           │
Clock (50MHz) ─────▶│   └────────────┘                                   │
                    │          │                                          │
                    │          ▼                                          │
                    │   ┌────────────┐                                   │
                    │   │   Timer    │  ← 현재 상태 지속시간 카운트       │
                    │   └────────────┘                                   │
                    │          │  count, done                             │
                    │          ▼                                          │
                    │   ┌────────────┐                                   │
                    │   │ FSM Logic  │  (RED → GREEN → YELLOW 순환)      │
                    │   └────────────┘                                   │
                    │          │  state                                  │
                    │          ▼                                          │
                    │   ┌────────────┐                                   │
                    │   │ LED Ctrl   │  → LED 출력 (R,Y,G 제어)          │
                    │   └────────────┘                                   │
                    │          │                                          │
                    │          ▼                                          │
                    │   ┌────────────┐                                   │
                    │   │ 7-Segment  │  ← 남은 시간 표시                 │
                    │   └────────────┘                                   │
                    │          │                                          │
                    │          ▼                                          │
                    │      7-Seg Display                                 │
                    │                                                    │
                    └────────────────────────────────────────────────────┘

---

### 💡 설명 요약

| 블록 | 역할 |
|------|------|
| **Clock Divider** | 시스템 클록(50MHz)을 1Hz로 분주하여 타이머에 공급 |
| **Timer** | 상태(FSM)에 따라 RED=10초, GREEN=7초, YELLOW=3초 카운트다운 |
| **FSM Logic** | Timer의 done 신호를 받아 다음 상태로 전이 |
| **LED Control** | FSM 상태에 따라 R, Y, G LED 점등 제어 |
| **7-Segment** | Timer의 count 값을 디지털 숫자로 표시 |

---

## 5️⃣ Design Modules
| Module | Function | Description |
|---------|-----------|-------------|
| `clock_divider.v` | Frequency Divider | Converts high-frequency clock to 1Hz |
| `traffic_fsm.v` | FSM Controller | Controls state transitions (R→G→Y→R) |
| `timer.v` | Countdown Timer | Counts seconds for each state |
| `seven_segment.v` | Display Driver | Converts binary counter to 7-segment output |
| `top_module.v` | Integration | Connects all submodules together |

---

## 6️⃣ Simulation Plan
- **Tool**: Icarus Verilog or ModelSim  
- **Input**: Clock, Reset  
- **Expected Output**:  
  - State changes every (10s / 7s / 3s)  
  - LED and 7-segment display update accordingly  
- **Verification items**:  
  1. FSM transitions  
  2. Timer resets at correct timing  
  3. 7-segment decoding output  

---

## 7️⃣ Implementation Flow
| Step | Tool | Output |
|------|------|---------|
| RTL Design | Verilog HDL | Source code (`*.v`) |
| Simulation | Icarus/ModelSim | Waveform (`.vcd`) |
| Synthesis | Yosys | Gate-level netlist |
| Layout | OpenLane | DEF, GDSII |
| Verification | Magic, Netgen | DRC/LVS report |

---

## 8️⃣ Schedule
| Week | Task | Status |
|------|------|--------|
| Week 3 | Topic selection, environment setup | ✅ Done |
| Week 4–5 | RTL coding and simulation | 🔄 In progress |
| Week 6–7 | Synthesis & Timing check | ⏳ Planned |
| Week 8–10 | Layout, Routing | ⏳ Planned |
| Week 11–13 | Verification & DRC/LVS | ⏳ Planned |
| Week 14–15 | Final report submission | ⏳ Planned |

---

## 9️⃣ Expected Outcome
- Functional RTL design verified via simulation  
- Successful RTL-to-GDSII flow using OpenLane  
- Complete DRC/LVS clean chip layout  
- Final GDS submission and project documentation

---

## 🔟 Repository Info
- **Repository Name:** `total_project_trafficlight`  
- **GitHub URL:** `https://github.com/[your_id]/total_project_trafficlight`  
- **Document Path:** `/docs/PROJECT_PLAN.md`

---
