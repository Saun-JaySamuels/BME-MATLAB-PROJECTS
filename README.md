# BME MATLAB Projects

A collection of MATLAB scripts developed during my Biomedical Engineering coursework at **Florida Gulf Coast University (FGCU)**. These projects cover biomechanical kinematics analysis, engineering optimization, and computational tools for biological and circuit problems.

**Author:** Saun-Jay Samuels
**Program:** Biomedical Engineering, FGCU
**Years:** 2024–2025

---

## Repository Structure

```
BME-MATLAB-Projects/
├── BME3506C-Circuits-and-Kinematics/
│   ├── KinematicsAlpha.m                    ← Lower-limb angular acceleration
│   └── README.md
│
├── BME4722-Healthcare-Optimization/
│   ├── Optimization_ManufacturingProfit.m   ← LP: maximize production profit
│   ├── Optimization_NutrientBlend.m         ← LP: minimize cereal blend cost
│   └── README.md
│
└── EGN1041C-Computational-Tools/
    ├── Logistic_population_growth.m         ← Euler method logistic growth
    ├── Logistic_population_multiplot.m      ← Convergence across 3 time steps
    ├── bacteriaequilib.m                    ← Equilibrium & Jacobian (bacteria-phage)
    ├── predator_prey.m                      ← Equilibrium & Jacobian (Lotka-Volterra)
    ├── CircuitNodeAnalysis_2var.m           ← KCL node voltage (2-node circuit)
    ├── CircuitNodeAnalysis_3var.m           ← KCL node voltage (3-node circuit)
    ├── Membrane_Potential.m                 ← Resting membrane potential vs. [K+]
    ├── Reaction_Kinetics.m                  ← Symbolic ODE for reaction kinetics
    ├── Intracellular_Reaction_Equilibrium.m ← Euler method reaction equilibrium
    └── README.md
```

---

## Projects at a Glance

### [BME3506C – Circuits and Kinematics](./BME3506C-Circuits-and-Kinematics)
Computes the angular acceleration of the shank segment during human motion using 2D Hip, Knee, and Ankle marker data. Decomposes acceleration into normal and tangential components to find segment alpha via inverse kinematics.

**Topics:** Biomechanics, inverse kinematics, vector decomposition

---

### [BME4722 – Healthcare Engineering Optimization](./BME4722-Healthcare-Optimization)
Two linear programming problems solved with MATLAB's `linprog`. One maximizes manufacturing profit under labor constraints; the other finds the minimum-cost grain blend meeting per-serving RDA requirements for protein, riboflavin, phosphorus, and magnesium.

**Topics:** Linear programming, `linprog`, operations research, nutritional optimization

---

### [EGN1041C – Computational Tools for Engineering](./EGN1041C-Computational-Tools)
Numerical methods and symbolic computation applied to biological and electrical systems. Covers Euler method simulations of population dynamics, equilibrium and stability analysis of nonlinear biological systems, KCL-based circuit node voltage solving, and biophysical models of membrane potential and reaction kinetics.

**Topics:** Euler method, Lotka-Volterra, Jacobian/eigenvalue stability, KCL, Nernst equation, symbolic ODEs

---

## Requirements

- MATLAB R2019b or later
- Optimization Toolbox (`linprog` — BME4722)
- Symbolic Math Toolbox (`syms`, `solve` — EGN1041C)

---

## About

These scripts were written as part of my undergraduate Biomedical Engineering degree at FGCU, at the intersection of engineering, computation, and life sciences.
