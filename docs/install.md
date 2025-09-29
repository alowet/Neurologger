
# WILD API Installation

## Requirements
- Windows 10 or later
- .NET Framework 4.8
- Visual Studio 2022 (recommended)

## Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/ayalab1/Neurologger
   cd Neurologger
   ```
2. Navigate to /Neurologger/Software and install the latest installation package

## For development
1. Open the solution in Visual Studio.
2. Restore NuGet packages and build.

## Dependencies
- Windows.Devices.Bluetooth
- System.Windows.Forms
- Microsoft.Win32.SafeHandles

## Optional DLLs
- `dll_upfirdn.dll` — resampling
- `CE32_BLE.dll` — BLE backend

Place DLLs in the same folder as `CE32_console.exe`.
