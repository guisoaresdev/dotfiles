#!/bin/bash

# Function to check if GitHub credentials are configured
check_github_credentials() {
	git credential-cache exit # Este comando apenas serve para verificar se as credenciais estão configuradas
}

# Function to configure Git
configure_git() {
	# Verificar se está logado no GitHub
	if ! git config --get-regexp '^remote\.origin\.url' | grep -q '^remote\.origin\.url.*github\.com'; then
		# Pedir informações de autenticação
		read -p "Digite seu nome de usuário do GitHub: " github_username
		read -s -p "Digite sua senha do GitHub (será ocultada): " github_password
		echo # Nova linha após a leitura da senha

		# Configurar as credenciais
		git config --global credential.helper 'store --file ~/.git-credentials'
		echo "https://$github_username:$github_password@github.com" >~/.git-credentials
	fi

	echo "Configuração do Git concluída."
}

# Function to initialize a Git repository
initialize_repository() {
	read -p "Enter the repository name: " repo_name

	# Initialize Git repository
	git init "$repo_name"
	cd "$repo_name"

	# Adicionar um arquivo de exemplo
	echo "Hello, GitHub!" >README.md
	git add README.md
	git commit -m "Commit inicial"

	echo "Repositório inicializado com sucesso."
}

# Check if GitHub credentials are configured
if check_github_credentials; then
	echo "Você está logado no GitHub."
	initialize_repository
else
	echo "Você não está logado no GitHub. Por favor, faça login usando 'git login' ou configure as credenciais."
	configure_git
fi
