# EnableVulkan Ultimate 🚀

![Platform](https://img.shields.io/badge/Platform-Android-green)
![OS](https://img.shields.io/badge/OS-Windows-blue)
![License](https://img.shields.io/badge/License-MIT-orange)

A lightweight Windows utility that enforces the Skia (Vulkan) rendering pipeline globally on Android devices via ADB. Designed to unlock **smoother UI animations**, **optimized gaming performance**, and **improved battery efficiency** for supported apps.

**This is an "All-in-One" package.** It comes pre-bundled with the necessary Android Platform Tools, so you can just download, unzip, and run!

## ✨ Features

* **Global Vulkan Enforcement:** Switches the system property `debug.hwui.renderer` to `skiavk`.
* **Live Status Check:** Built-in diagnostic tool to verify if apps are running on Vulkan or OpenGL.
* **Smart App Refresh:** Includes a "Force-Stop" utility to safely restart user apps so they pick up the new graphics settings.
* **System UI Soft-Reboot:** Attempts to restart the system interface without a full phone reboot.
* **Safety First:** Includes options to easily revert back to OpenGL defaults.

## 📱 Requirements

Before you begin, ensure you have the following:

1.  **PC:** Windows 10 or 11.
2.  **Android Device:** Android 10 or newer (required for Skia support).
3.  **USB Debugging:** Enabled in your phone's Developer Options.
4.  **USB Drivers:** **CRITICAL!** You must have the correct USB/ADB drivers installed for your specific phone (Samsung, Xiaomi, Pixel, etc.).
    * *See the "How to Install Drivers" section below if you are unsure.*

## 📥 Installation & Usage

**No complex setup required.**

1.  **Download:** Get the latest release `.zip` file from this repository.
2.  **Extract:** Unzip the folder to your Desktop or preferred location.
3.  **Connect:** Plug your Android phone into your PC via USB.
4.  **Run:** Open the extracted folder and double-click **`EnableVulkan.bat`**.
5.  **Follow the Menu:**
    * Choose **Option [1]** to enable Vulkan.
    * Use **Option [3]** to refresh your running apps.

## 🔌 How to Install Drivers (Important)

If the tool shows **"Disconnected"** or does not detect your phone, you are likely missing the correct drivers.

**Option A: Official OEM Drivers (Recommended)**
Google maintains a list of drivers for every major brand (Samsung, Xiaomi, Moto, etc.).
* 👉 **[Download Official Android OEM USB Drivers](https://developer.android.com/studio/run/oem-usb)**

**Option B: Universal ADB Driver (Alternative)**
If the official drivers don't work, you can try the universal open-source installer.
* 👉 **[Download Universal ADB Driver](https://adb.clockworkmod.com/)**

**After installing drivers:** Unplug your phone, plug it back in, and run the script again. Watch your phone screen for a pop-up asking to "Allow USB Debugging" and click **Allow**.

## 🔍 Verification

Not sure if it worked? Use **Option [4]** in the main menu!
This runs a diagnostics check and shows you the active pipeline:

* ✅ **Success:** `Pipeline=Skia (Vulkan)`
* ❌ **Default:** `Pipeline=Skia (OpenGL)`

## ⚠️ Disclaimer

This tool modifies the `debug.hwui.renderer` system property. While this is generally safe and reverts after a reboot on non-rooted devices:

* **Use at your own risk.**
* Some older apps or heavily skinned ROMs may experience visual glitches with Vulkan forced.
* If you experience crashes, simply restart your phone or use **Option [2]** to revert to OpenGL.

## 🤝 Credits

* **Main Developer:** [Debraj5 / DebrajAdhikary5]
* **Inspiration:** **GAMA** by [https://github.com/popovicialinc/gama].

---

*Found this tool useful? Give it a ⭐ star!*
