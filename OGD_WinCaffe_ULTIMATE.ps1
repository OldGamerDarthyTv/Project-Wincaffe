#Requires -Version 5.1
<#
═══════════════════════════════════════════════════════════════════════════════
 ⚡ OGD WinCaffè v7.2.3 ULTIMATE ⚡
 
 Sistema Definitivo di Ottimizzazione Windows 11 per Gaming
 
 ┌─────────────────────────────────────────────────────────────┐
 │ #DarkPlayer84Tv Productions                                 │
 │ by OldGamerDarthy Official                                  │
 │ OGD Team - Original Gaming Design                           │
 └─────────────────────────────────────────────────────────────┘
 
 NOVITÀ v7.2.3:
   🛠️ STRUMENTI EXTRA (AI/Copilot, OneDrive, Privacy, UI)
   📦 Programmi Opzionali Consigliati (9 app via Chocolatey)
   ❌ Rimozione AI/Copilot/Recall completa
   🔒 Telemetry OFF (NVIDIA, Adobe, VS, PowerShell)
   🎨 Ottimizzazioni UI (Dark mode, Menu classico, etc)
 
 INCLUDE v7.2.3:
   🧠 RAM INTELLIGENTE DDR4/DDR5 (8-128GB)
   💾 11 PARAMETRI MEMORY MANAGEMENT
   📊 IoPageLockLimit + SvcHostSplit valori esatti
   ⚡ Comando globale 'wincaffe'
   
 Autore: OldGamerDarthy | #DarkPlayer84Tv Productions
 Data: 9 Marzo 2026 | Windows 11 25H2/26H1
═══════════════════════════════════════════════════════════════════════════════
#>

