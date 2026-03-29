<div align="center">

# ⚡ OGD WinCaffè ULTIMATE ☕

**Sistema Definitivo di Ottimizzazione Windows 11 per Gaming**

[![Version](https://img.shields.io/badge/versione-7.6.9-blue?style=for-the-badge)](https://github.com/OldGamerDarthy/OGD-WinCaffe)
[![Platform](https://img.shields.io/badge/platform-Windows%2011-0078D4?style=for-the-badge&logo=windows)](https://github.com/OldGamerDarthy/OGD-WinCaffe)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?style=for-the-badge&logo=powershell)](https://github.com/OldGamerDarthy/OGD-WinCaffe)
[![License](https://img.shields.io/badge/licenza-GPL%20v3-green?style=for-the-badge)](LICENSE)
[![Discord](https://img.shields.io/badge/Discord-OGD%20Community-7289DA?style=for-the-badge&logo=discord)](https://discord.gg/5SJa2xp5)

*by OldGamerDarthy — #DarkPlayer84Tv Productions*

</div>

---

## 💡 Perché esiste questo script

Questo script nasce da un'idea semplice: **aiutare le persone**.

Quante volte hai visto amici o parenti con PC lentissimi, pieni di bloatware, aggiornamenti che partono durante una partita, WiFi che va a scatti? Ho un server Discord dove ogni giorno arrivano persone con PC incasinati. **Ci sono tantissimi utenti in difficoltà** che non sanno da dove iniziare.

OGD WinCaffè nasce per questo: uno strumento **sicuro, guidato, con punto di ripristino automatico**, che fa il lavoro duro per te senza richiedere conoscenze tecniche.

**È un progetto NO-PROFIT, open source, per il bene comune.**

---

## 📋 Indice

- [Requisiti](#-requisiti)
- [Installazione rapida](#-installazione-rapida)
- [Menu principale](#-menu-principale)
- [Livelli ottimizzazione Desktop](#-livelli-ottimizzazione-desktop)
- [Aggressivo Gaming](#-aggressivo-gaming)
- [Livelli Laptop](#-livelli-laptop)
- [Strumenti aggiuntivi](#-strumenti-aggiuntivi)
- [WinRevive](#%EF%B8%8F-winrevive)
- [DPC Latency Fix](#-dpc-latency-fix)
- [NVIDIA Tweaks](#-nvidia-tweaks)
- [NPU Tweaks](#-npu-tweaks)
- [Net Tweaks](#-net-tweaks)
- [Unreal Engine Tweaks](#-unreal-engine-tweaks)
- [Call of Duty Tweaks](#-call-of-duty-tweaks)
- [Timer 0.5ms v2.0](#%EF%B8%8F-timer-05ms-v20)
- [Risultati attesi](#-risultati-attesi)
- [Sicurezza e ripristino](#-sicurezza-e-ripristino)
- [FAQ](#-faq)
- [Changelog](#-changelog)
- [Credits](#-credits)

---

## ✅ Requisiti

| Requisito | Minimo | Consigliato |
|-----------|--------|-------------|
| OS | Windows 11 build 22000+ | Windows 11 24H2+ |
| RAM | 8 GB | 16 GB+ |
| PowerShell | 5.1 | 7.5+ (auto-installato) |
| Permessi | Amministratore | Amministratore |
| .NET | — | Auto-installato |

> ⚠️ Lo script **non funziona** su Windows 10 o precedenti.

---

## 🚀 Installazione rapida

1. Scarica l'[ultima release](https://github.com/OldGamerDarthy/OGD-WinCaffe/releases/latest) come ZIP
2. **Estrai** tenendo `OGD_WinCaffe_ULTIMATE.ps1` e `OGD_Timer_0.5ms.ps1` nella **stessa cartella**
3. **Click destro** su `OGD_WinCaffe_ULTIMATE.ps1` → **"Esegui con PowerShell"**
4. Se Windows blocca: click destro → Proprietà → spunta **"Sblocca"** → OK

> Lo script installa automaticamente PowerShell 7+ e .NET se mancanti.

### Comando globale `wincaffe`

Scegli **[1] INSTALLA** — lo script si copia in `C:\OGD\` e aggiunge la funzione al profilo PS.  
Poi da qualsiasi finestra PowerShell: digita `wincaffe`

### Aggiornare da versione precedente

1. Scarica il nuovo ZIP
2. Estrai ed esegui `OGD_WinCaffe_ULTIMATE.ps1` **direttamente** (non `wincaffe`)
3. Lo script rileva la versione installata e aggiorna automaticamente

---

## 📖 Menu principale

```
╔═══════════════════════════════════════════════════════╗
║       ⚡ OGD WinCaffè ULTIMATE — MENU PRINCIPALE      ║
╚═══════════════════════════════════════════════════════╝

  LIVELLI DI OTTIMIZZAZIONE
  [1] 🟢 LIGHT           — Base, safe al 100%
  [2] 🟡 NORMALE         — Completo gaming (raccomandato)
  [3] 🔴 AGGRESSIVO      — Massima performance desktop
  [A] ⚡ AGGRESSIVO GAMING — Sub-menu Light/Normale/Full
  [4] 💻 LAPTOP          — Sub-menu Light/Normale/Alto/Ultra
  [5] 🎮 LAPTOP GAMING   — Sub-menu Light/Normale/Alto/Ultra

  STRUMENTI AGGIUNTIVI
  [6] 🌐 DNS TNT         [7] 📁 EXPLORER    [8] 📜 INFO
  [9] 🔄 RESET           [F] 📂 FILE I/O    [U] 🔄 WINGET
  [W] 🛠️  WINREVIVE       [N] 📡 NET TWEAKS  [G] 🟢 NVIDIA
  [L] ⚡ DPC FIX         [P] 🧠 NPU         [E] 🎮 UNREAL
  [C] 🔫 CALL OF DUTY    [D] 💬 DISCORD     [0] ❌ ESCI
```

---

## 🎮 Livelli ottimizzazione Desktop

### [1] 🟢 LIGHT — Base safe al 100%

| # | Tweak | Effetto |
|---|-------|---------|
| 1 | C-States solo C1 | Elimina freeze da stati profondi |
| 2 | Timer 0.5ms v2.0 | Latenza da 15.6ms a 0.5ms |
| 3 | Piano Ultimate | Prestazioni massime |
| 4-5 | Privacy + TCP/IP | Telemetria OFF, Nagle OFF, RSC, CTCP, QoS 0% |
| 6-7 | DNS + Explorer | Cache DNS flush, BagMRU/Bags pulizia |
| 8 | GPU HwScheduling | HW Sched ON, TDR 10s |
| + | WiFi + LAN | Power OFF, Roaming basso, U-APSD OFF, EEE OFF |

**Risultato:** +5-10% FPS, Boot -10%

### [2] 🟡 NORMALE — Completo Gaming ⭐

Include Light, più: Process Priority 33+, NPU Offload, Privacy completo, Debloat (no Netflix/Spotify), Visual, Memory DDR4/DDR5, WiFi/LAN avanzato.

**Risultato:** +10-15% FPS, Boot -20%

### [3] 🔴 AGGRESSIVO — Massima performance

Include Normale, più: Core Affinity P/E cores, Memory 11 parametri, Responsiveness 3.

**Risultato:** +15-20% FPS, Boot -30%

---

## ⚡ Aggressivo Gaming

Sotto-menu con 3 livelli progressivi:

| Livello | Per chi | Contenuto |
|---------|---------|-----------|
| **[L] Light** | Tutti i PC gaming | Game Mode, DVR OFF, process priority gaming, FSE, mouse lineare |
| **[N] Normale** | PC 8GB+ | Light + MMCSS Games Priority 6 GPU 8, CPU Boost, Power Throttling OFF |
| **[F] Full** | Desktop 16GB+ | Normale + 14 Win11 hidden tweaks, Core Parking OFF, RAM estrema, OS hidden |

**Risultato:** Light +10% | Normale +15-20% | Full +20-30%

---

## 💻 Livelli Laptop

Disponibile per **[4] LAPTOP** e **[5] LAPTOP GAMING**:

| Livello | Batteria | Performance |
|---------|----------|-------------|
| **[L] Light** | Preservata | +5% |
| **[N] Normale** | Leggero impatto | +10% |
| **[A] Alto** | Consigliato in carica | +15% |
| **[U] Ultra** | Solo in carica | +20% |

Laptop Gaming [5] in Ultra aggiunge: GPU max clock, Game Mode ON, DVR OFF.

---

## 🔧 Strumenti aggiuntivi

| Tool | Funzione |
|------|---------|
| **[6] DNS TNT** | flushdns + registerdns + release + renew + winsock reset |
| **[7] Explorer** | Pulizia cache BagMRU/Bags |
| **[F] File I/O** | NTFS Last Access OFF, 8.3 OFF, NDU tweak |
| **[U] Winget** | `winget update --unknown --all --force` |

---

## 🛠️ WinRevive

| Opzione | Funzione | Durata |
|---------|---------|--------|
| [1] Reset WU | Fix errori aggiornamenti | ~1 min |
| [2] Repair Image | DISM + SFC | 10-30 min |
| [3] Store Reset | Fix Microsoft Store | ~2 min |
| [4] Network Reset | Reset stack rete | ~1 min |
| [5] Clean Basic | Temp, cache, Cestino | ~2 min |
| [6] Clean Advanced | Basic + DISM + browser | 5-15 min |
| [7] Disable Recall | Disabilita Recall Win11 | ~1 min |
| [A] ALL | Tutto 1+2+3+4 | 15-35 min |

---

## ⚡ DPC Latency Fix

| Opzione | Funzione |
|---------|---------|
| **[1] Analisi** | Apre/scarica LatencyMon |
| **[2] Fix Rapido** | Timer, High Performance, C1, USB OFF, MMCSS Audio |
| **[3] Fix Avanzato** | Fix Rapido + MSI Interrupts, HPET OFF, IRQ audio |
| **[4] Reset** | Ripristina piano, bcdedit, SysMain/WSearch |

**Valori:** < 100µs ottimo | < 500µs buono | > 1ms problema

---

## 🟢 NVIDIA Tweaks

| Profilo | Contenuto |
|---------|----------|
| **[1] Base** | Shader Cache, Telemetria OFF, FXAA OFF, Texture High Perf |
| **[2] Gaming** | Base + Low Latency Ultra, Pre-Rendered Frames 1, Power Max |
| **[3] Full** | Gaming + MSI Interrupts, NVENC/NVDEC, OpenGL Threading |
| **[A] All** | 1+2+3 |
| **[R] Reset** | Default NVIDIA |

---

## 🧠 NPU Tweaks

Rilevamento automatico Intel AI Boost / AMD Ryzen AI / Qualcomm Hexagon.  
Se assente → avviso + conferma prima di procedere.

| Profilo | Contenuto |
|---------|----------|
| **[1] Base** | NPU Offload ON, DirectML NPU, AI telemetria OFF |
| **[2] Gaming** | Base + NPU Priority MAX, Background AI OFF |
| **[3] Full** | Gaming + Windows AI Platform, ONNX NPU, throttling OFF |
| **[R] Reset** | Default AI/NPU |

---

## 📡 Net Tweaks

Basato su **TCP Optimizer** by Speedguide.net — crediti a loro.

**TCP/IP:** AutoTuning Normal, CTCP, RSC ON, RSS ON, NonSackRtt OFF, MaxSynRetrans 2, RTO 2000/300ms, Nagle OFF, TcpAckFreq 1, DelAckTicks 0, MaxUserPort 65534, MaxConn 20, DNS priority 4/5/6/7, SystemResponsiveness 0, QoS 0%

**WiFi:** U-APSD OFF, 5GHz preferred, Interrupt OFF, ARP Offload OFF, Wake OFF  
**LAN:** EEE OFF, Interrupt OFF, Jumbo 9K, RSS ON, Checksum ON, Buffer 2048  
**DNS opzionale:** Cloudflare `1.1.1.1` | Google `8.8.8.8` | Quad9 `9.9.9.9`

---

## 🎮 Unreal Engine Tweaks

| Profilo | Contenuto |
|---------|----------|
| **[1] Developer** | ShaderCompileWorker High priority, paging file 1x-3x RAM, TDR 60s |
| **[2] Gaming** | Shader Cache 4GB, DX12 heap, CPU Boost Aggressive, MMCSS |
| **[3] Full** | Developer + Gaming |
| **[R] Reset** | Default |

**Fix:** shader stuttering, compilazione lenta, WorldPartition lag, Lumen crash.

---

## 🔫 Call of Duty Tweaks

Supporto **MW (2019) → Black Ops 7** — 100% safe, nessuna modifica ai file di gioco.

| Profilo | Contenuto |
|---------|----------|
| **[1] Base** | Process priority High tutti i CoD exe, Xbox DVR OFF *(Discord e NVIDIA overlay lasciati attivi)*, Game Mode, MMCSS, **fix crash Discord screen share + minimize** |
| **[2] Network** | TCP/IP gaming, QoS UDP porta 3074 DSCP 46, LAN ottimizzata, DNS flush |
| **[3] Black Ops 7** | Process BO7, Shader Cache 4GB DX12, Quantum Fixed, IW Engine hidden tweaks, audio MMCSS Clock 10000 |
| **[A] All** | 1+2+3 |
| **[R] Reset** | Default |

> 🔔 Quando uscirà il prossimo CoD verrà aggiunto il supporto nella versione successiva.

---

## ⏱️ Timer 0.5ms v2.0

File separato: `OGD_Timer_0.5ms.ps1` — copiato sul Desktop durante l'ottimizzazione.

- Riduce timer di sistema da 15.6ms → 0.5ms via `NtSetTimerResolution`
- Loop ogni 30s — reimposta automaticamente se qualcos'altro lo resetta
- Admin check corretto, output silenzioso

**Come usarlo:** avvia prima di giocare → **minimizza** → chiudi quando hai finito.

---

## 📊 Risultati attesi

| Livello | FPS | Boot | I/O |
|---------|-----|------|-----|
| Light | +5-10% | -10% | +20% |
| Normale | +10-15% | -20% | +25% |
| Aggressivo | +15-20% | -30% | +30% |
| Aggressivo Gaming Full | +20-30% | -35% | +35% |

> Risultati variabili in base all'hardware. Testato su configurazioni AMD e Intel con GPU NVIDIA.

---

## 🔒 Sicurezza e ripristino

Prima di **ogni** modifica viene creato automaticamente un punto di ripristino Windows.

```
Start → "Ripristino configurazione sistema"
→ Seleziona "OGD WinCaffè v7.6.9"
→ Avanti → Fine
```

---

## 📦 Programmi opzionali (34 app, 7 categorie)

Installati via **winget** con check stato pre-installazione:

| Categoria | App |
|-----------|-----|
| 🌐 Browser | Chrome, Firefox, Brave |
| 📊 Monitoring | GPU-Z, CPU-Z, HWiNFO, HWMonitor, CoreTemp, CrystalDiskInfo, CrystalDiskMark, Speccy, OCCT |
| ⚡ Overclock | MSI Afterburner, ThrottleStop |
| 🔧 Driver | DDU, Snappy Driver Installer, NVCleanstall |
| 🛠️ Utilità | 7-Zip, Notepad++, Everything, TreeSize, Revo, BCUninstaller, UniGetUI, PowerToys, ShareX... |
| 🎮 Gaming | Steam, Discord, Playnite, Parsec |
| 🌐 Rete | qBittorrent, Wireshark |

---

## ❓ FAQ

<details>
<summary><b>Micro-freeze ogni 2 secondi durante il gaming</b></summary>

Quasi sempre è Windows Update in esecuzione. Vai in **Impostazioni → Windows Update → Sospendi**, riavvia e riprova.
</details>

<details>
<summary><b>Lo script si chiude subito con errori rossi</b></summary>

Eseguilo come Amministratore. Per vedere l'errore: apri PowerShell come Admin e lancia `.\OGD_WinCaffe_ULTIMATE.ps1`.
</details>

<details>
<summary><b>"Execution policy" blocca lo script</b></summary>

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```
</details>

<details>
<summary><b>`wincaffe` non funziona dopo l'installazione</b></summary>

Chiudi e riapri completamente PowerShell — il profilo viene caricato solo all'avvio.
</details>

<details>
<summary><b>CoD crasha con Discord screen share o minimize</b></summary>

Usa **[C] → [1] Base** — include il fix dedicato. In-game imposta **Display Mode → Borderless Windowed** per il fix definitivo al minimize.
</details>

<details>
<summary><b>Il PC è più lento dopo l'ottimizzazione</b></summary>

Start → "Ripristino configurazione sistema" → seleziona il punto OGD.
</details>

<details>
<summary><b>Lag audio / crackling anche con PC potente</b></summary>

Usa **[L] DPC Latency Fix → [1] Analisi** per identificare il driver, poi **[2]** o **[3]**.
</details>

<details>
<summary><b>La versione mostrata è quella vecchia dopo aggiornamento</b></summary>

Lancia il nuovo script direttamente (non `wincaffe`) e scegli **[1] INSTALLA**.
</details>

---

## 🔢 Changelog

### v7.6.9 — 20 Marzo 2026
- 🔫 **CoD crash fix:** fix dedicato Discord screen share e minimize — Flip Model, TDR aumentato, HAGS ON, GPU virtualizzazione OFF

### v7.6.7
- 🔫 Discord e NVIDIA overlay lasciati attivi — rimosso solo Xbox DVR

### v7.6.6
- 🔫 **[C] Call of Duty Tweaks:** MW2019→BO7, QoS UDP 3074 DSCP 46, IW Engine hidden tweaks

### v7.6.5
- 🐛 Fix installazione: percorsi case-insensitive, copia timer, funzione `wincaffe` usa `pwsh`

### v7.6.4
- 🐛 Fix crash avvio: `${currentVersion}` (ParserError)

### v7.6.3
- 🐛 Fix auto-update copia su se stesso da `wincaffe`

### v7.6.2
- ⚠️ NPU Tweaks: gate accettazione se no NPU

### v7.6.1
- 🎮 **[E] Unreal Engine Tweaks:** Developer/Gaming/Full, TDR 60s, shader cache 4GB

### v7.6.0
- ⚡ **[A] Aggressivo Gaming:** sub-menu Light/Normale/Full
- 🧠 **[P] NPU Tweaks:** Intel/AMD/Qualcomm

### v7.5.x
- TCP/IP da TCP Optimizer, Timer 0.5ms v2.0, DPC Latency Fix, NVIDIA Tweaks, fix vari

### v7.4.x
- NET TWEAKS, Laptop modes, WinRevive, Privacy 4 livelli, programmi opzionali

---

## 🙏 Credits

### Autore

**OldGamerDarthy** — `#DarkPlayer84Tv Productions`  
Sviluppo, integrazione, testing e manutenzione

### Ringraziamenti personali

| | |
|-|-|
| **AlexsTrexx (Alex)** ⭐ | Tester della versione embrionale — primo a crederci |
| **Diego** | Supporto, consigli e amicizia durante tutto lo sviluppo |
| **Community Discord OGD** | Domande, idee e consigli che hanno fatto crescere il progetto |

👉 [Unisciti al server Discord OGD](https://discord.gg/5SJa2xp5)

---

### Fonti e crediti tecnici

> ⚠️ **Nota importante sui crediti tecnici**
>
> Questo script **non ruba né copia** nulla.  
> Raccoglie tweaks e ottimizzazioni **pubblicamente disponibili** e li rende accessibili a tutti  
> in modo guidato, sicuro e con punto di ripristino automatico.  
> **I crediti restano interamente ai rispettivi autori.**  
> L'obiettivo è diffondere la conoscenza e aiutare le persone — non appropriarsi del lavoro altrui.

| Fonte | Utilizzo | Link |
|-------|---------|------|
| **Speedguide.net — TCP Optimizer** | Impostazioni TCP/IP gaming: RSC, CTCP, RTO, ACK freq, QoS, DNS priority | [speedguide.net/tcpoptimizer.php](https://www.speedguide.net/tcpoptimizer.php) |
| **Resplendence — LatencyMon** | Strumento analisi DPC latency usato nel menu [L] | [resplendence.com/latencymon](https://www.resplendence.com/latencymon) |
| **WinScript Community** | Base dei tweaks privacy e telemetry | Community pubblica |
| **Reddit — r/GlobalOffensive, r/Warzone, r/pcgaming** | Tweaks CoD, DPC fix, hidden registry keys gaming | [reddit.com](https://reddit.com) |
| **XtremeSystems & HPET forums** | Ottimizzazioni timer, interrupt, DPC latency | Community pubblica |
| **Microsoft Docs** | Documentazione ufficiale registry, PowerCFG, MMCSS, DirectX API | [docs.microsoft.com](https://docs.microsoft.com) |
| **Claude AI (Anthropic)** | Assistenza nello sviluppo dello script | [claude.ai](https://claude.ai) |

---

### Strumenti consigliati (non inclusi nello script)

- [LatencyMon](https://www.resplendence.com/latencymon) — analisi DPC latency
- [TCP Optimizer](https://www.speedguide.net/tcpoptimizer.php) — ottimizzazione rete avanzata
- [HWiNFO64](https://www.hwinfo.com/) — monitoring hardware avanzato
- [MSI Afterburner](https://www.msi.com/Landing/afterburner) — monitoring e OC GPU

---

## 📄 Licenza

Distribuito sotto **GNU General Public License v3.0**.  
Puoi usarlo, modificarlo e distribuirlo mantenendo i crediti agli autori e la stessa licenza.  
Vedi [LICENSE](LICENSE) per i dettagli.

---

<div align="center">

*OGD WinCaffè v7.6.9 — Original Gaming Design* ⚡☕

*Fatto con ❤️ per la community gaming*

[![Discord](https://img.shields.io/badge/Discord-Unisciti%20al%20server-7289DA?style=for-the-badge&logo=discord)](https://discord.gg/5SJa2xp5)

</div>
Readme Aggiornato al 29/03/2026 =)
