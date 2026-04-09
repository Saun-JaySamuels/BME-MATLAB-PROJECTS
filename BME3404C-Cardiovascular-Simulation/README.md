# BME 3404C – Cardiovascular Simulation

**Course:** Human Physiology for Engineers II
**Institution:** Florida Gulf Coast University
**Semester:** Fall 2025

## Overview

This folder contains a MATLAB command script that simulates the left-heart cardiovascular system using a lumped-parameter model. The simulation models the interaction between the left ventricle (LV) and the systemic arterial circulation (SA) across multiple cardiac cycles.

The model was originally developed by Bradley Sutton, PhD (University of Illinois) and adapted by Claude Lieber, MD (FGCU), based on the framework in *Modeling and Simulation in Medicine and the Life Sciences* by Hoppensteadt & Peskin.

## Files

| File | Description |
|------|-------------|
| `Command_Cardio_SA_LV.m` | Main command script — sets physiological parameters and runs the Simulink model `Cardio_SA_LV`, then plots all outputs |

## What It Models

- **Cardiac timing:** Heartbeat duration, systole/diastole intervals, 16-beat simulation window
- **Compliance & resistance:** Systemic arterial compliance, systemic vascular resistance, mitral and aortic valve resistances
- **Left ventricular compliance `CLV(t)`:** Time-varying compliance mimicking the contraction/relaxation cycle
- **Blood flows:** Mitral (Qmi), Aortic (QAo), and Systemic (Qs) flow over time
- **Pressures:** Left ventricular pressure (PLV) and systemic arterial pressure (PSA)
- **Pressure-Volume loop:** The classic cardiac cycle diagram (PLV vs. VLV)

## Outputs Generated

- Blood flow subplot (Qmi, QAo, Qs vs. time)
- Pressure comparison (PLV vs. PSA)
- Ventricular compliance over time
- Individual flow plots for Mitral, Aortic, and Venous flows
- Pressure-Volume loop (cardiac cycle diagram)
- Systemic arterial volume vs. pressure

## Requirements

- MATLAB (R2020a or later recommended)
- Simulink
- The `Cardio_SA_LV.slx` Simulink model file (provided separately by course instructor)

## How to Run

1. Open MATLAB and set your working directory to this folder
2. Ensure `Cardio_SA_LV.slx` is in the same directory
3. Run `Command_Cardio_SA_LV.m`
4. MATLAB will open several figure windows with simulation results

## Key Parameters (Adjustable)

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| `T` | 0.0125 min | Heartbeat duration |
| `Rs` | 17.28 mmHg/(L/min) | Systemic vascular resistance |
| `Csa` | 0.00175 L/mmHg | Systemic arterial compliance |
| `Pla` | 5 mmHg | Left atrial pressure |
| `CLVD` | 0.0150 L/mmHg | Max (diastolic) ventricular compliance |
| `CLVS` | 5e-5 L/mmHg | Min (systolic) ventricular compliance |
