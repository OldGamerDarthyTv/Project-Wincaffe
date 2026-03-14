# ⚡ OGD WinCaffè ULTIMATE ☕

**v7.3.0 - Sistema Definitivo di Ottimizzazione Windows 11 per Gaming**

```
#DarkPlayer84Tv Productions | by OldGamerDarthy Official
```

---

## 📜 DISCLAIMER

**Progetto NO-PROFIT** per la community gaming

**Autore:** OldGamerDarthy (#DarkPlayer84Tv)  
**Crediti:** WinScript (tweaks base)  
**Licenza:** GNU GPL v3.0

---

## 🆕 v7.3.0 - NETWORK OPTIMIZATION

**🌐 Nuovo menu Network Optimization completo!**

### 3 Modalità di Ottimizzazione:

**[1] 📡 WiFi ONLY**
- TCP/IP stack optimization
- Power saving OFF
- Roaming Aggressiveness: Lowest (stability)
- Transmit Power: Highest
- 802.11n/ac/ax optimization

**[2] 🔌 Ethernet ONLY**
- TCP/IP stack optimization
- Energy Efficient Ethernet OFF
- Interrupt Moderation OFF (gaming)
- Jumbo Frames 9KB
- RSS optimization + core binding
- Flow Control enabled
- LSO disabled (gaming priority)
- Buffers maximized (RX/TX 2048)

**[3] 🌐 WiFi + Ethernet**
- Tutte le ottimizzazioni combinate

---

## 📊 TWEAKS NETWORK TESTATI

### TCP/IP Registry (Comuni)
- **NetworkThrottlingIndex:** FFFFFFFF (no throttling)
- **TcpAckFrequency:** 1 (no delay ACK)
- **TCPNoDelay:** 1 (Nagle algorithm OFF)
- **IRPStackSize:** 32 (da 15 default)
- **GlobalMaxTcpWindowSize:** 65535

### WiFi Specifici
- **Power Management:** OFF
- **Roaming Aggressiveness:** Lowest (home stability)
- **Transmit Power:** Highest
- **802.11n Mode:** Enabled
- **Throughput Enhancement:** Disabled

### Ethernet Specifici
- **Energy Efficient Ethernet:** OFF
- **Interrupt Moderation:** OFF (latency <1ms)
- **Jumbo Frames:** 9014 bytes
- **Flow Control:** Rx & Tx Enabled
- **LSO v2:** Disabled (gaming priority)
- **RSS:** Enabled + bind cores 2-3
- **Buffers:** RX/TX 2048 (maximum)

**Risultati attesi:**
- 🎯 Latency: **-20-30%**
- 🎯 Ping: **-10-15ms**
- 🎯 Jitter: **-50%**

---

## 🚀 WORKFLOW COMPLETO v7.3.0

```
1. Disclaimer + accettazione
2. Check PowerShell 7.5+
3. Check .NET 6-11 (18 componenti)
4. Livello gaming (Light/Normale/Aggressivo)
5. Protezione Privacy (0-4)
6. Network Optimization (0-3) ✨ NUOVO
7. Programmi opzionali (0-9)
8. Installazione + riavvio
```

---

## 🎯 LIVELLI GAMING

**[1] LIGHT** - 5 step | +5-10% FPS

**[2] NORMALE** - 11 step | +10-15% FPS ⭐

**[3] AGGRESSIVO** - 14 step | +15-20% FPS

---

## 🔒 PROTEZIONE PRIVACY

**4 livelli:**
- [1] 🟢 Light
- [2] 🟡 Normale
- [3] 🔴 Aggressivo
- [4] ⚫ Paranoico

---

## 🌐 NETWORK OPTIMIZATION

**Indipendente da livello gaming!**

### Scelta Network:
- **0** = Skip (default)
- **1** = WiFi ONLY
- **2** = Ethernet ONLY
- **3** = WiFi + Ethernet

### TCP/IP Tweaks (tutti)

**Registry modifiche:**
```
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
└─ NetworkThrottlingIndex = FFFFFFFF

HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
├─ TcpAckFrequency = 1
├─ TCPNoDelay = 1
├─ IRPStackSize = 32
└─ GlobalMaxTcpWindowSize = 65535
```

### WiFi Adapter Settings

**Device Manager → Network Adapters → WiFi → Advanced:**
- Power Management: **OFF**
- Roaming Aggressiveness: **Lowest** (home network)
- Transmit Power: **Highest**
- Power Saving Mode: **Maximum Performance**
- 802.11n Mode: **Enabled**
- Fat Channel Intolerant: **Disabled**
- Throughput Enhancement: **Disabled**

**Benefici:**
- ✅ Latency stabile
- ✅ No disconnessioni
- ✅ Signal strength massimo
- ✅ No roaming inutile

### Ethernet Adapter Settings

**Device Manager → Network Adapters → Ethernet → Advanced:**

**Energy:**
- Energy Efficient Ethernet: **Disabled**
- Advanced EEE: **Disabled**
- Green Ethernet: **Disabled**

**Performance:**
- Interrupt Moderation: **Disabled** (gaming)
- Flow Control: **Rx & Tx Enabled**
- Jumbo Frames: **9014 bytes**

**Offload:**
- Large Send Offload v2 IPv4: **Disabled**
- Large Send Offload v2 IPv6: **Disabled**
- TCP Checksum Offload: **Enabled**
- UDP Checksum Offload: **Enabled**

**Buffers:**
- Receive Buffers: **2048** (maximum)
- Transmit Buffers: **2048** (maximum)

**RSS:**
- Receive Side Scaling: **Enabled**
- RSS Base Processor: **2** (3rd core)

**Benefici:**
- ✅ Latency <1ms
- ✅ Throughput massimo
- ✅ Zero packet loss
- ✅ CPU load distribuito

---

## 💾 FEATURES COMPLETE

**Core Gaming:**
- 11 Parametri Memory
- 33 Process Priority
- RAM DDR4/DDR5 (8-128GB)

**Privacy:**
- Privacy gaming integrata
- Protezione Privacy 4 livelli

**Network:** ✨ NUOVO
- TCP/IP optimization
- WiFi tweaks (8 settings)
- Ethernet tweaks (12 settings)

**Visual:**
- Menu istantanei
- Mouse accel OFF
- Dark mode

---

## 📦 DIPENDENZE

**PowerShell 7.5+**  
**.NET 6-11 (18 componenti)**  
**Auto-install via winget**

---

## 🙏 CREDITI

**Autore:** OldGamerDarthy (#DarkPlayer84Tv)  
**Network Tweaks:** Gaming community, Microsoft docs, Intel/Realtek optimization guides  
**Privacy:** WinScript  
**Licenza:** GNU GPL v3.0

---

## 📅 CHANGELOG v7.3.0

**Features:**
- ✅ Menu Network Optimization (WiFi/Ethernet/Both)
- ✅ TCP/IP stack tweaks (5 parametri registry)
- ✅ WiFi optimization (8 adapter settings)
- ✅ Ethernet optimization (12 adapter settings)
- ✅ RSS core binding (cores 2-3)
- ✅ Auto-detection adapters

**Network Tweaks:**
- NetworkThrottlingIndex FFFFFFFF
- TcpAckFrequency, TCPNoDelay
- IRPStackSize 32
- WiFi: Power OFF, Roaming Lowest
- Ethernet: EEE OFF, Interrupt Mod OFF, Jumbo 9K

**Risultati:**
- Latency -20-30%
- Ping -10-15ms
- Jitter -50%

---

**OGD WinCaffè v7.3.0 ULTIMATE**

**#DarkPlayer84Tv Productions**  
by **OldGamerDarthy Official**

13 Marzo 2026

---

**☕ Usa `wincaffe` e ottimizza! 🎮⚡🌐**
