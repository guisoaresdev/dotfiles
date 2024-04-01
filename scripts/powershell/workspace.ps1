Write-Host "Which one:"
Write-Host "-> 1. Guilherme"
Write-Host "-> 2. Pedro"
Write-Host "-> 3. NVIM Config"
$userFolder = Read-Host "Enter the option"

if ($userFolder -eq 1) {
    Set-Location -Path "$env:USERPROFILE\Documents\Guilherme\Workspace"
}
elseif ($userFolder -eq 2) {
    Set-Location -Path "$env:USERPROFILE\Documents\Pedro"
}
else {
    Set-Location -Path "$env:LOCALAPPDATA\nvim"
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "The command failed with exit status $LASTEXITCODE"
    exit 1
}