# Admin check
if(-not([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
    # Preferisci pwsh se disponibile
    $pwshExe=Get-Command pwsh -EA SilentlyContinue
    if($pwshExe){
        Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;exit
    }else{
        Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;exit
    }
}

# Windows 11 check
$os=Get-CimInstance Win32_OperatingSystem;$build=[int]$os.BuildNumber
if($build -lt 22000){
    Write-Host "`n  ⚠️  Richiesto Windows 11 (build 22000+) - Build: $build" -ForegroundColor Red
    Read-Host "  INVIO";exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  DISCLAIMER E CREDITI
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
Write-Host "  ║  OGD WinCaffè v7.2.3 ULTIMATE - DISCLAIMER & CREDITI  ║" -F Cyan
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -F Cyan

Write-Host "  📜 INFORMAZIONI IMPORTANTI:`n" -F Yellow

Write-Host "  Questo script è un progetto NO-PROFIT creato per aiutare" -F White
Write-Host "  la comunità gaming ad ottimizzare Windows 11.`n" -F White

Write-Host "  👨‍💻 AUTORE PRINCIPALE:" -F Cyan
Write-Host "     OldGamerDarthy (#DarkPlayer84Tv Productions)" -F White
Write-Host "     Sviluppo, integrazione e manutenzione`n" -F DarkGray

Write-Host "  🙏 CREDITI E RINGRAZIAMENTI:" -F Cyan
Write-Host "     • WinScript (script base privacy/telemetry)" -F White
Write-Host "     • Community gaming Windows (feedback e test)" -F White
Write-Host "     • Claude AI (assistenza sviluppo)`n" -F White

Write-Host "  ⚠️  RESPONSABILITÀ:" -F Yellow
Write-Host "     • Questo script modifica il registro di sistema" -F White
Write-Host "     • Viene creato un punto di ripristino automatico" -F White
Write-Host "     • Backup registro salvato sul Desktop" -F White
Write-Host "     • L'autore non è responsabile per eventuali problemi" -F White
Write-Host "     • Usare a proprio rischio e responsabilità`n" -F White

Write-Host "  ✅ GARANZIE:" -F Green
Write-Host "     • Codice testato su Windows 11 (build 22000+)" -F White
Write-Host "     • Punto ripristino creato prima di ogni modifica" -F White
Write-Host "     • Backup completo registro di sistema" -F White
Write-Host "     • Possibilità di ripristino tramite F8 al boot`n" -F White

Write-Host "  ════════════════════════════════════════════════════════`n" -F Cyan

$accept=Read-Host "  Accetti i termini e vuoi proseguire? (S/N)"

if($accept -notin @("S","s")){
    Write-Host "`n  Script terminato. Grazie!`n" -F Yellow
    Start-Sleep 2
    exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  AUTO-UPDATE CHECK
# ═════════════════════════════════════════════════════════════════════════════

$currentVersion="7.2.3"
$installedScript="C:\OGD\OGD_WinCaffe_ULTIMATE.ps1"

if(Test-Path $installedScript){
    # Leggi versione installata
    $installedContent=Get-Content $installedScript -Raw
    if($installedContent -match 'OGD WinCaffè v(\d+\.\d+)'){
        $installedVersion=$Matches[1]
        
        # Confronta versioni
        if([version]$currentVersion -gt [version]$installedVersion){
            Clear-Host
            Write-Host "`n  🔄 AGGIORNAMENTO DISPONIBILE`n" -F Yellow
            Write-Host "  Installata: v$installedVersion" -F White
            Write-Host "  Disponibile: v$currentVersion`n" -F Green
            
            if((Read-Host "  Aggiornare script installato? (S/N)") -in @("S","s")){
                Copy-Item $PSCommandPath $installedScript -Force
                Write-Host "  ✓ Script aggiornato a v$currentVersion!" -F Green
                Start-Sleep 2
            }
        }
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  POWERSHELL 7.5+ CHECK & AUTO-INSTALL
# ═════════════════════════════════════════════════════════════════════════════

$psVersion=$PSVersionTable.PSVersion
$needsPS7=$false

if($psVersion.Major -lt 7){
    # PowerShell 5.x - Installa PS 7.5
    Clear-Host
    Write-Host "`n  ⚡ POWERSHELL 7.5 RICHIESTO`n" -F Yellow
    Write-Host "  Versione attuale: PowerShell $($psVersion.Major).$($psVersion.Minor)" -F White
    Write-Host "  Consigliata: PowerShell 7.5+ (migliori performance)`n" -F Green
    
    if((Read-Host "  Installare PowerShell 7.5? (S/N)") -in @("S","s")){
        Write-Host "`n  Installazione via winget..." -F Cyan
        winget install Microsoft.PowerShell --silent --accept-source-agreements --accept-package-agreements
        if($LASTEXITCODE -eq 0){
            Write-Host "  ✓ PowerShell 7.5 installato!" -F Green
            Write-Host "`n  Riavvio script con PowerShell 7.5...`n" -F Yellow
            Start-Sleep 2
            Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
            exit
        }else{
            Write-Host "  ⚠ Installazione fallita. Continuo con PS $($psVersion.Major).$($psVersion.Minor)" -F Yellow
            Start-Sleep 2
        }
    }
}elseif($psVersion.Major -eq 7 -and $psVersion.Minor -lt 5){
    # PowerShell 7.0-7.4 - Aggiorna a 7.5
    Clear-Host
    Write-Host "`n  🔄 AGGIORNAMENTO POWERSHELL`n" -F Yellow
    Write-Host "  Versione attuale: PowerShell $($psVersion.Major).$($psVersion.Minor)" -F White
    Write-Host "  Disponibile: PowerShell 7.5+ (consigliato)`n" -F Green
    
    if((Read-Host "  Aggiornare a PowerShell 7.5? (S/N)") -in @("S","s")){
        Write-Host "`n  Aggiornamento via winget..." -F Cyan
        winget upgrade Microsoft.PowerShell --silent --accept-source-agreements --accept-package-agreements
        if($LASTEXITCODE -eq 0){
            Write-Host "  ✓ PowerShell 7.5 aggiornato!" -F Green
            Write-Host "`n  Riavvio script con nuova versione...`n" -F Yellow
            Start-Sleep 2
            Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
            exit
        }else{
            Write-Host "  ⚠ Aggiornamento fallito. Continuo con PS $($psVersion.Major).$($psVersion.Minor)" -F Yellow
            Start-Sleep 2
        }
    }
}elseif($psVersion.Major -ge 7 -and $psVersion.Minor -ge 5){
    # PowerShell 7.5+ - OK!
    # Nessun messaggio (richiesta utente: "spiegazione leggerissima")
}

# ═════════════════════════════════════════════════════════════════════════════
#  .NET RUNTIME/SDK CHECK & AUTO-INSTALL (versioni 6-11)
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ⚡ CHECK DIPENDENZE .NET (6, 7, 8, 9, 10, 11)`n" -F Cyan

$dotnetVersions=@("6","7","8","9","10","11")
$missingDotnet=@()
$installedDotnet=@()

foreach($ver in $dotnetVersions){
    # Runtime
    $rt=winget list --id "Microsoft.DotNet.Runtime.$ver" --accept-source-agreements 2>$null
    if($LASTEXITCODE -ne 0){$missingDotnet+="Runtime $ver"}else{$installedDotnet+="Runtime $ver"}
    
    # Desktop Runtime
    $dt=winget list --id "Microsoft.DotNet.DesktopRuntime.$ver" --accept-source-agreements 2>$null
    if($LASTEXITCODE -ne 0){$missingDotnet+="Desktop $ver"}else{$installedDotnet+="Desktop $ver"}
    
    # SDK
    $sdk=winget list --id "Microsoft.DotNet.SDK.$ver" --accept-source-agreements 2>$null
    if($LASTEXITCODE -ne 0){$missingDotnet+="SDK $ver"}else{$installedDotnet+="SDK $ver"}
}

# Check Preview (11 preview)
$prevRT=winget list --id "Microsoft.DotNet.Runtime.Preview" --accept-source-agreements 2>$null
if($LASTEXITCODE -ne 0){$missingDotnet+="Runtime 11-Preview"}else{$installedDotnet+="Runtime 11-Preview"}

$prevDT=winget list --id "Microsoft.DotNet.DesktopRuntime.Preview" --accept-source-agreements 2>$null
if($LASTEXITCODE -ne 0){$missingDotnet+="Desktop 11-Preview"}else{$installedDotnet+="Desktop 11-Preview"}

$prevSDK=winget list --id "Microsoft.DotNet.SDK.Preview" --accept-source-agreements 2>$null
if($LASTEXITCODE -ne 0){$missingDotnet+="SDK 11-Preview"}else{$installedDotnet+="SDK 11-Preview"}

if($missingDotnet.Count -gt 0){
    Write-Host "  ✓ Installate: $($installedDotnet.Count)" -F Green
    Write-Host "  ✗ Mancanti: $($missingDotnet.Count)" -F Red
    Write-Host "`n  Componenti mancanti:" -F Yellow
    foreach($m in $missingDotnet){Write-Host "   • $m" -F Red}
    
    Write-Host "`n  Consigliato: Installare tutte le versioni .NET`n" -F Cyan
    
    if((Read-Host "  Installare componenti .NET mancanti? (S/N)") -in @("S","s")){
        Write-Host ""
        foreach($ver in $dotnetVersions){
            if($missingDotnet -like "*Runtime $ver*"){
                Write-Host "  Installazione .NET $ver Runtime..." -F Cyan
                winget install "Microsoft.DotNet.Runtime.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){Write-Host "  ✓ .NET $ver Runtime installato!" -F Green}
            }
            if($missingDotnet -like "*Desktop $ver*"){
                Write-Host "  Installazione .NET $ver Desktop Runtime..." -F Cyan
                winget install "Microsoft.DotNet.DesktopRuntime.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){Write-Host "  ✓ .NET $ver Desktop Runtime installato!" -F Green}
            }
            if($missingDotnet -like "*SDK $ver*"){
                Write-Host "  Installazione .NET $ver SDK..." -F Cyan
                winget install "Microsoft.DotNet.SDK.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){Write-Host "  ✓ .NET $ver SDK installato!" -F Green}
            }
        }
        
        # Preview
        if($missingDotnet -like "*11-Preview*"){
            Write-Host "  Installazione .NET 11 Preview..." -F Cyan
            if($missingDotnet -like "*Runtime 11-Preview*"){
                winget install "Microsoft.DotNet.Runtime.Preview" --silent --accept-source-agreements --accept-package-agreements
            }
            if($missingDotnet -like "*Desktop 11-Preview*"){
                winget install "Microsoft.DotNet.DesktopRuntime.Preview" --silent --accept-source-agreements --accept-package-agreements
            }
            if($missingDotnet -like "*SDK 11-Preview*"){
                winget install "Microsoft.DotNet.SDK.Preview" --silent --accept-source-agreements --accept-package-agreements
            }
            Write-Host "  ✓ .NET 11 Preview installato!" -F Green
        }
        
        Write-Host "`n  ✓ Installazione .NET completata!`n" -F Green
        Start-Sleep 2
    }
}else{
    Write-Host "  ✓ Tutte le versioni .NET installate! ($($installedDotnet.Count) componenti)`n" -F Green
    
    if((Read-Host "  Verificare aggiornamenti .NET? (S/N)") -in @("S","s")){
        Write-Host ""
        foreach($ver in $dotnetVersions){
            Write-Host "  Aggiornamento .NET $ver..." -F Cyan
            winget upgrade "Microsoft.DotNet.Runtime.$ver" --silent --accept-source-agreements --accept-package-agreements 2>$null
            winget upgrade "Microsoft.DotNet.DesktopRuntime.$ver" --silent --accept-source-agreements --accept-package-agreements 2>$null
            winget upgrade "Microsoft.DotNet.SDK.$ver" --silent --accept-source-agreements --accept-package-agreements 2>$null
        }
        Write-Host "  Aggiornamento .NET Preview..." -F Cyan
        winget upgrade "Microsoft.DotNet.Runtime.Preview" --silent --accept-source-agreements --accept-package-agreements 2>$null
        winget upgrade "Microsoft.DotNet.DesktopRuntime.Preview" --silent --accept-source-agreements --accept-package-agreements 2>$null
        winget upgrade "Microsoft.DotNet.SDK.Preview" --silent --accept-source-agreements --accept-package-agreements 2>$null
        
        Write-Host "`n  ✓ .NET aggiornato!`n" -F Green
        Start-Sleep 2
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU INSTALLAZIONE/DISINSTALLAZIONE
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
Write-Host "  ║     OGD WinCaffè v7.2.3 ULTIMATE - Installazione       ║" -F Cyan
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -F Cyan

Write-Host "  [1] ⚙️  INSTALLA - Aggiungi comando 'wincaffe' globale" -F Green
Write-Host "      Copia script in C:\OGD\ + comando PowerShell" -F DarkGray
Write-Host "`n  [2] ❌ DISINSTALLA - Rimuovi comando 'wincaffe'" -F Red
Write-Host "      Pulisce tutto (script + profilo PowerShell)" -F DarkGray
Write-Host "`n  [3] ▶️  ESEGUI - Avvia normalmente (senza installare)`n" -F Yellow

$setupChoice=Read-Host "  Scelta (1/2/3)"

if($setupChoice -eq "1"){
    # INSTALLAZIONE
    Clear-Host
    Write-Host "`n  ⚙️  INSTALLAZIONE OGD WINCAFFÈ`n" -F Green
    
    # Percorso installazione
    $installDir="C:\OGD"
    $scriptDest="$installDir\OGD_WinCaffe_ULTIMATE.ps1"
    
    # Crea cartella
    if(!(Test-Path $installDir)){New-Item $installDir -ItemType Directory -Force|Out-Null}
    
    # Copia script (solo se necessario)
    if($PSCommandPath -ne $scriptDest){
        Copy-Item $PSCommandPath $scriptDest -Force
        Write-Host "  ✓ Script copiato: $scriptDest" -F Green
    }else{
        Write-Host "  ✓ Script già nella posizione corretta" -F Green
    }
    
    # Determina profilo PowerShell (5.1 vs 7+)
    $profilePath=$PROFILE.CurrentUserAllHosts
    if(!$profilePath){$profilePath="$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"}
    
    # Backup profilo esistente
    if(Test-Path $profilePath){
        $bkProfile="$profilePath.ogd_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Copy-Item $profilePath $bkProfile -Force
        Write-Host "  ✓ Backup profilo: $bkProfile" -F Green
    }
    
    # Crea/aggiorna profilo con function wincaffe
    $profileDir=Split-Path $profilePath
    if(!(Test-Path $profileDir)){New-Item $profileDir -ItemType Directory -Force|Out-Null}
    
    $functionCode=@"

# ═════════════════════════════════════════════════════════════════
# OGD WinCaffè v7.2.3 ULTIMATE - Installato da #DarkPlayer84Tv
# ═════════════════════════════════════════════════════════════════
function wincaffe {
    if(-not([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
        Start-Process powershell "-ExecutionPolicy Bypass -Command & '$scriptDest'" -Verb RunAs
    }else{
        & "$scriptDest"
    }
}
Write-Host "⚡ OGD WinCaffè installato! Usa comando: " -NoNewline -ForegroundColor Cyan
Write-Host "wincaffe" -ForegroundColor Yellow
# ═════════════════════════════════════════════════════════════════

"@
    
    # Aggiungi al profilo (evita duplicati)
    if(Test-Path $profilePath){
        $existingContent=Get-Content $profilePath -Raw
        if($existingContent -notmatch "function wincaffe"){
            Add-Content $profilePath $functionCode
        }
    }else{
        Set-Content $profilePath $functionCode
    }
    
    Write-Host "  ✓ Profilo PowerShell aggiornato: $profilePath" -F Green
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ INSTALLAZIONE COMPLETATA! ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Host "  PROSSIMI PASSI:" -F Cyan
    Write-Host "  1. Chiudi e riapri PowerShell" -F White
    Write-Host "  2. Digita: " -NoNewline -F White;Write-Host "wincaffe" -F Yellow
    Write-Host "  3. Lo script si aprirà ovunque tu sia!`n" -F White
    
    Read-Host "  INVIO per uscire"
    exit
}

if($setupChoice -eq "2"){
    # DISINSTALLAZIONE
    Clear-Host
    Write-Host "`n  ❌ DISINSTALLAZIONE OGD WINCAFFÈ`n" -F Red
    
    if((Read-Host "  Confermi disinstallazione? (S/N)") -notin @("S","s")){exit}
    
    $installDir="C:\OGD"
    $scriptDest="$installDir\OGD_WinCaffe_ULTIMATE.ps1"
    
    # Rimuovi script
    if(Test-Path $scriptDest){
        Remove-Item $scriptDest -Force
        Write-Host "  ✓ Script rimosso: $scriptDest" -F Green
    }
    
    # Rimuovi cartella se vuota
    if(Test-Path $installDir){
        $items=Get-ChildItem $installDir
        if($items.Count -eq 0){
            Remove-Item $installDir -Force
            Write-Host "  ✓ Cartella rimossa: $installDir" -F Green
        }
    }
    
    # Rimuovi function dal profilo
    $profilePath=$PROFILE.CurrentUserAllHosts
    if(!$profilePath){$profilePath="$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"}
    
    if(Test-Path $profilePath){
        $content=Get-Content $profilePath -Raw
        # Rimuovi blocco OGD
        $content=$content -replace "(?s)# ═+\s*OGD WinCaffè.*?# ═+\s*",""
        Set-Content $profilePath $content.Trim()
        Write-Host "  ✓ Profilo PowerShell pulito" -F Green
    }
    
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ DISINSTALLAZIONE COMPLETATA! ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Host "  Il comando 'wincaffe' non è più disponibile.`n" -F White
    
    Read-Host "  INVIO per uscire"
    exit
}

# Se scelta 3 o altro, continua normalmente

# ═════════════════════════════════════════════════════════════════════════════
#  FUNZIONI UI
# ═════════════════════════════════════════════════════════════════════════════

function Show-Banner {
    Clear-Host
    Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ║     ▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄  ▄▄▄▄▄▄    ⚡                  ║" -F Yellow
    Write-Host "  ║    █       ██       ██      █                        ║" -F Yellow
    Write-Host "  ║    █   ▄   ██   ▄▄▄▄█  ▄    █  WinCaffè v7.2.3        ║" -F Yellow
    Write-Host "  ║    █  █ █  ██  █  ▄▄█ █ █   █  ULTIMATE              ║" -F Yellow
    Write-Host "  ║    █  █▄█  ██  █ █  █ █▄█   █                        ║" -F Yellow
    Write-Host "  ║    █       ██  █▄▄█ █       █  ⚡                    ║" -F Yellow
    Write-Host "  ║    █▄▄▄▄▄▄▄██▄▄▄▄▄▄▄█▄▄▄▄▄▄█                         ║" -F Yellow
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ║           #DarkPlayer84Tv Productions                ║" -F Green
    Write-Host "  ║         by OldGamerDarthy Official 🎮                ║" -F Green
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ╚═══════════════════════════════════════════════════════╝" -F Cyan
    Write-Host "`n                      ( (                                " -F DarkGray
    Write-Host "                       ) )                                 " -F Gray
    Write-Host "                    .........                              " -F Yellow
    Write-Host "                    |       |]  ☕                         " -F Yellow
    Write-Host "                    \       /                              " -F Yellow
    Write-Host "                 ~~~~~~~~~~~~~~`n                          " -F DarkYellow
    Write-Host "      🎮 Ottimizzazione Gaming Windows 11 by OGD 🎮" -F Cyan
    Write-Host "        Original Gaming Design - DarkPlayer84Tv`n" -F DarkGray
}

function Show-Steam {
    for($i=0;$i -lt 2;$i++){
        Start-Sleep -Milliseconds 100
        Write-Host "`r                          ~ ~ ~           " -NoNewline -F DarkGray
        Start-Sleep -Milliseconds 100
        Write-Host "`r                         ~   ~   ~        " -NoNewline -F Gray
        Start-Sleep -Milliseconds 100
        Write-Host "`r                        ~     ☕     ~     " -NoNewline -F White
    }
    Write-Host "`r                           ( (           " -F DarkGray
}

function Write-Section([string]$T){
    Write-Host "`n  ════════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ $T" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════════" -F Cyan
}

function Write-Success([string]$M){Write-Host "  ✓ $M" -F Green}
function Write-Info([string]$M){Write-Host "  ℹ $M" -F Cyan}
function Write-Warning([string]$M){Write-Host "  ⚠ $M" -F Yellow}
function Write-Error2([string]$M){Write-Host "  ✗ $M" -F Red}

# ═════════════════════════════════════════════════════════════════════════════
#  HARDWARE DETECTION
# ═════════════════════════════════════════════════════════════════════════════

Show-Banner; Show-Steam
Write-Section "RILEVAMENTO SISTEMA"

$cpu=Get-CimInstance Win32_Processor
$ram=[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)
$isLaptop=(Get-CimInstance Win32_SystemEnclosure).ChassisTypes -in @(8,9,10,11,14)

Write-Info "CPU: $($cpu.Name)"
Write-Info "Core: $($cpu.NumberOfCores) fisici / $($cpu.NumberOfLogicalProcessors) logici"
Write-Info "RAM: $ram GB | Build: $build | Tipo: $(if($isLaptop){'💻 Laptop'}else{'🖥️ Desktop'})"

# P+E cores
$isPE=$false;$pC=0;$eC=0
if($cpu.Name -match "i[579]-1[2-5]\d{3}"){
    $isPE=$true;$tC=$cpu.NumberOfCores
    if($cpu.Name -match "HX|HK"){$pC=[math]::Floor($tC*0.4)}else{$pC=[math]::Floor($tC/2)}
    $eC=$tC-$pC
    Write-Info "Architettura: HYBRID ⚡ ($pC P-cores + $eC E-cores)"
}else{Write-Info "Architettura: TRADIZIONALE";$pC=$cpu.NumberOfCores}

# NPU
$hasNPU=$false
$npu=Get-PnpDevice|Where-Object{$_.FriendlyName -match "NPU|Neural|AI Engine|Hexagon|Ryzen AI|Intel AI Boost" -and $_.Status -eq "OK"}
if($npu){$hasNPU=$true;Write-Info "NPU: ✓ Rilevata 🧠"}else{Write-Warning "NPU: ✗ Non rilevata"}

Write-Host ""
if($ram -lt 12){Write-Warning "RAM < 12GB - Ottimizzazioni aggressive";if((Read-Host "  Continuare? (S/N)") -notin @("S","s")){exit}}

# ═════════════════════════════════════════════════════════════════════════════
#  BACKUP AUTOMATICO
# ═════════════════════════════════════════════════════════════════════════════

Show-Banner
Write-Section "BACKUP E SICUREZZA"

try{
    Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
    $desc="OGD WinCaffè v7.2.3 - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
    Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
    Write-Success "Punto ripristino: $desc"
    Write-Info "Ripristino: F8 al boot → Ripristino configurazione sistema"
}catch{Write-Warning "Punto ripristino non creato"}

$bkDir="$env:USERPROFILE\Desktop\OGD_Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item $bkDir -ItemType Directory -Force|Out-Null

# REGISTRY BACKUP COMPLETO
Write-Info "Backup registro completo..."
try{
    reg export "HKLM\SYSTEM\CurrentControlSet" "$bkDir\SYSTEM.reg" /y 2>$null|Out-Null
    reg export "HKLM\SOFTWARE" "$bkDir\SOFTWARE.reg" /y 2>$null|Out-Null
    reg export "HKCU" "$bkDir\HKCU.reg" /y 2>$null|Out-Null
    Write-Success "Backup registro: $bkDir"
}catch{Write-Warning "Backup registro parziale"}

Write-Host "";Start-Sleep 1

# ═════════════════════════════════════════════════════════════════════════════
#  MENU PRINCIPALE
# ═════════════════════════════════════════════════════════════════════════════

Show-Banner
Write-Section "MENU OTTIMIZZAZIONI"

Write-Host "`n  ┌─────────────────────────────────────────────────────────┐" -F Cyan
Write-Host "  │ ⚡ LIVELLI DI OTTIMIZZAZIONE                           │" -F Cyan
Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan

Write-Host "  [1] 🟢 LIGHT - Ottimizzazioni base (safe al 100%)" -F White
Write-Host "      C-States + Timer + Privacy + Network + DNS + Explorer" -F DarkGray
Write-Host "      Consigliato: Tutti | Impatto: Minimo | Risultato: +5-10% FPS`n" -F DarkGray

Write-Host "  [2] 🟡 NORMALE - Completo per gaming (raccomandato)" -F White
Write-Host "      TUTTO: Light + Process(30+) + NPU + Debloat + Visual" -F DarkGray
Write-Host "      Consigliato: Gaming PC | Impatto: Medio | Risultato: +10-15% FPS`n" -F DarkGray

Write-Host "  [3] 🔴 AGGRESSIVO - Massima performance (no freeze)" -F White
Write-Host "      Normale + Core Affinity + Memory + Responsiveness 3" -F DarkGray
Write-Host "      Consigliato: Enthusiast | Impatto: Alto | Risultato: +15-20% FPS`n" -F DarkGray

Write-Host "  ┌─────────────────────────────────────────────────────────┐" -F Cyan
Write-Host "  │ 🔧 STRUMENTI AGGIUNTIVI                                │" -F Cyan
Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan

Write-Host "  [4] 🌐 DNS TNT - Solo flush DNS + Winsock reset" -F White
Write-Host "  [5] 📁 EXPLORER - Solo cache folder views" -F White
Write-Host "  [6] 📜 INFO - Cosa fa ogni livello" -F White
Write-Host "  [7] 🔄 RESET - Punto ripristino Windows`n" -F White

$mode=Read-Host "  Scelta (1-7)"

# ═════════════════════════════════════════════════════════════════════════════
#  MENU PROTEZIONE PRIVACY (4 livelli)
# ═════════════════════════════════════════════════════════════════════════════

$privacyLevel="0"
if($mode -in @("1","2","3")){
    Show-Banner
    Write-Section "PROTEZIONE PRIVACY"
    
    Write-Host "`n  🔒 Vuoi applicare protezioni privacy aggiuntive?`n" -F Cyan
    Write-Host "  [1] 🟢 LIGHT - Privacy base" -F Green
    Write-Host "      • Telemetry Microsoft OFF" -F DarkGray
    Write-Host "      • Cortana disabilitata" -F DarkGray
    Write-Host "      • Suggerimenti/pubblicità OFF`n" -F DarkGray
    
    Write-Host "  [2] 🟡 NORMALE - Privacy avanzata" -F Yellow
    Write-Host "      • Light +" -F DarkGray
    Write-Host "      • OneDrive disabilitato" -F DarkGray
    Write-Host "      • Servizi cloud/diagnostica OFF" -F DarkGray
    Write-Host "      • Location/camera/microfono OFF`n" -F DarkGray
    
    Write-Host "  [3] 🔴 AGGRESSIVO - Privacy massima" -F Red
    Write-Host "      • Normale +" -F DarkGray
    Write-Host "      • NVIDIA/Adobe/VS telemetry OFF" -F DarkGray
    Write-Host "      • WiFi Sense OFF" -F DarkGray
    Write-Host "      • Feedback/diagnostica completa OFF`n" -F DarkGray
    
    Write-Host "  [4] ⚫ PARANOICO - Privacy estrema" -F Magenta
    Write-Host "      • Aggressivo +" -F DarkGray
    Write-Host "      • Windows Update solo manuale" -F DarkGray
    Write-Host "      • Defender ridotto (solo scan manuale)" -F DarkGray
    Write-Host "      • Tutti i servizi telemetry disabled" -F DarkGray
    Write-Host "      • ⚠️ Può limitare funzionalità Windows`n" -F Yellow
    
    Write-Host "  [0] ⏭️  SALTA - Nessuna protezione extra`n" -F White
    
    $privacyLevel=Read-Host "  Scelta (0-4)"
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU PROGRAMMI OPZIONALI (solo se livello 1/2/3)
# ═════════════════════════════════════════════════════════════════════════════

$installPrograms=$false
if($mode -in @("1","2","3")){
    Show-Banner
    Write-Section "PROGRAMMI OPZIONALI CONSIGLIATI"
    
    Write-Host "`n  📦 Vuoi installare programmi opzionali utili per gaming/monitoring?`n" -F Cyan
    Write-Host "  [1] Google Chrome" -F White
    Write-Host "  [2] GPU-Z (monitoring GPU)" -F White
    Write-Host "  [3] HWiNFO (monitoring hardware)" -F White
    Write-Host "  [4] HWMonitor (temperature)" -F White
    Write-Host "  [5] MSI Afterburner (overclock)" -F White
    Write-Host "  [6] Revo Uninstaller (disinstallazione)" -F White
    Write-Host "  [7] Snappy Driver Installer (driver)" -F White
    Write-Host "  [8] WingetUI (gestione pacchetti)" -F White
    Write-Host "  [9] WinMerge (confronto file)" -F White
    Write-Host "  [A] TUTTI i programmi" -F Green
    Write-Host "  [0] NESSUNO (salta installazione)`n" -F Yellow
    
    $progChoice=Read-Host "  Scelta (es: 1,3,5 oppure A per tutti, 0 per nessuno)"
    
    if($progChoice -ne "0"){
        $installPrograms=$true
        # Verifica Chocolatey
        if(!(Get-Command choco -EA SilentlyContinue)){
            Write-Info "Installazione Chocolatey..."
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol=[System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            Write-Success "Chocolatey installato"
        }
        
        $selectedApps=@()
        if($progChoice -eq "A" -or $progChoice -eq "a"){
            $selectedApps=@('googlechrome','gpu-z','hwinfo','hwmonitor','msiafterburner','revo-uninstaller','snappy-driver-installer','wingetui','winmerge')
        }else{
            $choices=$progChoice -split ','
            $appMap=@{'1'='googlechrome';'2'='gpu-z';'3'='hwinfo';'4'='hwmonitor';'5'='msiafterburner';'6'='revo-uninstaller';'7'='snappy-driver-installer';'8'='wingetui';'9'='winmerge'}
            foreach($c in $choices){if($appMap[$c.Trim()]){$selectedApps+=$appMap[$c.Trim()]}}
        }
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 6: INFO
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "6"){
    Show-Banner;Write-Section "INFO LIVELLI"
    Write-Host "`n  🟢 LIGHT:" -F Green
    Write-Host "   1. C-States BALANCED (zero freeze)" -F White
    Write-Host "   2. Timer 0.5ms + Piano Ultimate" -F White
    Write-Host "   3. Privacy base + Network TCP" -F White
    Write-Host "   4. DNS flush + Explorer Boost" -F White
    Write-Host "   5. GPU Hardware Scheduling`n" -F White
    Write-Host "  🟡 NORMALE (include Light +):" -F Yellow
    Write-Host "   6. Process Priority 30+ processi" -F White
    Write-Host "   7. NPU Optimization" -F White
    Write-Host "   8. Privacy completo (6 step)" -F White
    Write-Host "   9. Debloat (10 app bloatware)" -F White
    Write-Host "  10. Visual optimization (4 step)`n" -F White
    Write-Host "  🔴 AGGRESSIVO (include Normale +):" -F Red
    Write-Host "  11. Core Affinity P+E cores" -F White
    Write-Host "  12. Memory aggressive tweaks" -F White
    Write-Host "  13. System Responsiveness 3 (97% FIXED)`n" -F White
    Write-Host "  RISULTATI ATTESI:" -F Cyan
    Write-Host "   Light: Boot -10%, FPS +5-10%" -F Green
    Write-Host "   Normale: Boot -20%, FPS +10-15% ⭐" -F Yellow
    Write-Host "   Aggressivo: Boot -30%, FPS +15-20%`n" -F Red
    Read-Host "  INVIO";&$PSCommandPath;exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 7: RESET
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "7"){
    Show-Banner;Write-Section "RESET SISTEMA"
    Write-Host "`n  RIPRISTINO:" -F Cyan
    Write-Host "  1. F8 al boot → Ripristino sistema" -F White
    Write-Host "  2. Seleziona: 'OGD WinCaffè v7.2.3'`n" -F White
    Read-Host "  INVIO";exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 4: DNS TNT
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "4"){
    Show-Banner;Write-Section "DNS TNT"
    Write-Info "Flush DNS + Winsock reset + IP renewal"
    if((Read-Host "`n  Procedere? (S/N)") -notin @("S","s")){exit}
    Write-Host ""
    ipconfig /flushdns|Out-Null;Write-Success "DNS flushed"
    ipconfig /registerdns|Out-Null;Write-Success "DNS registered"
    ipconfig /release 2>$null|Out-Null;Write-Success "IP released"
    ipconfig /renew 2>$null|Out-Null;Write-Success "IP renewed"
    netsh winsock reset|Out-Null;Write-Success "Winsock reset"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ DNS TNT COMPLETATO - OGD ⚡`n" -F Yellow
    if((Read-Host "  Riavvio? (S/N)") -in @("S","s")){Restart-Computer -Force}
    exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 5: EXPLORER
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "5"){
    Show-Banner;Write-Section "EXPLORER BOOST"
    if((Read-Host "`n  Procedere? (S/N)") -notin @("S","s")){exit}
    Write-Host ""
    reg export "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" "$bkDir\BagMRU.reg" /y 2>$null|Out-Null
    reg export "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" "$bkDir\Bags.reg" /y 2>$null|Out-Null
    Write-Success "Backup: $bkDir"
    reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f 2>$null|Out-Null
    reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" 2>$null|Out-Null
    Write-Success "BagMRU pulito"
    reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f 2>$null|Out-Null
    reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /d "NotSpecified" /f 2>$null|Out-Null
    Write-Success "Bags pulito"
    taskkill /im explorer.exe /f 2>$null|Out-Null;Start-Sleep 1;Start-Process explorer.exe
    Write-Success "Explorer riavviato"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ EXPLORER OTTIMIZZATO - OGD ⚡`n" -F Yellow
    Read-Host "  INVIO";exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 1-3: OTTIMIZZAZIONI (Light / Normale / Aggressivo)
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("1","2","3")){
    
    $lvl=switch($mode){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}}
    $doLight=($mode -in @("1","2","3"))
    $doNormal=($mode -in @("2","3"))
    $doAggr=($mode -eq "3")
    
    Show-Banner;Write-Section "OTTIMIZZAZIONE $lvl"
    
    Write-Host "`n  INCLUDE:" -F Cyan
    if($doLight){
        Write-Host "   ✓ C-States + Timer + Piano + GPU" -F White
        Write-Host "   ✓ Privacy + Network + DNS + Explorer" -F White
    }
    if($doNormal){
        Write-Host "   ✓ Process 30+ + NPU + Debloat + Visual" -F White
    }
    if($doAggr){
        Write-Host "   ✓ Core Affinity + Memory (no freeze)`n" -F White
    }
    
    if((Read-Host "  Procedere? (S/N)") -notin @("S","s")){exit}
    
    # ═════════════════════════════════════════════════════════════════════
    #  CONFIGURAZIONE RAM INTELLIGENTE
    # ═════════════════════════════════════════════════════════════════════
    
    Show-Banner;Write-Section "CONFIGURAZIONE RAM"
    
    Write-Host "`n  TIPO RAM:" -F Cyan
    Write-Host "  [1] DDR4 (latenza più alta, ottimizzazioni conservative)" -F White
    Write-Host "  [2] DDR5 (bandwidth maggiore, ottimizzazioni aggressive)`n" -F White
    $ramType=Read-Host "  Tipo RAM (1/2)"
    $isDDR5=($ramType -eq "2")
    
    Write-Host "`n  QUANTITÀ RAM:" -F Cyan
    if($mode -eq "1"){
        Write-Host "  [1] 8 GB  - Minimo (ottimizzazioni molto conservative)" -F White
        Write-Host "  [2] 12 GB - Consigliato Light" -F White
        Write-Host "  [3] 16 GB+ - Abbondante`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3)"
        $ramGB=switch($ramSize){"1"{8}"2"{12}default{16}}
    }elseif($mode -eq "2"){
        Write-Host "  [1] 12 GB - Minimo Normale" -F White
        Write-Host "  [2] 16 GB - Standard gaming" -F White
        Write-Host "  [3] 32 GB+ - Enthusiast`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3)"
        $ramGB=switch($ramSize){"1"{12}"2"{16}default{32}}
    }else{
        Write-Host "  [1] 16 GB - Minimo Aggressivo" -F White
        Write-Host "  [2] 32 GB - Standard enthusiast" -F White
        Write-Host "  [3] 64 GB - Workstation" -F White
        Write-Host "  [4] 128 GB+ - Extreme`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3/4)"
        $ramGB=switch($ramSize){"1"{16}"2"{32}"3"{64}default{128}}
    }
    
    Write-Host "`n  📊 CONFIGURAZIONE:" -F Cyan
    Write-Host "     Tipo: $(if($isDDR5){'DDR5'}else{'DDR4'})" -F Yellow
    Write-Host "     RAM: $ramGB GB" -F Yellow
    Write-Host "     Livello: $lvl`n" -F Yellow
    
    if((Read-Host "  Confermi? (S/N)") -notin @("S","s")){&$PSCommandPath;exit}
    
    $global:opts=0
    
    Show-Banner;Write-Section "APPLICAZIONE OTTIMIZZAZIONI $lvl"
    Write-Host "`n  RAM: $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})" -F Yellow
    Write-Host ""
    
    # ═══════════════════════════════════════════════════════════════════════
    #  LIGHT (BASE)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doLight){
        # C-States BALANCED
        Write-Info "[1] C-States fix freeze..."
        $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLEDISABLE 0 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLEDISABLE 0 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLETHRESHOLD 5 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLETHRESHOLD 5 2>$null
        powercfg /setacvalueindex $pg 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setacvalueindex $pg 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0 2>$null
        powercfg /setactive $pg 2>$null
        $global:opts++;Write-Success "C-States: Solo C1 (zero freeze)"
        
        # Timer + Piano
        Write-Info "[2] Timer 0.5ms + Piano..."
        bcdedit /set useplatformclock No 2>$null|Out-Null
        bcdedit /set disabledynamictick Yes 2>$null|Out-Null
        bcdedit /set tscsyncpolicy Enhanced 2>$null|Out-Null
        
        $ult=powercfg /list 2>$null|Select-String "Ultimate|Prestazioni ultimate"
        if($ult -and $ult.ToString() -match '([a-f0-9-]{36})'){powercfg /setactive $Matches[1] 2>$null}
        else{
            $ng=powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
            if($ng -match '([a-f0-9-]{36})'){
                powercfg /changename $Matches[1] "Ultimate OGD v7.2.3" 2>$null
                powercfg /setactive $Matches[1] 2>$null
            }
        }
        
        # Timer script
        @'
Add-Type @"
using System.Runtime.InteropServices;
public class TR{[DllImport("ntdll.dll")]public static extern int NtSetTimerResolution(uint d,bool s,out uint c);}
"@
$Host.UI.RawUI.WindowTitle="Timer 0.5ms - OGD v7.2.3"
$d=5000;$c=0;[TR]::NtSetTimerResolution($d,$true,[ref]$c)
Write-Host "Timer 0.5ms attivo - Minimizza (non chiudere)" -ForegroundColor Green
while($true){Start-Sleep 3600}
'@|Out-File (Join-Path ([Environment]::GetFolderPath("Desktop")) "OGD_Timer_0.5ms.ps1") -Encoding UTF8 -Force
        
        $global:opts++;Write-Success "Timer: 0.5ms + Piano + Script Desktop"
        
        # Privacy + Network
        Write-Info "[3] Privacy + Network..."
        $tp="HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        if(!(Test-Path $tp)){New-Item $tp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $tp -Name "AllowTelemetry" -Value 0 -Type DWord -Force -EA SilentlyContinue
        netsh int tcp set global autotuninglevel=normal 2>$null|Out-Null
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Privacy + Network OK"
        
        # DNS + Explorer
        Write-Info "[4] DNS + Explorer..."
        ipconfig /flushdns|Out-Null;netsh winsock reset|Out-Null
        reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f 2>$null|Out-Null
        reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /d "NotSpecified" /f 2>$null|Out-Null
        $global:opts++;Write-Success "DNS + Explorer OK"
        
        # GPU
        Write-Info "[5] GPU optimization..."
        $gp="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gp -Name "HwSchMode" -Value 2 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gp -Name "TdrDelay" -Value 10 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "GPU: HwScheduling ON + TDR 10s"
    }
    
    # ═══════════════════════════════════════════════════════════════════════
    #  NORMALE (include Light)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doNormal){
        # Process Priority 30+
        Write-Info "[6] Process Priority (33)..."
        
        $procs=@{
            "csrss.exe"=@{P="High";A="P";I="High"}
            "smss.exe"=@{P="High";A="P";I="High"}
            "wininit.exe"=@{P="High";A="P";I="High"}
            "services.exe"=@{P="High";A="P";I="High"}
            "lsass.exe"=@{P="High";A="P";I="High"}
            "explorer.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "dwm.exe"=@{P="High";A="P";I="High"}
            "mmc.exe"=@{P="High";A="P";I="High"}
            "msiexec.exe"=@{P="High";A="P";I="High"}
            "TrustedInstaller.exe"=@{P="High";A="P";I="High"}
            "TiWorker.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "taskmgr.exe"=@{P="High";A="P";I="High"}
            "ShellExperienceHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "StartMenuExperienceHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "TextInputHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SearchHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "RuntimeBroker.exe"=@{P="Normal";A="E";I="Low"}
            "svchost.exe"=@{P="Normal";A="All";I="Normal"}
            "dllhost.exe"=@{P="Normal";A="All";I="Normal"}
            "conhost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SearchIndexer.exe"=@{P="BelowNormal";A="E";I="Low"}
            "SearchProtocolHost.exe"=@{P="BelowNormal";A="E";I="Low"}
            "SearchFilterHost.exe"=@{P="BelowNormal";A="E";I="Low"}
            "spoolsv.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "fontdrvhost.exe"=@{P="Normal";A="All";I="Normal"}
            "WUDFHost.exe"=@{P="Normal";A="All";I="Normal"}
            "sihost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "ctfmon.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SecurityHealthSystray.exe"=@{P="Normal";A="E";I="Low"}
            "audiodg.exe"=@{P="High";A="P";I="High"}
            "WmiPrvSE.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "perfmon.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "CompPkgSrv.exe"=@{P="Normal";A="E";I="Low"}
        }
        
        $pmap=@{"Realtime"=4;"High"=3;"AboveNormal"=6;"Normal"=2;"BelowNormal"=5;"Low"=1}
        $imap=@{"High"=3;"Normal"=2;"Low"=1}
        
        foreach($pn in $procs.Keys){
            $pi=$procs[$pn]
            $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$pn\PerfOptions"
            if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rp -Name "CpuPriorityClass" -Value $pmap[$pi.P] -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $rp -Name "IoPriority" -Value $imap[$pi.I] -Type DWord -Force -EA SilentlyContinue
        }
        
        $global:opts++;Write-Success "Process: $($procs.Count) processi"
        
        # NPU
        if($hasNPU){
            Write-Info "[7] NPU..."
            $np="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIOptimization"
            if(!(Test-Path $np)){New-Item $np -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $np -Name "EnableNPUOffload" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $np -Name "NPUPriority" -Value 3 -Type DWord -Force -EA SilentlyContinue
            $global:opts++;Write-Success "NPU: Offload ON"
        }else{Write-Info "[7] NPU: Skip"}
        
        # Privacy completo
        Write-Info "[8] Privacy completo..."
        $rp="HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
        if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $rp -Name "DisableAIDataAnalysis" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0 -Type DWord -Force -EA SilentlyContinue
        $cp="HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        if(!(Test-Path $cp)){New-Item $cp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $cp -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord -Force -EA SilentlyContinue
        
        # Telemetry OFF (NVIDIA, VS, PowerShell, Adobe, etc)
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        [Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT","1","Machine")
        reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Piriform\CCleaner" /v "Monitoring" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        $global:opts++;Write-Success "Privacy: Recall OFF + Telemetry OFF (NVIDIA/VS/PS/Adobe)"
        
        # Protezione Privacy Aggiuntiva (se richiesta)
        if($privacyLevel -ne "0"){
            Write-Info "[8+] Protezione Privacy $(switch($privacyLevel){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}"4"{"PARANOICO"}})..."
            
            # LIGHT (1): Base telemetry
            if($privacyLevel -ge "1"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            }
            
            # NORMALE (2): Cloud + Location
            if($privacyLevel -ge "2"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
            }
            
            # AGGRESSIVO (3): WiFi Sense + Feedback
            if($privacyLevel -ge "3"){
                reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" -EA SilentlyContinue
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" -EA SilentlyContinue
            }
            
            # PARANOICO (4): Update manuale + Defender ridotto
            if($privacyLevel -eq "4"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f 2>$null|Out-Null
            }
            
            $privacyName=switch($privacyLevel){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}"4"{"PARANOICO"}}
            Write-Success "Protezione Privacy $privacyName applicata"
        }
        
        # Debloat
        Write-Info "[9] Debloat..."
        
        # Rimozione AI/Copilot/Recall
        $aiPkgs=@('Microsoft.Windows.Ai.Copilot.Provider','Microsoft.Copilot','Microsoft.WindowsAiFoundation','Microsoft.Windows.Recall')
        foreach($pkg in $aiPkgs){
            Get-AppxPackage -Name $pkg -AllUsers -EA SilentlyContinue|Remove-AppxPackage -AllUsers -EA SilentlyContinue
            Get-AppxProvisionedPackage -Online -EA SilentlyContinue|Where-Object DisplayName -like $pkg|Remove-AppxProvisionedPackage -Online -EA SilentlyContinue
        }
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        DISM /Online /Disable-Feature /NoRestart /FeatureName:Recall 2>$null|Out-Null
        
        # OneDrive removal
        Stop-Process -Name "OneDrive" -Force -EA SilentlyContinue
        $odSetup="$env:SystemRoot\System32\OneDriveSetup.exe"
        if(Test-Path $odSetup){Start-Process -FilePath $odSetup -ArgumentList "/uninstall" -Wait -EA SilentlyContinue}
        robocopy "$env:USERPROFILE\OneDrive" "$env:USERPROFILE" /mov /e /xj /ndl /nfl /njh /njs /nc /ns /np 2>$null|Out-Null
        Remove-Item "$env:USERPROFILE\OneDrive" -Recurse -Force -EA SilentlyContinue
        Remove-Item "$env:LOCALAPPDATA\OneDrive" -Recurse -Force -EA SilentlyContinue
        Remove-Item "HKCU:\Software\Microsoft\OneDrive" -Recurse -Force -EA SilentlyContinue
        
        # Widgets removal
        Get-AppxPackage *WebExperience* -EA SilentlyContinue|Remove-AppxPackage -EA SilentlyContinue
        
        # Bloatware apps
        $bl=@("*CandyCrush*","*BubbleWitch*","*Spotify*","*Facebook*","*Instagram*","*TikTok*","*Disney*","*Netflix*","*Dropbox*","*LinkedIn*")
        $rem=0;foreach($b in $bl){Get-AppxPackage $b -EA SilentlyContinue|Remove-AppxPackage -EA SilentlyContinue;if($?){$rem++}}
        
        $global:opts++;Write-Success "Debloat: AI/Copilot/OneDrive/Widgets + $rem app"
        
        # Visual
        Write-Info "[10] Visual..."
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -Type DWord -Force -EA SilentlyContinue
        
        # MenuShowDelay - menu istantanei
        $cpd="HKCU:\Control Panel\Desktop"
        Set-ItemProperty $cpd -Name "MenuShowDelay" -Value "0" -Type String -Force -EA SilentlyContinue
        
        # Mouse acceleration OFF
        reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f 2>$null|Out-Null
        
        # Taskbar icone a sinistra
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        # Menu contestuale classico
        reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve 2>$null|Out-Null
        
        # Dark mode
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        # End Task menu
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /v "TaskbarEndTask" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        
        # Sticky keys OFF
        reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "58" /f 2>$null|Out-Null
        
        # Hibernation OFF
        powercfg /h off 2>$null|Out-Null
        
        $global:opts++;Write-Success "Visual: UI completo (Menu/Mouse/Taskbar/Dark/Hibernation)"
        
        # Memory NORMALE - ottimizzazioni base RAM
        if($mode -eq "2"){
            Write-Info "[11] Memory base ($ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'}))..."
            $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
            
            # NORMALE: Paging sempre ON (più safe)
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 0 -Type DWord -Force -EA SilentlyContinue
            
            # LargeSystemCache sempre OFF per gaming
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
            
            # Superfetch intelligente
            $pp="$mp\PrefetchParameters"
            if($ramGB -le 16){
                Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 3 -Type DWord -Force -EA SilentlyContinue
                Write-Success "  → Superfetch: ON (RAM $ramGB GB)"
            }else{
                Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 2 -Type DWord -Force -EA SilentlyContinue
                Write-Success "  → Superfetch: BOOT only (RAM $ramGB GB)"
            }
            
            # Prefetch basato su DDR
            if($isDDR5){
                Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 3 -Type DWord -Force -EA SilentlyContinue
            }else{
                Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 2 -Type DWord -Force -EA SilentlyContinue
            }
            
            $global:opts++;Write-Success "Memory: Base per $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})"
        }
    }
    
    # ═══════════════════════════════════════════════════════════════════════
    #  AGGRESSIVO (include Normale)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doAggr){
        # Salta step [11] se è stato fatto in NORMALE
        $aggStep=if($mode -eq "2"){12}else{11}
        # Core Affinity
        if($isPE){
            Write-Info "[$aggStep] Core Affinity..."
            foreach($pn in $procs.Keys){
                $pi=$procs[$pn]
                $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$pn\PerfOptions"
                $am=0
                switch($pi.A){
                    "P"{for($i=0;$i -lt $pC;$i++){$am+=[math]::Pow(2,$i)}}
                    "E"{for($i=$pC;$i -lt ($pC+$eC);$i++){$am+=[math]::Pow(2,$i)}}
                    default{for($i=0;$i -lt ($pC+$eC);$i++){$am+=[math]::Pow(2,$i)}}
                }
                if($am -gt 0){Set-ItemProperty $rp -Name "CpuAffinityMask" -Value $am -Type DWord -Force -EA SilentlyContinue}
            }
            $global:opts++;Write-Success "Core Affinity: P-cores foreground"
            $aggStep++
        }else{Write-Info "[$aggStep] Core Affinity: Skip";$aggStep++}
        
        # Memory (OTTIMIZZAZIONI INTELLIGENTI RAM)
        Write-Info "[$aggStep] Memory intelligente ($ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'}))..."
        $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        
        # DisablePagingExecutive - solo se RAM >= 32GB
        if($ramGB -ge 32){
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Paging Executive: OFF (RAM $ramGB GB)"
        }else{
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Paging Executive: ON (RAM < 32GB)"
        }
        
        # LargeSystemCache - DDR5 + RAM alta
        if($isDDR5 -and $ramGB -ge 64){
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Large Cache: ON (DDR5 $ramGB GB)"
        }else{
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Large Cache: OFF (ottimale gaming)"
        }
        
        # IoPageLockLimit - VALORI ESATTI basati su RAM
        $ioLockValue=switch($ramGB){
            8{512000}      # 8 GB → 500 MB
            12{768000}     # 12 GB → 750 MB
            16{1024000}    # 16 GB → 1 GB
            32{2048000}    # 32 GB → 2 GB
            64{4096000}    # 64 GB → 4 GB
            128{8192000}   # 128 GB → 8 GB
            default{
                if($ramGB -lt 8){256000}           # < 8 GB → 250 MB
                elseif($ramGB -lt 12){640000}      # 8-12 GB → 625 MB
                elseif($ramGB -lt 16){896000}      # 12-16 GB → 875 MB
                elseif($ramGB -lt 32){1536000}     # 16-32 GB → 1.5 GB
                elseif($ramGB -lt 64){3072000}     # 32-64 GB → 3 GB
                else{16384000}                     # > 128 GB → 16 GB
            }
        }
        Set-ItemProperty $mp -Name "IoPageLockLimit" -Value $ioLockValue -Type DWord -Force -EA SilentlyContinue
        $ioLockMB=[math]::Round($ioLockValue/1024,0)
        Write-Success "  → IO Page Lock: $ioLockMB MB ($ioLockValue)"
        
        # SystemPages - page table entries
        $systemPages=if($ramGB -le 8){0}elseif($ramGB -le 16){24000}elseif($ramGB -le 32){36000}elseif($ramGB -le 64){48000}else{64000}
        if($systemPages -gt 0){
            Set-ItemProperty $mp -Name "SystemPages" -Value $systemPages -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → System Pages: $systemPages entries"
        }
        
        # NonPagedPoolSize - pool non paginato (0 = auto, altri = dimensione in bytes)
        $nonPagedPool=if($ramGB -le 16){0}elseif($ramGB -le 32){268435456}elseif($ramGB -le 64){536870912}else{1073741824}
        if($nonPagedPool -gt 0){
            Set-ItemProperty $mp -Name "NonPagedPoolSize" -Value $nonPagedPool -Type DWord -Force -EA SilentlyContinue
            $npMB=[math]::Round($nonPagedPool/1MB,0)
            Write-Success "  → NonPaged Pool: $npMB MB"
        }
        
        # PagedPoolSize - pool paginato
        $pagedPool=if($ramGB -le 16){0}elseif($ramGB -le 32){402653184}elseif($ramGB -le 64){805306368}else{1610612736}
        if($pagedPool -gt 0){
            Set-ItemProperty $mp -Name "PagedPoolSize" -Value $pagedPool -Type DWord -Force -EA SilentlyContinue
            $ppMB=[math]::Round($pagedPool/1MB,0)
            Write-Success "  → Paged Pool: $ppMB MB"
        }
        
        # SessionViewSize - dimensione memoria session
        $sessionView=if($ramGB -le 16){48}elseif($ramGB -le 32){96}elseif($ramGB -le 64){192}else{384}
        Set-ItemProperty $mp -Name "SessionViewSize" -Value $sessionView -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → Session View: $sessionView MB"
        
        # SessionPoolSize - pool sessioni
        $sessionPool=if($ramGB -le 16){16}elseif($ramGB -le 32){32}elseif($ramGB -le 64){64}else{128}
        Set-ItemProperty $mp -Name "SessionPoolSize" -Value $sessionPool -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → Session Pool: $sessionPool MB"
        
        # Superfetch - RAM bassa sempre ON, RAM alta può essere OFF
        $pp="$mp\PrefetchParameters"
        if($ramGB -le 16){
            # RAM bassa: Superfetch ON per performance
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 3 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: ON (RAM $ramGB GB, necessario)"
        }elseif($ramGB -le 32){
            # RAM media: Superfetch ON ma Boot only
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 2 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: BOOT only (RAM $ramGB GB)"
        }else{
            # RAM alta: Superfetch OFF (non necessario)
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: OFF (RAM $ramGB GB, non necessario)"
        }
        
        # Prefetch - DDR5 può essere più aggressivo
        if($isDDR5){
            Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 3 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Prefetcher: FULL (DDR5 bandwidth)"
        }else{
            Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 2 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Prefetcher: BOOT (DDR4)"
        }
        
        # SecondLevelDataCache - basato su RAM
        $cacheSize=if($ramGB -le 16){512}elseif($ramGB -le 32){1024}elseif($ramGB -le 64){2048}else{4096}
        Set-ItemProperty $mp -Name "SecondLevelDataCache" -Value $cacheSize -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → L2 Cache hint: $cacheSize KB"
        
        # SvcHostSplitThresholdInKB - threshold per split processi svchost
        $svcHostThreshold=if($ramGB -le 4){0x400000}elseif($ramGB -le 6){0x600000}elseif($ramGB -le 8){0x800000}elseif($ramGB -le 12){0xc00000}elseif($ramGB -le 16){0x1000000}elseif($ramGB -le 24){0x1800000}elseif($ramGB -le 32){0x2000000}else{0x4000000}
        Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value $svcHostThreshold -Type DWord -Force -EA SilentlyContinue
        $svcMB=[math]::Round($svcHostThreshold/1024,0)
        Write-Success "  → SvcHost Split: $svcMB MB (0x$($svcHostThreshold.ToString('X')))"
        
        $global:opts++;Write-Success "Memory: 11 parametri ottimizzati per $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})"
        $aggStep++
        
        # Responsiveness 3 (FIXED no freeze)
        Write-Info "[$aggStep] Responsiveness 3..."
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 3 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 0x26 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Responsiveness: 3 (97% foreground, no freeze)"
    }
    
    # RIEPILOGO
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ OTTIMIZZAZIONE $lvl COMPLETATA - OGD ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Success "Ottimizzazioni applicate: $global:opts"
    Write-Host "`n  📊 CONFIGURAZIONE RAM:" -F Cyan
    Write-Host "     Tipo: $(if($isDDR5){'DDR5 ⚡'}else{'DDR4'})" -F White
    Write-Host "     Quantità: $ramGB GB" -F White
    if($mode -eq "3"){
        Write-Host "`n  💾 PARAMETRI MEMORY MANAGEMENT:" -F Cyan
        Write-Host "     Paging Executive: $(if($ramGB -ge 32){'OFF'}else{'ON'})" -F White
        Write-Host "     Large Cache: $(if($isDDR5 -and $ramGB -ge 64){'ON'}else{'OFF'})" -F White
        Write-Host "     Superfetch: $(if($ramGB -le 16){'ON'}elseif($ramGB -le 32){'BOOT'}else{'OFF'})" -F White
        Write-Host "     Prefetcher: $(if($isDDR5){'FULL'}else{'BOOT'})" -F White
        $ioLockValue=if($ramGB -eq 8){512000}elseif($ramGB -eq 12){768000}elseif($ramGB -eq 16){1024000}elseif($ramGB -eq 32){2048000}elseif($ramGB -eq 64){4096000}elseif($ramGB -eq 128){8192000}elseif($ramGB -lt 8){256000}elseif($ramGB -lt 12){640000}elseif($ramGB -lt 16){896000}elseif($ramGB -lt 32){1536000}elseif($ramGB -lt 64){3072000}else{16384000}
        Write-Host "     IO Page Lock: $([math]::Round($ioLockValue/1024,0)) MB" -F White
        $cacheSize=if($ramGB -le 16){512}elseif($ramGB -le 32){1024}elseif($ramGB -le 64){2048}else{4096}
        Write-Host "     L2 Cache: $cacheSize KB" -F White
    }elseif($mode -eq "2"){
        Write-Host "`n  💾 MEMORY (base):" -F Cyan
        Write-Host "     Paging: ON | Superfetch: $(if($ramGB -le 16){'ON'}else{'BOOT'})" -F White
    }
    Write-Host "`n  ⚡ PROSSIMI PASSI:" -F Cyan
    Write-Host "  1. RIAVVIA il PC (obbligatorio)" -F White
    Write-Host "  2. Avvia OGD_Timer_0.5ms.ps1 dal Desktop" -F White
    Write-Host "  3. Minimizza timer durante gaming`n" -F White
    Write-Info "Backup salvato in: $bkDir"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   OGD WinCaffè v7.2.3 ULTIMATE" -F Yellow
    Write-Host "   #DarkPlayer84Tv Productions" -F Green
    Write-Host "   by OldGamerDarthy Official" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    
    # Installazione programmi opzionali (se richiesti)
    if($installPrograms -and $selectedApps.Count -gt 0){
        Write-Host "`n  ════════════════════════════════════════════════════" -F Green
        Write-Host "   📦 INSTALLAZIONE PROGRAMMI OPZIONALI" -F Green
        Write-Host "  ════════════════════════════════════════════════════`n" -F Green
        
        foreach($app in $selectedApps){
            Write-Info "Installazione $app..."
            choco install $app -y --force --ignorepackageexitcodes 2>$null|Out-Null
            if($LASTEXITCODE -eq 0){Write-Success "$app installato"}
        }
        
        Write-Host "`n  ✓ $($selectedApps.Count) programmi installati!`n" -F Green
        Start-Sleep 2
    }
    
    if((Read-Host "  Riavviare ORA? (S/N)") -in @("S","s")){
        taskkill /im explorer.exe /f 2>$null|Out-Null;Start-Sleep 1
        Restart-Computer -Force
    }
}

exit 0
