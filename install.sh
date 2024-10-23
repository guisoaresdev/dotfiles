#!/bin/bash

# Detectar o sistema operacional
if grep -qEi "(Microsoft|WSL)" /proc/version &>/dev/null; then
  OS="WSL"
elif [ "$(uname)" == "Linux" ]; then
  OS="Linux"
elif [ "$(uname)" == "MINGW64_NT" ]; then
  OS="Windows"
else
  OS="Unknown"
fi

echo "Sistema operacional detectado: $OS"

# Funções de instalação para cada sistema operacional

setup_linux() {
  echo "Configurando ambiente para Linux..."

  # Instalar pacotes no Linux
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y neovim git curl zsh

  # Clonar ou atualizar dotfiles
  git clone https://github.com/seuusuario/dotfiles ~/.dotfiles || (cd ~/.dotfiles && git pull)

  # Criar links simbólicos para Linux
  ln -sf ~/.dotfiles/.bashrc ~/.bashrc
  ln -sf ~/.dotfiles/nvim ~/.config/nvim

  # Outras configurações específicas para Linux
  echo "Instalação concluída para Linux."
}

setup_wsl() {
  echo "Configurando ambiente para WSL..."

  # Instalar pacotes no WSL (similar ao Linux)
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y neovim git curl zsh

  # Clonar ou atualizar dotfiles
  git clone https://github.com/seuusuario/dotfiles ~/.dotfiles || (cd ~/.dotfiles && git pull)

  # Criar links simbólicos para WSL
  ln -sf ~/.dotfiles/.bashrc ~/.bashrc
  ln -sf ~/.dotfiles/nvim ~/.config/nvim

  # Outras configurações específicas para WSL
  echo "Instalação concluída para WSL."
}

setup_windows() {
  echo "Configurando ambiente para Windows..."

  # No Windows, você pode usar o scoop para instalar pacotes
  scoop install git neovim nodejs python

  # Clonar ou atualizar dotfiles
  git clone https://github.com/seuusuario/dotfiles $HOME/dotfiles || (cd $HOME/dotfiles && git pull)

  # Criar links simbólicos para Windows (com Git Bash, por exemplo)
  ln -sf $HOME/dotfiles/nvim $HOME/AppData/Local/nvim

  # Outras configurações específicas para Windows
  echo "Instalação concluída para Windows."
}

# Verifica o sistema e executa a função apropriada
if [ "$OS" == "Linux" ]; then
  setup_linux
elif [ "$OS" == "WSL" ]; then
  setup_wsl
elif [ "$OS" == "Windows" ]; then
  setup_windows
else
  echo "Sistema operacional não reconhecido. Por favor, configure manualmente."
fi
