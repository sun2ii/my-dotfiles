export PATH="$HOME/Documents/journal/bin:$PATH"

alias n="vim" 
alias c="clear"
alias cx="exit"
alias x="exit"
alias l="ls --color"
alias ll="ls -a --color"

alias play="claude"
alias nd="killall; npm run dev & sleep 3 && open http://localhost:3000"
alias nrd="npm run dev"
alias nb="npm run build"
alias pwd="pwd | pbc"
alias rg="rg -i"
alias create="mkdir"
alias inbox='cd ~/Documents/inbox/; l'

alias V="vim ~/.vimrc"
alias B="vim ~/.zshrc"
alias S="source ~/.zshrc"

alias gce="git commit --allow-empty -m 'empty commit'"
alias gb="git branch"
alias gs="git status"
alias gc="git commit"
alias ga="git add ."
alias gp="git push origin main"
alias predeploy="npm run lint; npm run build"
alias killall='lsof -ti :3000 -ti :3001 -ti :8000 -ti :8080 -ti :5000 -ti :5173 -ti :4200 | xargs kill -9'

alias :="cd .."
alias ::="cd ../.."
alias :::="cd ../../.."
alias rmf="rm -rf "

alias pbc="pbcopy"
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias docs="cd ~/Documents"
alias chromext="cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions/"
alias tmuxhelp='cat ~/Documents/study/tmux/cheatsheet.md | less'

source ~/.promptrc 
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


md() {
  if [[ -z "$url" || "$url" == "null" ]]; then
    url=$(pbpaste | curl -L -X POST https://benbasuni.com/api/markdown-upload \
      -H "Content-Type: text/plain" \
      --data-binary @- 2>/dev/null | jq -r '.url')
  fi

  if [[ -n "$url" && "$url" != "null" ]]; then
    echo "$url" | pbcopy
    echo "✓ Opened: $url (URL copied to clipboard)"
    open "$url"
  else
    echo "❌ Upload failed. Is the server running?"
    echo "   Try: npm run dev (in benbasuni.com directory)"
  fi
  exit
}

