#!/usr/bin/env bash
set -o errexit
echo "Which one:"
echo "-> 1. Guilherme"
echo "-> 2. Pedro"
echo "-> 3. NVIM Config"
read userFolder

if [ "$userFolder" = 1 ]; then
	cd "$HOME/Documentos/Guilherme/Workspace"
elif [ "$userFolder" = 2 ]; then
	cd "$HOME/Documentos/Pedro"
else
	cd "$HOME/.config/nvim"
fi

if [ $? -ne 0 ]; then
	echo "The command failed with exit status $?"
	exit 1
fi
