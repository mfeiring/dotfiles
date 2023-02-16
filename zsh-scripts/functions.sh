testing() {
    echo "hello"
}

code() {
  /usr/bin/env code ${1:-.}
}

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

# `kill -9 <<PID>>`"
# kill $(lsof -ti:PORT)