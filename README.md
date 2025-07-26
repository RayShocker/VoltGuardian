# 🔧 VoltGuardian – Exynos Performance & Efficiency Module

⚠️ **Tested only on Exynos 9820 (Galaxy S10/S10+). Use on other devices at your own risk.**

---

## 🧠 What It Does (Simple Overview)

**VoltGuardian** is a lightweight performance module designed to keep your device **smooth**, **cool**, and **power-efficient** — without relying on third-party apps.

Every 10 seconds, it automatically:

- 🔧 Sets **max/min CPU and GPU frequency limits** per cluster  
- 📌 Locks CPU and GPU **governors to `schedutil`**  
- ⚡ Applies **light undervolting** to CPU, GPU, and other components  
  > *(Typically between -1 to -2 steps)*  
- 📝 Generates a small **debug log file** for monitoring  

📂 **Log Location:** `/data/local/tmp/volt-guardian-debug.log`

---

## 📜 Important Note

This module is **specifically tuned and tested** for **Exynos 9820 (Galaxy S10/S10+)**.

⚠️ I don't know if it works on other devices or SoCs — and I **do not recommend** trying it.  
Improper use may cause **instability**, **overheating**, or **unexpected behavior**.
