# EnableVulkan Ultimate 🚀

![Platform](https://img.shields.io/badge/Platform-Android-green)
![OS](https://img.shields.io/badge/OS-Windows-blue)
![License](https://img.shields.io/badge/License-MIT-orange)

**EnableVulkan Ultimate** is a lightweight, Windows-based tool designed to enforce the **Skia (Vulkan)** rendering pipeline globally on Android devices.

By default, many Android devices (even modern ones) default to OpenGL for system UI and standard apps. This tool unlocks the power of the Vulkan API, potentially improving performance in supported applications, emulators, and games.

## ✨ Features

* **Global Vulkan Enforcement:** Switches the system property `debug.hwui.renderer` to `skiavk`.
* **Live Status Check:** Built-in diagnostic tool to verify if apps are running on Vulkan or OpenGL.
* **Smart App Refresh:** Includes a "Force-Stop" utility to safely restart user apps so they pick up the new graphics settings.
* **System UI Soft-Reboot:** Attempts to restart the system interface (Status bar, Launcher) without a full phone reboot.
* **Safety First:** Includes options to easily revert back to OpenGL defaults.

## 📱 Requirements

* **PC:** Windows 10 or 11.
* **Android Device:** Android 10 or newer (required for Skia support).
* **Drivers:** Installed ADB Drivers for your specific phone.
* **USB Debugging:** Enabled in your phone's Developer Options.

## 📥 Installation

1.  **Download ADB:** Ensure you have the Android SDK Platform Tools (`adb.exe`) on your PC.
2.  **Download the Script:** Download `EnableVulkan_Ultimate.bat` from this repository.
3.  **Place the File:** Move the `.bat` file **inside** your `platform-tools` folder (the same folder where `adb.exe` is located).

   > *Note: If you have ADB added to your Windows PATH environment variable, you can run the script from anywhere.*

## 🛠️ How to Use

1.  Connect your Android device to your PC via USB.
2.  Double-click **`EnableVulkan_Ultimate.bat`**.
3.  The tool will automatically detect your device.
4.  Choose **Option [1]** to enable Vulkan.
5.  Follow the on-screen prompts.
    * *Tip: Use **Option [3]** after enabling Vulkan to ensure all your running apps switch over to the new engine.*

## 🔍 Verification

Not sure if it worked? Use **Option [4]** in the main menu!
This runs a diagnostics check (`dumpsys gfxinfo`) and filters the output.

* ✅ **Success:** `Pipeline=Skia (Vulkan)`
* ❌ **Default:** `Pipeline=Skia (OpenGL)`

## ⚠️ Disclaimer

This tool modifies the `debug.hwui.renderer` system property. While this is generally safe and reverts after a reboot on non-rooted devices:

* **Use at your own risk.**
* Some older apps or heavily skinned ROMs may experience visual glitches with Vulkan forced.
* If you experience crashes, simply restart your phone or use **Option [2]** to revert to OpenGL.

## 🤝 Credits & Acknowledgements

* **Main Developer:** [Debraj5 / DebrajAdhikary5]
* **Inspiration:** Based on the UI design of **GAMA** by [Link to your friend's repo or "Popovicialinc"].

---

*Found this tool useful? Give it a ⭐ star!*
