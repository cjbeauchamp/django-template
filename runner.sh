# Run by calling `source runner.sh`

function new_tab() {
  TAB_NAME=$1
  COMMAND=$2
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "delay 2" \
    -e "do script \"$COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

new_tab "Redis" "redis-server;"
new_tab "Redis" "gulp watch;"
new_tab "Web" "source venv/bin/activate; heroku local web;"
new_tab "Worker" "source venv/bin/activate; heroku local worker;"

# get this tab set up for python activity
source venv/bin/activate