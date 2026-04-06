<p align="center">
  <img src="https://github.com/user-attachments/assets/6d383e82-8221-438b-9d6d-a19e998fcc59" alt="icon" width="80" style="vertical-align: middle;">
</p>

<h1 align="center">
  Div Acer Manager Max (Nitro V 16 Fork)
</h1>

<p align="center">
  <strong>Specialized Support for Acer Nitro V 16 (ANV16-41) & Fedora 43</strong>
</p>

---

### 🚀 Fork Specific Features
This fork was created by **V4LG0D** to bring full Linux support to the **Acer Nitro V 16** series.

* **Patched Linuwu-Sense Driver:** Added hardware ID support for `ANV16-41`.
* **Fedora 43 / Kernel 6.19 Ready:** Fixes compilation errors for modern kernels.
* **Smart Installer:** Rebuilt `local-setup.sh` to automatically compile the entire suite (Driver, Daemon, and GUI) from source.
* **.NET 8.0 Target:** Optimized for the standard .NET SDK found in Fedora repositories.

---

**Div Acer Manager Max** is a feature-rich Linux GUI utility for Acer laptops powered by the [Linuwu Sense](https://github.com/0x7375646F/Linuwu-Sense) drivers. It replicates and expands on Acer’s NitroSense capabilities on Linux with full fan control, performance modes, battery optimization, and more.

![Title Image](https://github.com/user-attachments/assets/a60898a6-a2b8-432e-b5a2-8d0a45c63484)

<h4 align="center">
⭐ Please star this repository to show support to the original project and this fork.
</h4>  

## ✨ Features

### ✅ Fully Implemented
* 🔋 **Performance Profiles:** Eco, Silent, Balanced, Performance, Turbo.
* 🌡 **Fan Control:** Manual and Auto modes (Fixed for Nitro V 16).
* 💡 **LCD Override:** Direct control over LCD power behavior.
* 🎨 **Backlight Control:** Customize keyboard timeout and behavior.
* 🔊 **Boot Sound:** Toggle Acer's startup animations and sounds.
* 🧠 **Smart Daemon:** Lightweight (~10MB RAM) and auto-detects features.

## 🧭 Compatibility
This fork specifically targets:
* **Model:** Acer Nitro V 16 (**ANV16-41**)
* **CPU:** AMD Ryzen 7 8845HS (and similar 8000 series)
* **GPU:** NVIDIA RTX 4060 Laptop
* **OS:** Fedora Linux 43 (Kernel 6.19+)

## 🖥️ Installation Guide (Local Build)

Since this model requires a patched driver, you **must** use the local installation method to compile the code for your specific kernel.

### 1. Install Dependencies (Fedora)
```bash
sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) gcc make git dkms dotnet-sdk-8.0 python3-psutil python3-evdev
```
### 2. Clone the Repository
```bash
git clone --recursive [https://github.com/V4LG0D/Div-Acer-Manager-Max-ANV16-41.git](https://github.com/V4LG0D/Div-Acer-Manager-Max-ANV16-41.git)
cd Div-Acer-Manager-Max-ANV16-41
```
### 3. Run the Automated Setup
```bash
chmod +x scripts/local-setup.sh
sudo ./scripts/local-setup.sh
```
### 🛠️ Maintenance & Updates
```bash
cd Linuwu-Sense
sudo make install
```

### ❤️ Credits

    Original Project: PXDiv/Div-Acer-Manager-Max

    Drivers: 0x7375646F/Linuwu-Sense

### 📄 License

This project is licensed under the GNU General Public License v3.0.
