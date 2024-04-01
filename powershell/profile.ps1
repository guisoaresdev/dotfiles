# Definir a política de execução do PowerShell como RemoteSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Adicionar o diretório contendo seus scripts PowerShell ao Path do sistema
$scriptsPath = "C:\Users\gui_c\dotfiles\scripts\powershell"
if (-not (Test-Path Env:\Path)) {
    $null = New-Item Env:\Path -Value $scriptsPath
}
elseif ($env:Path -notlike "*$scriptsPath*") {
    $env:Path += ";$scriptsPath"
}
