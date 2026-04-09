# BME MATLAB Projects

A collection of MATLAB scripts developed during my Biomedical Engineering coursework at **Florida Gulf Coast University (FGCU)**. These projects cover cardiovascular system simulation, biomechanical kinematics, motion capture data processing, and engineering optimization.

**Author:** Saun-Jay Samuels
**Program:** Biomedical Engineering, FGCU
**Years:** 2025

---

## Repository Structure

```
BME-MATLAB-Projects/
├── BME3404C-Cardiovascular-Simulation/
│   ├── Command_Cardio_SA_LV.m       ← Left-heart cardiovascular model
│   └── README.md
│
├── BME3506C-Circuits-and-Kinematics/
│   ├── autoFileLoad.m               ← QTM motion capture batch loader
│   ├── KinematicsAlpha.m            ← Lower-limb angular acceleration
│   └── README.md
│
└── BME4722-Healthcare-Optimization/
    ├── Optimization_ManufacturingProfit.m  ← LP: maximize production profit
    ├── Optimization_NutrientBlend.m        ← LP: minimize cereal blend cost
    └── README.md
```

---

## Projects at a Glance

### [BME3404C – Cardiovascular Simulation](./BME3404C-Cardiovascular-Simulation)
A MATLAB/Simulink command script that simulates the left-heart cardiovascular system using a lumped-parameter model. Models ventricular pressure, systemic arterial pressure, blood flows (mitral, aortic, systemic), and generates pressure-volume loops across 16 cardiac cycles.

**Topics:** Cardiovascular physiology, Simulink, compliance/resistance modeling, pressure-volume analysis

---

### [BME3506C – Circuits and Kinematics](./BME3506C-Circuits-and-Kinematics)
Two scripts covering motion capture data processing and biomechanical analysis. `autoFileLoad.m` restructures Qualisys Track Manager (QTM) `.mat` exports into a clean MATLAB struct. `KinematicsAlpha.m` computes the angular acceleration of the shank segment from 2D marker coordinates.

**Topics:** Biomechanics, motion capture, inverse kinematics, vector decomposition, force plate data

---

### [BME4722 – Healthcare Engineering Optimization](./BME4722-Healthcare-Optimization)
Two linear programming problems solved with MATLAB's `linprog`. One maximizes manufacturing profit under labor constraints; the other finds the minimum-cost grain blend that meets per-serving RDA requirements for protein, riboflavin, phosphorus, and magnesium.

**Topics:** Linear programming, `linprog`, operations research, nutritional optimization, healthcare engineering

---

## Requirements

- MATLAB R2019b or later
- Simulink (for BME3404C cardiovascular model)
- Optimization Toolbox (for BME4722 linear programming)

---

## About

These scripts were written as part of my undergraduate Biomedical Engineering degree at FGCU. They represent applied coursework at the intersection of engineering, computation, and medicine.

Feel free to explore, fork, or reach out with questions.
