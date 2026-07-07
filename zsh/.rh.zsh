export PATH="$HOME/.devcontainers/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/cruiz.kusman/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)

# Too many files lol
ulimit -n 4096

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
eval "$(fnm env --shell zsh)"
fi
