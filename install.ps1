# GREASE ME UP! - installer for Windows 10/11 (64-bit).
# Run in PowerShell:
#   irm https://raw.githubusercontent.com/DiegomgWilokia/grease-me-up/main/install.ps1 | iex
# Downloads the latest published build, installs it in %LOCALAPPDATA%\GreaseMeUp (no admin rights needed) and puts a
# "GREASE ME UP!" shortcut on the Desktop. Run it again to update. Saved games live elsewhere
# (%USERPROFILE%\AppData\LocalLow) and are never touched.
& {
    $ErrorActionPreference = 'Stop'
    $ProgressPreference = 'SilentlyContinue'   # the progress bar makes Invoke-WebRequest many times slower
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    $repo = 'DiegomgWilokia/grease-me-up'
    $url = "https://github.com/$repo/releases/latest/download/GreaseMeUp-win64.zip"
    $dest = Join-Path $env:LOCALAPPDATA 'GreaseMeUp'
    $zip = Join-Path $env:TEMP 'GreaseMeUp-win64.zip'

    Write-Host ''
    Write-Host '  GREASE ME UP!  -  instalador' -ForegroundColor Yellow
    Write-Host ''
    if (-not [Environment]::Is64BitOperatingSystem) { Write-Host 'Hace falta Windows de 64 bits.' -ForegroundColor Red; return }

    # Updating while the game is open would fail on locked files.
    $running = Get-Process -Name GreaseMeUp -ErrorAction SilentlyContinue
    if ($running) { Write-Host 'Cerrando el juego abierto...'; $running | Stop-Process -Force; Start-Sleep -Seconds 1 }

    try {
        Write-Host 'Descargando la ultima version (unos 75 MB)...'
        Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
    }
    catch { Write-Host "No se pudo descargar: $($_.Exception.Message)" -ForegroundColor Red; return }

    Write-Host "Instalando en $dest ..."
    $staging = "$dest.new"
    if (Test-Path $staging) { Remove-Item $staging -Recurse -Force }
    Expand-Archive -Path $zip -DestinationPath $staging -Force
    Remove-Item $zip -Force
    $exeNew = Join-Path $staging 'GreaseMeUp.exe'
    if (-not (Test-Path $exeNew)) { Write-Host 'El paquete descargado no trae GreaseMeUp.exe. No se ha cambiado nada.' -ForegroundColor Red; Remove-Item $staging -Recurse -Force; return }
    # Swap only once the new copy is complete: a failed download never leaves you without a game.
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Move-Item $staging $dest
    Get-ChildItem $dest -Recurse -File | Unblock-File
    $exe = Join-Path $dest 'GreaseMeUp.exe'

    $desktop = [Environment]::GetFolderPath('Desktop')
    $lnk = Join-Path $desktop 'GREASE ME UP!.lnk'
    $shell = New-Object -ComObject WScript.Shell
    $s = $shell.CreateShortcut($lnk)
    $s.TargetPath = $exe
    $s.WorkingDirectory = $dest
    $s.IconLocation = "$exe,0"
    $s.Description = 'GREASE ME UP! - taller cooperativo'
    $s.Save()

    Write-Host ''
    Write-Host '  Listo. Tienes "GREASE ME UP!" en el Escritorio.' -ForegroundColor Green
    Write-Host '  Para actualizar, vuelve a pegar el mismo comando.'
    Write-Host ''
}
