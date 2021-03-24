export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

eval "$(rbenv init -)"

if [ -e ~/.last_venv ]; then
    workon `cat ~/.last_venv`
fi

# Starts up bash completion every time you open terminal
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Make terminal remember your last python virtunalenv and start it up when you open a new terminal
if [ -e ~/.last_venv ]; then
    workon `cat ~/.last_venv`
fi

# INSTALLED BY WILL
# Print out the original command when using an alias
function alias_wrapper() {
  echo "$1"
  $1
}

#################
# Git shortcuts #
#################

alias gs="git status"
alias gd="git diff"
alias gf="git fetch -a"
alias gb="git branch"
alias gm='git commit -m'
alias gmn='git commit -n -m'
alias ga.='git add .'
alias gma='git commit -am'
alias gpc='git push origin $(git rev-parse --abbrev-ref HEAD)' # "Git push current"
alias gpo='git pull origin $(git rev-parse --abbrev-ref HEAD)' # "Git pull origin"
alias gcm='git checkout master'
alias gc,='gcm' # a common typo
alias gcb="git checkout -b"
alias gst="git stash"
alias gsp="git stash pop"
alias ggb='git reset $(git rev-parse HEAD^1)' # "Git go back"
alias gap='git add -p'

# Common git commits
alias gfm="git commit -am 'fixes merge conflicts'"  # "Git fix merge"
alias gco="git commit -am 'code climate'"           # "Git code climate"
alias gft="git commit -am 'fixes tests'"            # "Git fix tests"
alias gac="gma 'address comments'"                  # "Git address comments"

# Git rebasing
alias grm="gcm && gpo && gc- && git rebase master"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gpcf="gpc --force"

# More complicated Git commands
# - Print your current branch ("git current branch")
function gcbr() {
  git branch | grep \* | cut -d ' ' -f2
}
# - Show the most recent non-master branch
function most_recent() {
  git recent | grep -v 'master' | grep -v $(gcbr) | head -n 1
}
# - Super useful: Inspired by "cd -", go back to your last non-master branch
function gc-() {
  git co `most_recent`;
}
# - Relies on https://github.com/paulirish/git-recent
function gr() {
  alias_wrapper 'git recent'
}
# - When you realize you've made changes on the wrong branch, type "gob <new-branch"
# and this will stash your changes, checkout a new branch off master, then pop those changes
# ("git other branch")
function gob() {
 echo "STASHING CHANGE..." && gst && echo "SWITCHING TO MASTER..." && gcm && echo "CREATING BRANCH $1" && gcb $1 && echo "POPPING CHANGES..." && gsp
}
# - SO USEFUL: Open a PR in Chrome with your current branch. ("Git PR")
# Combine with `gpc` to push and make a PR in one step: `gpc && gpr`
alias gpr='/usr/bin/open -a "/Applications/Google Chrome.app" "https://github.com/asktrim/$(basename `git rev-parse --show-toplevel`)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1"'


###################
# Rails shortcuts #
###################

alias rgm="rails g migration"
function rr() {
  alias_wrapper 'bundle exec rake routes'
}
# Type an extra 'r' instead of 'bundle exec' every time
alias rrake='bundle exec rake'
alias rrspec='bundle exec rspec'
function rc() {
  alias_wrapper 'rails console'
}
function rdm() {
  alias_wrapper 'bundle exec rake db:migrate'
}
function rdms() {
  alias_wrapper 'bundle exec rake db:migrate:status'
}
function rdr() {
  alias_wrapper 'bundle exec rake db:rollback'
}
function rdrs() {
  alias_wrapper "bundle exec rake db:migrate:down VERSION=$1"
}
function rgar() {
  alias_wrapper "rails generate active_admin:resource $1"
}
function rgs() {
  alias_wrapper "rails generate serializer $1"
}


#################
# Miscellaneous #
#################

# Edit this file
function subl_bash() {
  alias_wrapper 'subl ~/.bash_profile'
}
# Re-source this file
alias re-source='. ~/.bash_profile'

# Personal favorite: If you type a command and the shell says you don't have permission,
#  type "fuck" to retry it with sudo
alias fuck='sudo $(history -p \!\!)'

# Switch to your most common working directory (update to your own directory)
function work() {
  alias_wrapper 'cd ~/Development/trimanalytics'
}

# To start foreman
function start_server() {
  alias_wrapper 'foreman start -f procfile.hot'
}
alias start_static_server='foreman start -f procfile.static'

# Type `whatport 3500` to see what process is on that port
function whatport() {
  alias_wrapper "lsof -i tcp:$1 "
}

# Use the `.sublime-project` config file if present
alias 'subl.'='subl *.sublime-project'

alias whatisip='curl ipecho.net/plain ; echo'

# NOTE: added by Nick pairing with David on 2018-10-11
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup virtualenv home
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

export NVM_DIR="/Users/davidjtowster/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
