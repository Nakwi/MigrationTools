$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$migrationDir = Join-Path $scriptPath "MigrationTools"
$chromeDir = Join-Path $migrationDir "Chrome"
$firefoxDir = Join-Path $migrationDir "Firefox"
$edgeDir = Join-Path $migrationDir "Edge"
$fondEcranDir = Join-Path $migrationDir "Fond_Ecran"
$printersFile = Join-Path $migrationDir "Printers__NetworkDrives.txt"
$pstFile = Join-Path $migrationDir "OutlookPSTs.txt"

New-Item -ItemType Directory -Force -Path $chromeDir, $firefoxDir, $edgeDir, $fondEcranDir

# Créer le fichier uniquement s'il n'existe pas
if (-not (Test-Path $printersFile)) {
    New-Item -ItemType File -Path $printersFile
}

function Show-Menu {
    Clear-Host
    Write-Host "================================================="
    Write-Host "               MigrationTools v1.1               "
    Write-Host "                  By Corsyn Ryan                 "
    Write-Host "================================================="
    Write-Host "1 - Sauvegarde"
    Write-Host "2 - Restauration"
    Write-Host "================================================="
    $choice = Read-Host "Entrez votre choix"
    switch ($choice) {
        1 { Show-BackupMenu }
        2 { Show-RestoreMenu }
        default { Show-Menu }
    }
}

function Show-BackupMenu {
    Clear-Host
    Write-Host "================================================="
    Write-Host "               MigrationTools - Sauvegarde       "
    Write-Host "================================================="
    Write-Host "1 - Copier les favoris Google Chrome"
    Write-Host "2 - Copier les favoris Mozilla Firefox"
    Write-Host "3 - Copier les favoris Microsoft Edge"
    Write-Host "4 - Copier tous les favoris"
    Write-Host "5 - Sauvegarder Imprimantes et Partages"
    Write-Host "6 - Sauvegarder le Fond d'écran"
    Write-Host "7 - Vérifier Archives Outlook (.pst)"
    Write-Host "8 - Tout sauvegarder"
    write-host "9 - Retour"
    Write-Host "================================================="
    $choix = Read-Host "Entrez votre choix"
    switch ($choix) {
        1 { Copy-ChromeFavourites; Pause; Show-BackupMenu }
        2 { Copy-FirefoxFavourites; Pause; Show-BackupMenu }
        3 { Copy-EdgeFavourites; Pause; Show-BackupMenu }
        4 { Copy-AllFavourites }
        5 { Save-PrintersAndShares; Pause; Show-BackupMenu }
        6 { Save-Wallpaper; Pause; Show-BackupMenu }
        7 { Check-OutlookPSTArchives; Pause; Show-BackupMenu }
        8 { Save-Everything }
        9 { Show-Menu }
        default { Show-BackupMenu }
    }
}

function Show-RestoreMenu {
    Clear-Host
    Write-Host "================================================="
    Write-Host "               MigrationTools - Restauration     "
    Write-Host "================================================="
    Write-Host "1 - Restaurer les favoris Google Chrome"
    Write-Host "2 - Restaurer les favoris Mozilla Firefox"
    Write-Host "3 - Restaurer les favoris Microsoft Edge"
    Write-Host "4 - Restaurer tous les favoris"
    Write-Host "5 - Retour"
    Write-Host "================================================="
    $choix = Read-Host "Entrez votre choix"
    switch ($choix) {
        1 { Restore-ChromeFavourites; Pause; Show-RestoreMenu }
        2 { Restore-FirefoxFavourites; Pause; Show-RestoreMenu }
        3 { Restore-EdgeFavourites; Pause; Show-RestoreMenu }
        4 { Restore-AllFavourites }
        5 { Show-Menu }
        default { Show-RestoreMenu }
    }
}

function Copy-ChromeFavourites {
    Write-Host "================================================="
    Write-Host "   Copier les favoris Google Chrome               "
    Write-Host "================================================="
    Copy-Item -Path "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" -Destination $chromeDir -Force
    Write-Host "   Copie réussie                                  "
    Write-Host "================================================="
}

function Copy-FirefoxFavourites {
    Write-Host "================================================="
    Write-Host "   Copier les favoris Mozilla Firefox             "
    Write-Host "================================================="
    $firefoxProfile = Get-ChildItem "$env:APPDATA\Mozilla\Firefox\Profiles" | Where-Object { $_.PSIsContainer -and $_.Name -match "\.default-release" } | Select-Object -First 1
    if ($firefoxProfile) {
        Copy-Item -Path "$env:APPDATA\Mozilla\Firefox\Profiles\$($firefoxProfile.Name)\places.sqlite" -Destination $firefoxDir -Force
        Write-Host "   Copie réussie                                  "
    } else {
        Write-Host "   Profil Firefox introuvable                     "
    }
    Write-Host "================================================="
}

function Copy-EdgeFavourites {
    Write-Host "================================================="
    Write-Host "   Copier les favoris Microsoft Edge              "
    Write-Host "================================================="
    Copy-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks" -Destination $edgeDir -Force
    Write-Host "   Copie réussie                                  "
    Write-Host "================================================="
}

