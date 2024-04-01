#!/usr/bin/env bash

# Set the scripts directory
scripts_dir="$HOME/bin"

# Nome do script atual
current_script="scripts.sh"

# Listar todos os scripts executáveis no diretório (excluindo o script atual)
script_list=("$scripts_dir"/*)
script_list=("${script_list[@]##*/}")               # Obter apenas os nomes dos scripts
script_list=("${script_list[@]//$current_script/}") # Remover o script atual
script_count=${#script_list[@]}

# Verificar se há scripts
if [ "$script_count" -eq 0 ]; then
	echo "Nenhum script encontrado em $scripts_dir (excluindo o script atual)."
	exit 1
fi

# Exibir o menu
echo "Selecione um script para executar:"
for ((i = 0; i < ${script_count}; i++)); do
	script_name="${script_list[$i]}"
	if [ -n "$script_name" ] && [ "$script_name" != "$current_script" ]; then
		echo "-> $i.$script_name"
	fi
done

# Ler a entrada do usuário
read -p "Digite o índice do script: " script_index

# Validar a entrada do usuário
if ! [[ "$script_index" =~ ^[0-9]+$ ]] || [ "$script_index" -ge "$script_count" ]; then
	echo "Entrada inválida. Por favor, digite um índice de script válido."
	exit 1
fi

# Executar o script selecionado
selected_script="${script_list[$script_index]}"
echo "Executando: $selected_script"
source "$scripts_dir/$selected_script"
