<img width="1462" height="1102" alt="image" src="https://github.com/user-attachments/assets/254f1335-83b3-4770-966a-9b5480906338" /># 반도체 설계 토탈프로젝트 

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

## 4️⃣ Block Diagram

┌─────────────────────────────────────────────┐
│                Top Module                   │
│─────────────────────────────────────────────│
│  ┌────────────┐  ┌────────────┐  ┌────────┐ │
│  │ Clock Div. │→│ Timer Cntr │→│ 7-Seg  │ │
│  └──────┬─────┘  └────┬──────┘  └────┬───┘ │
│         │              │              │     │
│         ▼              ▼              ▼     │
│      FSM Logic ──────────────→ LED Control │
│       (RED→GREEN→YELLOW)                   │
└─────────────────────────────────────────────┘

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

[ 데이터 입력: 5,000건 공정 센서 + PRE PC ]
        │
        ├───────────────────────────┼───────────────────────────┐
        ▼                           ▼                           ▼
┌─────────────────────────┐ ┌─────────────────────────┐ ┌─────────────────────────┐
│   1. Random Forest      │ │       2. XGBoost        │ │      3. CatBoost        │
│    (수평적 병렬 병합)   │ │    (수직적 오답 제어)   │ │    (반듯한 대칭 조합)   │
├─────────────────────────┤ ├─────────────────────────┤ ├─────────────────────────┤
│  ┌───┐  ┌───┐  ┌───┐    │ │  ┌───┐                  │ │  ┌───┐ (좌우 조건 통일) │
│  │🌲 │  │🌲 │  │🌲 │    │ │  │🌲 │1차 예측              │ │  ├───┤                  │
│  └───┘  └───┘  └───┘    │ │  └───┘                  │ │  └───┘대칭 트리          │
│  [독립적 나무 무작위 생성]│ │    │ (오답 피드백)        │ │        │                 │
│        │                │ │    ▼                  │ │        ▼                 │
│        ▼                │ │  ┌───┐                  │ │  ┌───┐                 │
│  [다수결 투표 (Voting)] │ │  │🌲 │2차 보완              │ │  ├───┤Ordered Boosting │
│        │                │ │  └───┘                  │ │  └───┘편향/과적합 차단  │
└─────────────────────────┘ └─────────────────────────┘ └─────────────────────────┘
        │                           │                           │
        ▼                           ▼                           ▼
[전체적인 센서 패턴 탐색]     [소수 불량 정밀 타격]        [힌트+센서의 황금 밸런스]
- 특징: 안정적, 기준선     - 특징: 높은 불량 검출    - 특징: 오탐 최소화, 성능 1등
