
# File Format

Each recording session produces a folder with:

- `amplifier.dat` — neural signals (int16), sampling rate depends on recording settings.
- `analogin.dat` — auxiliary analog input,1250Hz, 16x 16-bit signals: Digital inputs/ AccX/AccY/AccZ/GyroX/GyroY/GyroZ/MagX/MagY/MagZ/32bit time/DSP1_in/DSP2_in/DSP1_out/DSP2_out
- `adc.dat` — ADC raw channels (for microphone, 160KHz sampling rate)
- `misc.dat` — Raw image data from camera
- `info.rhd` — Intan-compatible metadata
- `CE_params.bin` — system & DSP parameters

