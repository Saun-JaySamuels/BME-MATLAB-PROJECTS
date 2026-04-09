# BME MATLAB Projects

A collection of MATLAB scripts developed during my Biomedical Engineering coursework at **Florida Gulf Coast University (FGCU)**. These projects cover biomechanical kinematics analysis and engineering optimization.

**Author:** Saun-Jay Samuels
**Program:** Biomedical Engineering, FGCU
**Years:** 2025

---

## Repository Structure

```
BME-MATLAB-Projects/
├── BME3506C-Circuits-and-Kinematics/
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

### [BME3506C – Circuits and Kinematics](./BME3506C-Circuits-and-Kinematics)
A MATLAB script that computes the angular acceleration of the shank segment during human motion. Uses 2D Hip, Knee, and Ankle marker data to decompose acceleration into normal and tangential components, applying inverse kinematics to find the segment's angular acceleration (alpha).

**Topics:** Biomechanics, inverse kinematics, vector decomposition, motion analysis

---

### [BME4722 – Healthcare Engineering Optimization](./BME4722-Healthcare-Optimization)
Two linear programming problems solved with MATLAB's `linprog`. One maximizes manufacturing profit under labor constraints; the other finds the minimum-cost grain blend that meets per-serving RDA requirements for protein, riboflavin, phosphorus, and magnesium.

**Topics:** Linear programming, `linprog`, operations research, nutritional optimization, healthcare engineering

---

## Requirements

- MATLAB R2019b or later
- Optimization Toolbox (for BME4722 linear programming scripts)

---

## About

These scripts were written as part of my undergraduate Biomedical Engineering degree at FGCU. They represent applied coursework at the intersection of engineering, computation, and medicine.

Feel free to explore, fork, or reach out with questions.
