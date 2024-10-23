# .bashrc

# Verifica se este arquivo já foi carregado
[ -n "$BASHRC_LOADED" ] && return
export BASHRC_LOADED=1

# Configurar o PATH (adiciona diretórios ao caminho de execução)
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Variáveis de ambiente para editores
export EDITOR=nvim
export VISUAL=nvim

# Prompt customizado (exibe diretório e cor verde)
PS1='\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[m\] $ '

# Alias comuns
alias ll='ls -la'        # Lista arquivos com detalhes
alias gs='git status'    # Alias para git status
alias ga='git add'       # Alias para git add
alias gc='git commit -m' # Alias para git commit
alias gp='git push'      # Alias para git push
alias vi='nvim'          # Usa nvim em vez de vi

# Ativa o auto-completar para o git
if [ -f /usr/share/bash-completion/completions/git ]; then
  . /usr/share/bash-completion/completions/git
fi

# Histórico com mais comandos e sem duplicados
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups

# Ativar cores para `ls` e `grep`
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Carregar NVM (gerenciador de versões do Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Carregar NVM

# Fontes de scripts adicionais
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
