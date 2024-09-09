GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

code() {
  /usr/bin/env code ${1:-.}
}

clone() {
  cd ~/development/nrk/

  if [[ "$1" == *"valg-"* ]]; then
    cd valg
  fi

  # repo=${1?Repo mangler}
  if [ -z "$1" ]; then
    echo Reponavn mangler
  else
    git clone git@github.com:nrkno/$1
  fi
}

mkcd() {
  last=$(eval "echo $1")
  if [ ! -n "$last" ]; then
    echo "Name plz"
  elif [ -d $last ]; then
    echo "\`$last' finnes allerede"
  else
    mkdir $@ && cd $last
  fi
}

rm() {
  if [ ! -z "$1" ] && [ $1 = "." ]; then
    dir=$(pwd -P)
    while true; do
      echo -en "Slett mappa ${BLUE}$dir${NC}? [y/n]: "
      if read -q "yn?"; then
        cd .. && rm -rf $dir
        echo -e "\n${BLUE}$dir${NC} sletta!"
        break
      else
        echo "\nDropper sletting"
        break
      fi
    done
  else
    command rm $@
  fi
}

# npm() {
#   if [ ! -z "$1" ] && [ $1 = "i" ]; then
#     echo "Sikker på at du vil installere nå?"
#   else
#     command npm $@
#   fi
# }

pid() {
  lsof -ti tcp:${1:-8090}
}

sanity-login() {
  cd ~/development/nrk/nrkno-sanity
  npx sanity login --sso nrk
  npx sanity debug --secrets
  ENV_LOCAL=`npx sanity debug --secrets | grep "Auth token" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' | sed "s/[^']*'\(.*\)'/SANITY_TOKEN=\1/"`
  1
  printf "$ENV_LOCAL\n" > .env/.env.local
}

fix-cal() {
  launchctl stop com.apple.CalendarAgent
  launchctl start com.apple.CalendarAgent
}

open-html() {
  node ~/dotfiles/zsh-scripts/open-html.mjs ${1:-'*'} ${2:-'firefox'}
}

zsudo() {
  sudo zsh -c "$functions[$1]" "$@"
}

dommedag() {
  echo "10.184.1.6 cosmos-dh-graving-int-prod-eno-1.mongo.cosmos.azure.com" >> /etc/hosts
  echo "10.184.1.7 cosmos-dh-graving-int-prod-eno-1-norwayeast.mongo.cosmos.azure.com" >> /etc/hosts
}



# `kill -9 <<PID>>`"
# kill $(lsof -ti:PORT)