# ~/.dotfiles/wsl/.bashrc - Específico para WSL

# Configuração do PATH para interagir com o Windows
export PATH="$PATH:/mnt/c/Windows/System32"

# Alias para abrir arquivos no explorador do Windows
alias open='explorer.exe'

# Melhorar a integração do Git entre WSL e Windows
export GIT_EDITOR=nvim
git config --global core.autocrlf false

# Definir diretório de trabalho padrão ao abrir o terminal no WSL
cd ~

# Instalar pacotes no WSL automaticamente (caso necessário)
if command -v apt &>/dev/null; then
  sudo apt update && sudo apt upgrade -y
fi
