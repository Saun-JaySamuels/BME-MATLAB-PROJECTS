# BME 3506C – Circuits and Kinematics

**Course:** Circuits for Bioengineers
**Institution:** Florida Gulf Coast University
**Semester:** Fall 2025

## Overview

This folder contains two MATLAB scripts developed for lab and project work in Circuits for Bioengineers. Together they cover motion capture data processing and inverse kinematics analysis of human lower-limb segments.

## Files

| File | Description |
|------|-------------|
| `autoFileLoad.m` | Batch-loads QTM motion capture `.mat` files and restructures marker trajectory and force plate data into a clean `Data` struct |
| `KinematicsAlpha.m` | Computes the angular acceleration (alpha) of the lower leg segment from hip, knee, and ankle marker coordinates |

---

## `autoFileLoad.m` — Motion Capture Data Loader

Designed to work with data exported from **Qualisys Track Manager (QTM)**. It scans the current directory for all `.mat` files, loads each one, and reorganizes marker trajectories and force plate data into a structured MATLAB variable called `Data`.

### Structure of Output

```
Data
 └── <filename>
      ├── <MarkerName>     → [N×3] XYZ trajectory (mm)
      ├── FP1
      │    ├── Force       → [N×3] ground reaction force (N)
      │    ├── Moment      → [N×3] moments (Nmm)
      │    └── CoP         → [N×3] center of pressure (mm)
      └── FP2 ...
```

### How to Use
1. Export `.mat` files from QTM into a single folder
2. Open MATLAB and `cd` to that folder
3. Run `autoFileLoad.m`
4. Access your data via `Data.<filename>.<MarkerName>`

> **Note:** File names must not be changed after exporting from QTM, and must be valid MATLAB variable names.

---

## `KinematicsAlpha.m` — Lower-Limb Segment Angular Acceleration

Calculates the angular acceleration (**alpha**) of the shank (lower leg) segment during a single instant of motion using Hip (H), Knee (K), and Ankle (A) marker data.

### Method

1. Computes the center of mass of the foot-shank segment using a weighted position formula
2. Finds the acceleration of the ankle relative to the knee (`Acc_A_wrt_K`)
3. Decomposes it into **normal** (centripetal) and **tangential** components
4. Calculates alpha as: `α = |A_tangential| / |segment length|`

### Input Data (example — modify as needed)

| Marker | Position (mm) | Velocity (mm/s) | Acceleration (mm/s²) |
|--------|--------------|-----------------|----------------------|
| Hip    | [396, 653]   | [1086, -229]    | [1546, 381]          |
| Knee   | [327, 364]   | [753, -211]     | [2481, 632]          |
| Ankle  | [134, 80]    | [144, 212]      | [1536, 2235]         |

### Requirements

- MATLAB (no additional toolboxes required)
- For `autoFileLoad.m`: QTM-exported `.mat` files
