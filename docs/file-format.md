
# File Format

Each recording session produces a folder with:

- `amplifier.dat` — neural signals (int16)
- `analogin.dat` — auxiliary analog input
- `digitalin.dat` — digital events
- `supply.dat` — power monitoring
- `adc.dat` — ADC raw channels
- `time.dat` — timestamps
- `info.rhd` — Intan-compatible metadata
- `CE_params.bin` — system & DSP parameters

All data stored in **512-byte CE32 sectors** on SD card, decoded with `CE32_dataDecoder`.
