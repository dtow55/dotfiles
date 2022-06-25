# These override default open-file and memory limits I had to include during app setup
ulimit -n 25000
export NODE_OPTIONS=--max_old_space_size=100000

# Loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# Start rbenv in shell
eval "$(rbenv init -)"

# Add Python to PATH
export PATH=$PATH:$HOME/Library/Python/3.8/bin

#######################################
######## OhMyZsh ######################
#######################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/davidtowster/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias battery='ioreg -w0 -l | grep Capacity'
alias gs="git status"
alias gb='git branch'
alias ga.='git add .'
alias gcm='git checkout master'
alias gm='git commit -m'
alias gco='git checkout'
alias gp='git push'
alias gpu='git push --set-upstream origin `git branch --show-current`' # Push new branch
alias gpc='git push origin $(git rev-parse --abbrev-ref HEAD)' # "Git push current"
# - SO USEFUL: Open a PR in Chrome with your current branch. ("Git PR")
# Combine with `gpc` to push and make a PR in one step: `gpc && gpr`
alias gpr='/usr/bin/open -a "/Applications/Google Chrome.app" "https://github.com/karuna-health/$(basename `git rev-parse --show-toplevel`)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1"'
alias gpr2='/usr/bin/open -a "/Applications/Google Chrome.app" "https://github.com/commure/$(basename `git rev-parse --show-toplevel`)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1"'
# run Rubocop on staged changes only
alias rubo='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop'
alias sidekiqbofa='aptible config --app bofa-production | grep SIDEKIQ_PASSWORD'
# print Karuna production Sidekiq dashboard passwords
alias sidekiqnyse='aptible config --app nyse-production | grep SIDEKIQ_PASSWORD'
alias sidekiqfederalreserve='aptible config --app federalreserve-production | grep SIDEKIQ_PASSWORD'
alias sidekiqnasdaq='aptible config --app nasdaq-production | grep SIDEKIQ_PASSWORD'
alias sidekiqsba='aptible config --app sba-production | grep SIDEKIQ_PASSWORD'
alias assh='~/.bin/assh'
alias alogin='~/.bin/alogin'
