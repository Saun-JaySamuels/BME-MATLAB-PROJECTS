# EGN 1041C – Computational Tools for Engineering

**Course:** Computational Tools for Engineering
**Institution:** Florida Gulf Coast University
**Semester:** Spring 2024 / Spring 2025

## Overview

MATLAB scripts applying numerical methods and symbolic computation to biological and electrical engineering problems. Topics include logistic population growth, equilibrium analysis of biological systems, circuit node voltage analysis, and biophysical modeling of membrane potential and reaction kinetics.

## Files

| File | Description |
|------|-------------|
| `Logistic_population_growth.m` | Euler method simulation of logistic population growth; single plot |
| `Logistic_population_multiplot.m` | Logistic growth solved at three time step sizes (1 hr, 1 min, 1 sec) for convergence comparison |
| `bacteriaequilib.m` | Symbolic equilibrium and Jacobian analysis of a bacteria–phage–substrate system |
| `predator_prey.m` | Symbolic equilibrium points and Jacobian for a predator-prey (Lotka-Volterra) model |
| `CircuitNodeAnalysis_2var.m` | Node voltage analysis for a 2-node resistive circuit using MATLAB symbolic solver |
| `CircuitNodeAnalysis_3var.m` | Node voltage analysis for a 3-node resistive circuit with voltage source |
| `Membrane_Potential.m` | Numerical solution for membrane potential as a function of extracellular K⁺ concentration |
| `Reaction_Kinetics.m` | Solves a first-order reaction kinetics ODE symbolically |
| `Intracellular_Reaction_Equilibrium.m` | Euler method solution for intracellular reaction equilibrium dynamics |

---

## Descriptions

### Logistic Population Growth
Two scripts modeling logistic cell growth using the Euler method:
- `Logistic_population_growth.m` — single simulation with given rate, carrying capacity, and initial population
- `Logistic_population_multiplot.m` — compares convergence across three time steps (1 hr, 1 min, 1 sec) showing how smaller `dt` improves Euler method accuracy

**Model:** `dP/dt = r·P·(1 - P/K)`

---

### Biological System Equilibrium (`bacteriaequilib.m`, `predator_prey.m`)
Uses MATLAB's `syms` and `solve` to find equilibrium points of coupled nonlinear ODEs, then computes the Jacobian matrix and evaluates stability via eigenvalues.

- **Bacteria model:** 3-species system (bacteria, substrate, phage)
- **Predator-prey model:** Classic Lotka-Volterra two-species model

---

### Circuit Node Analysis (`CircuitNodeAnalysis_2var.m`, `CircuitNodeAnalysis_3var.m`)
Applies Kirchhoff's Current Law (KCL) at each node to form a system of equations, then solves symbolically using `solve`. Returns node voltages as exact rational values.

---

### Biophysical Models
- **`Membrane_Potential.m`** — Computes resting membrane potential using the Nernst/GHK framework with varying extracellular K⁺
- **`Reaction_Kinetics.m`** — Solves `dx/dt = -k·x` symbolically using MATLAB's ODE symbolic solver
- **`Intracellular_Reaction_Equilibrium.m`** — Euler method simulation of intracellular reaction dynamics toward equilibrium

## Requirements

- MATLAB R2019b or later
- Symbolic Math Toolbox (`syms`, `solve`, `jacobian`)
