프로젝트명: Traffic Light Controller with 7-Segment Display

1️⃣ 프로젝트 개요

본 프로젝트는 FSM(Finite State Machine) 기반의 교통 신호 제어 회로를 Verilog HDL로 설계하고,
각 신호 상태에 따라 남은 시간을 7-Segment Display로 표시하는 시스템을 구현하는 것을 목표로 한다.
본 설계는 OpenLane을 이용하여 RTL부터 GDS까지의 전 과정을 수행한다.

2️⃣ 프로젝트 목표

FSM 설계를 통한 신호등(빨강·노랑·초록) 상태 제어 회로 구현

각 상태별 지속 시간을 카운트하고, 7-Segment Display로 시각화

합성(Synthesis), 배치·배선(Layout), **검증(DRC/LVS)**을 통한 실제 칩 구현 과정 학습

TinyTapeout 및 OpenLane 환경에서 RTL → GDS까지 완전 자동화 Flow 수행

3️⃣ 시스템 구성도
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

4️⃣ 설계 원리

시스템은 3가지 상태(RED, GREEN, YELLOW)로 구성되며 FSM으로 순차 제어한다.

각 상태에서 Timer Counter가 1Hz 클록 신호에 따라 남은 시간을 카운트다운한다.

7-Segment 모듈은 현재 카운터 값을 BCD로 변환하여 표시한다.

FSM은 Timer가 0이 되면 다음 상태로 천이한다.

5️⃣ 상태 전이도 (FSM Diagram)
┌──────┐        ┌────────┐        ┌────────┐
│ RED  │ ──→ │ GREEN │ ──→ │ YELLOW │
└──┬───┘        └──┬─────┘        └──┬─────┘
   └───────────────┘                  │
       ←──────────────────────────────┘


RED → GREEN → YELLOW → RED 순환

RED: 10초, GREEN: 7초, YELLOW: 3초 유지

6️⃣ 모듈 구성 및 역할
모듈명	주요 기능	비고
clock_divider.v	입력 클록을 1Hz로 분주	Counter 기반
traffic_fsm.v	신호 상태(FSM) 제어	case 문 기반 상태 천이
timer.v	상태별 남은 시간 카운트다운	상태에 따라 초기값 다름
seven_segment.v	Binary → 7-Segment 변환	combinational logic
top_module.v	상위 모듈 (모든 블록 연결)	구조적 설계 (Structural)

7️⃣ 시뮬레이션 계획
항목	내용
시뮬레이터	ModelSim 또는 Icarus Verilog
Testbench 구성	Clock, Reset, FSM 출력 모니터링
검증 포인트	① 상태 천이 순서, ② LED 출력 타이밍, ③ 7-Segment 표시, ④ Timer 리셋 타이밍
예상 결과	RED→GREEN→YELLOW 순서로 10/7/3초 간격 상태 변화 확인 가능

8️⃣ 현재 진행 상황
항목	진행 상태	비고
설계 주제 선정	✅ 완료	Traffic Light Controller
Verilog 코드 작성	✅ 진행 중	FSM / Counter 완성
Testbench 구성	🟡 진행 중	파형 검증 예정
OpenLane 환경 세팅	🟡 진행 중	Docker 환경에서 Build 중
Synthesis / Layout	⏳ 예정	중간 평가 이후 수행 예정

9️⃣ 향후 계획
주차	계획 내용
6주차	FSM/Counter 완성 및 시뮬레이션 결과 확보
7주차	중간 발표 및 코드 리팩토링
8~10주차	OpenLane 기반 Synthesis → Placement → Routing
11~13주차	DRC / LVS 검증 및 보고서 초안 작성
14~15주차	최종 보고서 및 발표 준비 (GDS 제출 포함)

🔟 기대 효과

FSM, Timer, 7-Segment 등 기초 디지털 논리 설계 경험 축적

OpenLane Flow 기반 칩 설계 과정 이해 (RTL → GDS)

실제 칩 구현 시의 Timing, Area, Power trade-off 개념 습득
