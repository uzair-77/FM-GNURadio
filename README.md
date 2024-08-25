
# Frequency Modulation (FM) and Noise Analysis

This repository contains scripts and GNU Radio files for analyzing Frequency Modulation (FM) with different types of noise. The project includes MATLAB scripts for FM modulation with impulse and Gaussian noise, as well as GNU Radio files for FM modulation. Below are details on how each part of the project works.

## MATLAB Scripts

### Overview

The MATLAB scripts perform Frequency Modulation (FM) on an audio signal and analyze the effect of impulse and Gaussian noise. The project consists of two main scripts:

1. **FM with Impulse Noise**: Modulates an audio signal using FM and adds impulse noise to the signal.
2. **FM with Gaussian Noise**: Modulates an audio signal using FM and adds Gaussian noise to the signal.

### FM with Impulse Noise

**Script**: `fm_impulse_noise.m`

#### Description
- **Parameters**:
  - `Ac`: Amplitude of the carrier signal.
  - `fc`: Carrier frequency in Hz.
  - `kf`: Frequency sensitivity in Hz/V (modulation index).
  - `noise_amplitude`: Amplitude of impulse noise.
  - `num_impulses`: Number of impulses to add.

- **Process**:
  1. Reads an audio file (`counting.wav`).
  2. Normalizes the audio signal.
  3. Performs frequency modulation using the integral of the audio signal.
  4. Adds impulse noise at randomly selected indices.
  5. Plots the original audio signal, frequency modulated signal, and signal with impulse noise.
  6. Plays the original audio, frequency modulated audio, and frequency modulated audio with impulse noise.
  7. Calculates and displays Signal-to-Noise Ratio (SNR) and Bit Error Rate (BER).

### FM with Gaussian Noise

**Script**: `fm_gaussian_noise.m`

#### Description
- **Parameters**:
  - `Ac`: Amplitude of the carrier signal.
  - `fc`: Carrier frequency in Hz.
  - `kf`: Frequency sensitivity in Hz/V (modulation index).

- **Process**:
  1. Reads an audio file (`counting.wav`).
  2. Normalizes the audio signal.
  3. Performs frequency modulation using the integral of the audio signal.
  4. Adds Gaussian noise to the modulated signal.
  5. Plots the original audio signal, the integral of the audio signal, the frequency modulated signal, and the noisy signal.
  6. Plays the original audio, frequency modulated audio, and noisy frequency modulated audio.
  7. Calculates and displays Signal-to-Noise Ratio (SNR) and Bit Error Rate (BER).

## GNU Radio Files

### Overview

The GNU Radio files are used to simulate and analyze FM modulation in a software-defined radio environment.

### Files Included

1. **FM_Modulation.grc**: A GNU Radio Companion (GRC) flowgraph for FM modulation.
   - **Description**: This flowgraph demonstrates the basic FM modulation process. It includes components for signal generation, modulation, and visualization.

2. **FM_Demodulation.grc**: A GNU Radio Companion (GRC) flowgraph for FM demodulation.
   - **Description**: This flowgraph is designed for demodulating the FM signal and analyzing the output.

### How to Use

1. Open GNU Radio Companion.
2. Load the `.grc` files provided.
3. Connect the blocks according to the flowgraphs.
4. Run the flowgraph to observe the FM modulation and demodulation.

## Prerequisites

- MATLAB for running the provided MATLAB scripts.
- GNU Radio installed for running the GNU Radio flowgraphs.
- `counting.wav` audio file available in the working directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


