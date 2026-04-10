# Fourier Transform of EEG Signal

**Course:** BME 3507C – Signals & Systems for Bioengineers
**Institution:** Florida Gulf Coast University
**Author:** Saun-Jay Samuels (2026)

## Overview

This project applies the Fast Fourier Transform (FFT) to electroencephalogram (EEG) data to analyze the frequency content of alpha and beta brainwave signals. Both time-domain and frequency-domain representations are plotted, and signal energy is verified using Parseval's theorem.

## Data Collection

EEG data was recorded using an **iWorx iXTA** data acquisition system with **LabScribe** software. Two frequency bands were captured and exported for analysis:

- **Alpha waves** (8–13 Hz) — associated with relaxed, wakeful states
- **Beta waves** (13–30 Hz) — associated with active thinking and focus

Exported data files (`.txt`, `.xlsx`, `.xls`) and raw iWorx session files (`.iwxdata`) are included in this repository.

## Files

| File | Description |
|------|-------------|
| `FourierTransformofEEGalpha.m` | FFT analysis script for the alpha wave channel |
| `FourierTransformofEEGbeta.m` | FFT analysis script for the beta wave channel |
| `frequency_1.mlx` | MATLAB Live Script — initial frequency exploration |
| `livesfouriertransformofEEGalpha.mlx` | MATLAB Live Script — alpha FFT with inline output |
| `livesfouriertransformofEEGbeta.mlx` | MATLAB Live Script — beta FFT with inline output |
| `MD_SS_AF_BOTH_Export.txt` / `.xlsx` | Exported EEG data (alpha + beta channels) |
| `MD_SS_AF_RELAXED_Export.xls` | Exported EEG data from relaxed trial |
| `MD_SS_AF_CALCULATIONS.iwxdata` | Raw iWorx session file |

## Usage

1. Import the exported EEG data into MATLAB (e.g., load `MD_SS_AF_BOTH_Export.xlsx` as a table named `MDSSAFBOTHExportS3`).
2. Run `FourierTransformofEEGalpha.m` or `FourierTransformofEEGbeta.m`.
3. Two figures will be generated:
   - **Figure 1** – Time-domain signal
   - **Figure 2** – Frequency-domain spectrum (0–50 Hz)
4. Energy values computed via Parseval's theorem are printed to the console.

## Methods

- Sampling rate: **200 Hz** (Nyquist frequency: 100 Hz)
- FFT computed using MATLAB's built-in `fft()`, amplitude normalized by `fs`
- Frequency axis constructed as `f = (0:N-1) * (fs/N)`
- Time-domain energy: `trapz(t, x²)`
- Frequency-domain energy: `sum(|Y|²) * df`

## Requirements

- MATLAB (R2020a or later recommended)
- Signal Processing Toolbox (optional; `fft` is part of base MATLAB)
