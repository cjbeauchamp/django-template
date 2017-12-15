function new_tab() {
  TAB_NAME=$1
  COMMAND=$2
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

new_tab "Redis" "source venv/bin/activate; redis-server;"
new_tab "Web" "source venv/bin/activate; heroku local web;"
new_tab "Worker" "source venv/bin/activate; heroku local worker;"
