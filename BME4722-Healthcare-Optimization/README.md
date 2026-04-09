# BME 4722 – Healthcare Engineering Optimization

**Course:** Health Care Engineering
**Institution:** Florida Gulf Coast University
**Semester:** Fall 2025

## Overview

This folder contains two MATLAB linear programming scripts from BME 4722. Both use MATLAB's built-in `linprog` function to solve real-world optimization problems in a healthcare/engineering context — one focused on manufacturing profit maximization, and one on minimum-cost nutritional blending that meets dietary requirements.

## Files

| File | Description |
|------|-------------|
| `Optimization_ManufacturingProfit.m` | Maximizes profit for a two-product manufacturing scenario subject to labor hour constraints |
| `Optimization_NutrientBlend.m` | Minimizes cost of a grain cereal blend while meeting per-serving RDA nutritional requirements |

---

## `Optimization_ManufacturingProfit.m`

### Problem
A company manufactures two products — **Mammothwalkers (M)** and **Galacticassists (G)** — with the following constraints:

| Resource | Mammothwalker | Galacticassist | Available |
|----------|--------------|----------------|-----------|
| Manufacturing labor (hrs) | 120 | 40 | 600 |
| Inspection labor (hrs) | 40 | 80 | 400 |
| Marketing (units of G max) | — | 1 | 4 |

**Objective:** Maximize profit = $100·M + $50·G

### Method
- Converts the maximization problem to minimization by negating the objective
- Uses `linprog` with inequality constraints
- Reports optimal production quantities and maximum profit

---

## `Optimization_NutrientBlend.m`

### Problem
Find the minimum-cost blend of three grains (A, B, C) to produce 1 lb of cereal that meets the following **RDA per 2-oz serving**:

| Nutrient | RDA/serving | Grain A (per lb) | Grain B (per lb) | Grain C (per lb) |
|----------|------------|------------------|------------------|------------------|
| Protein | 3 units | 22 | 28 | 21 |
| Riboflavin | 2 units | 16 | 14 | 25 |
| Phosphorus | 1 unit | 8 | 7 | 9 |
| Magnesium | 0.425 units | 5 | 0 | 6 |

**Grain costs:** A = $0.33/lb, B = $0.47/lb, C = $0.38/lb

### Method
- Formulates as a linear program with an equality constraint (blend sums to 1 lb)
- Converts `>=` nutrient constraints to `<=` form for `linprog`
- Uses the dual-simplex algorithm
- Reports optimal blend proportions, cost per lb and per serving, and nutrient delivery

### Sample Output
```
Optimal blend (per 1 lb of cereal):
  Grain A: 0.xxx lb (xx.x%)
  Grain B: 0.xxx lb (xx.x%)
  Grain C: 0.xxx lb (xx.x%)

Minimum cost: $x.xxxx per lb  |  $x.xxxx per 2-oz serving
```

## Requirements

- MATLAB (R2019b or later recommended)
- Optimization Toolbox (`linprog` function)
