# BME 3506C – Circuits and Kinematics

**Course:** Circuits for Bioengineers
**Institution:** Florida Gulf Coast University
**Semester:** Fall 2025

## Overview

This folder contains a MATLAB script for biomechanical kinematics analysis of the human lower limb. It computes the angular acceleration of the shank segment from Hip, Knee, and Ankle marker positions and accelerations captured during motion analysis.

## Files

| File | Description |
|------|-------------|
| `KinematicsAlpha.m` | Computes angular acceleration (alpha) of the lower leg segment from 2D marker coordinates and accelerations |

---

## `KinematicsAlpha.m` — Lower-Limb Segment Angular Acceleration

Calculates the angular acceleration (**alpha**) of the shank (lower leg) segment during a single instant of motion using Hip (H), Knee (K), and Ankle (A) marker data.

### Method

1. Computes the center of mass of the foot-shank segment using a weighted position formula
2. Finds the acceleration of the ankle relative to the knee (`Acc_A_wrt_K`)
3. Decomposes it into **normal** (centripetal) and **tangential** components using vector projection
4. Calculates alpha as: `α = |A_tangential| / |segment length|`

### Input Data (example — modify as needed)

| Marker | Position (mm) | Velocity (mm/s) | Acceleration (mm/s²) |
|--------|--------------|-----------------|----------------------|
| Hip    | [396, 653]   | [1086, -229]    | [1546, 381]          |
| Knee   | [327, 364]   | [753, -211]     | [2481, 632]          |
| Ankle  | [134, 80]    | [144, 212]      | [1536, 2235]         |

### Requirements

- MATLAB (no additional toolboxes required)
