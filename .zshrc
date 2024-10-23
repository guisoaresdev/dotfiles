# .zshrc

# Configura o PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Variáveis de ambiente para editores
export EDITOR=nvim
export VISUAL=nvim

# Prompt customizado (usando Oh My Zsh se disponível)
if [ -n "$ZSH_VERSION" ]; then
  ZSH_THEME="agnoster"
  source $ZSH/oh-my-zsh.sh
fi

# Alias comuns
alias ll='ls -la'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias vi='nvim'

# Configurações de histórico
HISTSIZE=10000
SAVEHIST=20000
HISTFILE=~/.zsh_history

# Carregar plugins do Oh My Zsh (caso esteja usando)
plugins=(git)

# Autocompletar para Git
autoload -Uz compinit && compinit

# Ativar cores para ls e grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Carregar NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Carregar aliases personalizados (separados)
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

