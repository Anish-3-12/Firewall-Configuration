# 🔥 Basic Firewall Configuration using iptables

This project demonstrates how to build and configure a simple but effective firewall using `iptables` on a Linux system. It is part of a cybersecurity learning series designed for beginners.

## 🚀 Project Objectives

- Learn to flush and apply iptables rules.
- Set default DROP policies to block unwanted traffic.
- Allow only specific services like SSH, HTTP, and HTTPS.
- Log dropped packets for monitoring.

## 🛠️ Tools Used

- Linux (tested on Ubuntu 20.04)
- iptables
- Terminal/CLI

## 📂 Project Structure

```
Firewall-Project/
├── firewall_rules.sh       # Shell script for firewall rules
├── README.md               # This file
├── test_results.txt        # Testing and verification logs
```

## 🧾 Instructions

1. **Make the script executable**:
    ```
    chmod +x firewall_rules.sh
    ```

2. **Run the script with root privileges**:
    ```
    sudo ./firewall_rules.sh
    ```

3. **Test firewall behavior** (see `test_results.txt`).

4. **Optional**: Modify the script to allow or block other ports/services as needed.

## ✅ Outcome

After running this script:
- Only allowed services are accessible.
- All other unsolicited traffic is blocked.
- Logs are created for dropped packets.

## 📚 References

- [iptables manual](https://man7.org/linux/man-pages/man8/iptables.8.html)
- [Ubuntu iptables how-to](https://help.ubuntu.com/community/IptablesHowTo)
