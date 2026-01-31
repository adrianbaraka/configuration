To recreate this setup and fix the "Software Rendering" issue on your Intel HD 520, here is the concise list of commands based on our successful troubleshooting:

### 1. Enable Non-Free Repositories

Edit your sources to include `non-free` and `non-free-firmware`.

```bash
sudo nano /etc/apt/sources.list

```

Ensure your lines look like this:
`deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware`

### 2. Install Firmware & Driver Libraries

Install the kernel firmware and the Mesa hardware acceleration loaders.

```bash
sudo apt update
sudo apt install firmware-misc-nonfree intel-microcode libgl1-mesa-dri libglx-mesa0 mesa-va-drivers mesa-vulkan-drivers

```

### 3. Remove Conflicting Configurations

Remove the manual files that were forcing the non-existent "intel" module.

```bash
# Remove manual etc configs
sudo rm -f /etc/X11/xorg.conf
sudo rm -f /etc/X11/xorg.conf.d/20-intel.conf
sudo rm -f /etc/X11/xorg.conf.d/20-modesetting.conf

# Remove the hidden system override we found
sudo rm -f /usr/share/X11/xorg.conf.d/20-intel.conf

```

### 4. Create the Driver Symlink

Fix the "AIGLX error" by linking the modern Iris driver to the legacy name Xorg was looking for.

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/dri/iris_dri.so /usr/lib/x86_64-linux-gnu/dri/i965_dri.so

```

### 5. Set Environment Overrides

Force the system to use the `iris` driver and ensure you have hardware permissions.

```bash
# Set driver override globally
echo "MESA_LOADER_DRIVER_OVERRIDE=iris" | sudo tee -a /etc/environment

# Add your user to the hardware groups
sudo usermod -a -G video,render $USER

```

### 6. Final Reboot & Verify

Reboot to apply all changes.

```bash
sudo reboot

```

**Verification Commands:**

* **Check Renderer:** `glxinfo -B | grep "renderer string"` (Should show Intel HD 520).
* **Check Live Usage:** `sudo intel_gpu_top` (Should show Render/3D activity).

Would you like me to create a single shell script (`.sh` file) that automates all these steps for you?