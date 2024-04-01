# Set the scripts directory
$scripts_dir = "$env:USERPROFILE\dotfiles\scripts\powershell"

# Nome do script atual
$current_script = "scripts.ps1"

# Listar todos os scripts executáveis no diretório (excluindo o script atual)
$script_list = Get-ChildItem -Path $scripts_dir -File | Where-Object { $_.Name -ne $current_script } | ForEach-Object { $_.Name }

# Verificar se há scripts
if ($script_list.Count -eq 0) {
    Write-Host "Nenhum script encontrado em $scripts_dir (excluindo o script atual)."
    exit 1
}

# Exibir o menu
Write-Host "Selecione um script para executar:"
for ($i = 0; $i -lt $script_list.Count; $i++) {
    $script_name = $script_list[$i]
    Write-Host "-> $i.$script_name"
}

# Ler a entrada do usuário
$script_index = Read-Host "Digite o índice do script"

# Validar a entrada do usuário
if (-not $script_index -or -not $script_index -match '^\d+$' -or $script_index -ge $script_list.Count) {
    Write-Host "Entrada inválida. Por favor, digite um índice de script válido."
    exit 1
}

# Executar o script selecionado
$selected_script = $script_list[$script_index]
Write-Host "Executando: $selected_script"
Invoke-Expression "$scripts_dir\$selected_script"
