## WILD: Wireless, Interactive, Lightweight Datalogger 

**WILD** (Wireless, Interactive, Lightweight Datalogger) is an open-source platform for **wireless, closed-loop electrophysiology and behavior monitoring** in freely moving small animals. It integrates high-density electrophysiology, optogenetic stimulation, an inertial measurement unit (IMU), ultrasonic microphone, and head-mounted camera into a lightweight system for **multi-modal recording**.

---

## 📌 Overview

- High-density neural recording  
- BLE-based wireless control and real-time monitoring  
- Closed-loop stimulation with DSP filtering and thresholds  
- SD-card logging in CE32 format with efficient data export  
- Windows GUI for device setup, live visualization, and data download  

---

## 📖 Documentation

Full documentation can be found here:

- [Installation](docs/install.md)  
- [Hardware](docs/hardware.md)
- [Usage Guide](docs/usage.md)  
- [Closed-loop Control](docs/closed-loop.md)
- [TinyML(Under development for supporting user-compiled models)](docs/tinyML.md)
- [File Format](docs/file-format.md)  
- [Development](docs/development.md)  

---

## 🖥 Quick start guide
- WILD system board
[WILD](docs/images/WIrelessEphys_Github_1_devicePicture.jpg)

### Device manufacturing
- PCB manufacturing and assembly (Gerber + BOM provided)
- Recommended PCB manufacturer: [NextPCB](https://www.nextpcb.com)
- 3D printed baseplate

### Firmware programming (first time to empty MCU)
1. Connect 4-pin IO–USB cable (do not connect to PC yet).  
2. Short bootmode IO pins to enter DFU mode.  
3. Connect USB cable to PC.  
4. In **STM32CubeProgrammer**, flash the bootloader firmware.  

### Preparing for recording
- Install WILD PC software:  
  [Download here](https://github.com/ayalab1/Neurologger/tree/main/Software)  
- Format microSD card in WILD PC software (CE32 format).
- Upload application image to SDcard, device will automatically upgrade during power-on from SDcard.
  [Download here](https://github.com/ayalab1/Neurologger/tree/main/Firmware)  
- Ensure battery is fully charged (check polarity on JST-SH2.0 connector).  

### Recording
- Ensure PC has Bluetooth 4.0+ enabled.  
- Connect wirelessly through GUI.  
- Start recording and monitor signals in real time.  

### Data downloading
- Use GUI **Download** function.  
- Files exported as: `amplifier.dat`, `analogin.dat`, `digitalin.dat`, `supply.dat`, `adc.dat`, `time.dat`, `info.rhd`, `CE_params.bin`.  

---

## ⚠️ Disclaimer

> DISCLAIMER – FOR INFORMATIONAL PURPOSES ONLY; USE AT YOUR OWN RISK  
>  
> The protocol content here is for informational purposes only and does not constitute legal, medical, clinical, or safety advice. Content added to protocols.io is not peer reviewed and may not have undergone formal approval. Information presented should not substitute for independent professional judgment. Any action you take using this information is strictly at your own risk. Neither the authors nor contributors are responsible for your use of the information.

---

## 🔧 Resources

- **Firmware & Embedded software**: Keil MDK, STM32CubeProgrammer  
- **PC GUI / API**: Visual Studio (C#)  
- **Machine learning integration**: Python, TensorFlow, ST Edge-AI  
- **PCB manufacturer**: NextPCB  

---

## 📜 License

MIT License. See [LICENSE](LICENSE).
