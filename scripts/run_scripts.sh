#!/bin/bash

# Verificar se o sistema operacional é Linux
if [[ "$(uname)" == "Linux" ]]; then
	# Executar o script Bash
	./scripts.sh
# Verificar se o sistema operacional é Windows
elif [[ "$(uname -o)" == "Msys" || "$(uname -o)" == "Cygwin" ]]; then
	# Executar o script PowerShell
	powershell.exe -ExecutionPolicy Bypass -File scripts.ps1
else
	echo "Sistema operacional não suportado."
	exit 1
fi