function Copy-AllFavourites {
    Write-Host "================================================="
    Write-Host "   Copie de tous les favoris                      "
    Write-Host "================================================="
    Copy-ChromeFavourites
    Copy-FirefoxFavourites
    Copy-EdgeFavourites
    Write-Host "   Copie complète réussie                         "
    Write-Host "================================================="
    Pause
    Show-BackupMenu
}

function Save-PrintersAndShares {
    Write-Host "Sauvegarde des informations des imprimantes et des partages réseau en cours..."
    
    $outputFile = $printersFile
    
    $printers = Get-Printer | Select Name, DriverName, PortName, Shared, ShareName | Format-Table -AutoSize
    $printers | Out-String | Out-File -FilePath $outputFile -Append
    Write-Host "Les informations des imprimantes ont été sauvegardées dans '$outputFile'."
    
    $networkDrives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -like "\\*" }
    $networkDrives | Select Name, Root | Format-Table -AutoSize | Out-File -FilePath $outputFile -Append
    Write-Host "Les informations des lecteurs réseau mappés ont été sauvegardées dans '$outputFile'."
    
    $shares = Get-SmbShare | Select Name, Path, Description | Format-Table -AutoSize
    $shares | Out-String | Out-File -FilePath $outputFile -Append
    Write-Host "Les informations des partages réseau ont été sauvegardées dans '$outputFile'."
    
    Write-Host "================================================="
}

function Save-Wallpaper {
    Write-Host "Sauvegarde du fond d'écran en cours..."
    
    $wallpaperKey = "HKCU:\Control Panel\Desktop"
    $wallpaperPath = (Get-ItemProperty -Path $wallpaperKey).WallPaper
    
    if (Test-Path $wallpaperPath) {
        Copy-Item -Path $wallpaperPath -Destination $fondEcranDir -Force
        Write-Host "Le fond d'écran a été sauvegardé avec succès dans '$fondEcranDir'."
    } else {
        Write-Host "Aucun fond d'écran trouvé à sauvegarder."
    }
    
    Write-Host "================================================="
}

function Check-OutlookPSTArchives {
    Write-Host "Vérification des archives Outlook (.pst) en cours..."

    $pstPaths = @(
        "$env:USERPROFILE\Documents\Outlook Files",
        "$env:USERPROFILE\AppData\Local\Microsoft\Outlook",
        "C:\",
        "D:\",
        "E:\"
    )

    $pstFiles = @()
    foreach ($path in $pstPaths) {
        if (Test-Path $path) {
            $pstFiles += Get-ChildItem -Path $path -Filter *.pst -Recurse -ErrorAction SilentlyContinue
        }
    }

    if ($pstFiles.Count -gt 0) {
        $pstFiles | ForEach-Object {
            $pstInfo = "Fichier PST trouvé : $($_.FullName), Taille : $([math]::Round($_.Length / 1MB, 2)) MB"
            Write-Host $pstInfo
        }
    } else {
        Write-Host "Aucun fichier .pst trouvé."
    }

    Write-Host "================================================="
}

function Save-Everything {
    Copy-EdgeFavourites
    Copy-ChromeFavourites
    Copy-FirefoxFavourites
    Save-PrintersAndShares
    Save-Wallpaper
    Write-Host "Sauvegarde complète terminée."
    Pause
    Show-BackupMenu
}

function Restore-ChromeFavourites {
    Write-Host "================================================="
    Write-Host "   Restaurer les favoris Google Chrome            "
    Write-Host "================================================="
    Copy-Item -Path "$chromeDir\Bookmarks" -Destination "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default" -Force
    Write-Host "   Restauration réussie                           "
    Write-Host "================================================="
}

function Restore-FirefoxFavourites {
    Write-Host "================================================="
    Write-Host "   Restaurer les favoris Mozilla Firefox          "
    Write-Host "================================================="
    $firefoxProfile = Get-ChildItem "$env:APPDATA\Mozilla\Firefox\Profiles" | Where-Object { $_.PSIsContainer -and $_.Name -match "\.default-release" } | Select-Object -First 1
    if ($firefoxProfile) {
        Copy-Item -Path "$firefoxDir\*" -Destination "$env:APPDATA\Mozilla\Firefox\Profiles\$($firefoxProfile.Name)" -Force
        Write-Host "   Restauration réussie                           "
    } else {
        Write-Host "   Profil Firefox introuvable                     "
    }
    Write-Host "================================================="
}

function Restore-EdgeFavourites {
    Write-Host "================================================="
    Write-Host "   Restaurer les favoris Microsoft Edge           "
    Write-Host "================================================="
    Copy-Item -Path "$edgeDir\Bookmarks" -Destination "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default" -Force
    Write-Host "   Restauration réussie                           "
    Write-Host "================================================="
}

function Restore-AllFavourites {
    Write-Host "================================================="
    Write-Host "   Restauration de tous les favoris               "
    Write-Host "================================================="
    Restore-ChromeFavourites
    Restore-FirefoxFavourites
    Restore-EdgeFavourites
    Write-Host "   Restauration complète réussie                  "
    Write-Host "================================================="
    Pause
    Show-RestoreMenu
}

Show-Menu
