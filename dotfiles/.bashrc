# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
. "$HOME/.cargo/env"

alias ll='ls -a'
alias yt='ytfzf'
alias ytm='ytfzf -m'
alias v='nvim'
alias ff='fastfetch'
alias os='cat /etc/os-release'
alias sessiontype='echo $XDG_SESSION_TYPE'
alias vel='nvim ~/veluna/src-tauri/packaging/postinst.sh'
alias agy='~/Antigravity-x64/antigravity'
alias dev='npm run tauri dev'
alias build='npm run tauri build'
alias cdv='cd ~/veluna/'
alias cdf='cd ~/fedora-configs/'
alias cdn='cd ~/networking-from-scratch/'
alias cdp='cd ~/python-notes/'
alias cdb='cd ~/bash-scripting-YSAP/'
alias dotv='cd ~/.config/nvim/'
alias vt='nvim ~/.config/tmux/tmux.conf'
alias dott='cd ~/.config/tmux/'
alias vk='nvim ~/.config/kitty/kitty.conf'
alias dotk='cd ~/.config/kitty/'

# always show ~$ irrespective of the directory
# PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]~\[\e[0m\]\$ '

# current folder only
# PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\W\[\e[0m\]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
