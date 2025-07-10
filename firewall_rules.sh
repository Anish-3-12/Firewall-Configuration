#!/bin/bash

# Title: Basic Firewall Configuration Script
# Description: Applies basic iptables rules for securing a Linux system.
# Author: [Your Name]
# Date: [Today's Date]

# -----------------------------
# STEP 1: Flush Existing Rules
# -----------------------------
# Remove all previously set iptables rules to avoid conflicts
echo "[+] Flushing existing iptables rules..."
iptables -F      # Flush all rules
iptables -X      # Delete all user-defined chains
iptables -Z      # Zero packet and byte counters

# -----------------------------
# STEP 2: Set Default Policies
# -----------------------------
# Set the default policy to DROP for INPUT and FORWARD chains to block all traffic by default
# Allow all outgoing traffic for system operations like software updates
echo "[+] Setting default policies..."
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# -----------------------------
# STEP 3: Allow Localhost Traffic
# -----------------------------
# Permit all traffic on loopback interface (lo), which is essential for local services
echo "[+] Allowing unlimited traffic on the loopback interface (localhost)..."
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# -----------------------------
# STEP 4: Allow Established Connections
# -----------------------------
# Allow incoming traffic that is part of or related to established connections
echo "[+] Allowing established and related incoming traffic..."
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# -----------------------------
# STEP 5: Allow SSH (Port 22)
# -----------------------------
# This is required to access the server remotely via SSH
echo "[+] Allowing incoming SSH (port 22)..."
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# -----------------------------
# STEP 6: Allow HTTP and HTTPS
# -----------------------------
# These are necessary for web server communication
echo "[+] Allowing incoming HTTP (port 80)..."
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "[+] Allowing incoming HTTPS (port 443)..."
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# -----------------------------
# STEP 7: Log Dropped Packets (Optional)
# -----------------------------
# Helpful for debugging and monitoring unauthorized access attempts
echo "[+] Logging dropped packets (optional)..."
iptables -A INPUT -j LOG --log-prefix "Dropped Packet: " --log-level 4

# -----------------------------
# Done
# -----------------------------
echo "[+] Firewall rules applied successfully!"
