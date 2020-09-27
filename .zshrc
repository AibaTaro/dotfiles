
PROMPT='
%*
%F{green}[%~]%f
$ '

# Alias
alias relogin='exec $SHELL -l'

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit

# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='
%*
%F{green}[%~]%f
'\$vcs_info_msg_0_' $ '
precmd(){ vcs_info }


#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
