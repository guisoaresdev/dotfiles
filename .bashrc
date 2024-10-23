# ~/.dotfiles/.bashrc - Geral

# Alias comuns
alias ll='ls -lah'
alias grep='grep --color=auto'

# Função para navegação rápida
function cdl() {
  cd "$1" && ls
}

# Prompt personalizado
PS1='\[\e[0;32m\]\u@\h \[\e[0;34m\]\w\[\e[0;32m\]$\[\e[0m\] '

# Configuração para Git
export GIT_EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

# Carregar configurações específicas do sistema
if [ -f ~/.dotfiles/linux/.bashrc ]; then
  source ~/.dotfiles/linux/.bashrc
elif [ -f ~/.dotfiles/wsl/.bashrc ]; then
  source ~/.dotfiles/wsl/.bashrc
fi
