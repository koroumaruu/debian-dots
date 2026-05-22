### ----------ALIASES ---------- ###
#update
alias upd='sudo apt update && sudo apt upgrade'

#install stuff
alias ai='doas nala install'
alias ar='doas nala remove'
alias src='nala search'
alias ytd='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata --convert-thumbnails jpg --ppa "ThumbnailsConvertor+ffmpeg_o:-vf crop=ih:ih" -o "%(playlist_index)03d - %(title)s.%(ext)s"'

#quick edit
alias brc='nvim /home/korou/.bashrc'
alias mngrc='nvim ~/.dotfiles/config/mango'
alias music='cd ~/mp3s'
alias swy='nvim ~/.config/sway/config'
alias mng='nvim ~/.config/mango'
alias walls='cd ~/wallpapers'
alias sshpi='ssh korou@10.0.0.138'
alias nv='nvim'

#navigate files 
alias ..='cd ..'
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lsla='lsd -la'
alias r='ranger'
alias y='yazi'
# microfetch

#MISC 
alias ff='fastfetch'
alias mci='doas make clean install'
alias dwll='slstatus -s | dwl'
alias x='startx'
alias anime='cd ~/ani-cli && ./ani-cli'
alias t='kitten theme'
alias nc='ncmpcpp'

#poweroff
alias po='doas shutdown now'
alias rs='doas reboot'
### ---------- DONT TOUCH THIS, IDK IF ITLL BREAK ---------- ###
# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

EDITOR=nvim
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Created by `pipx` on 2026-05-20 22:55:47
export PATH="$PATH:/home/korou/.local/bin"
