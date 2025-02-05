#!/usr/bin/env bash

# ... Mostly, I changed it a little bit lol
topic_constraint="none"

while [[ "$#" -gt 0 ]];do
case $1 in
  l|lang) 
  topic_constraint="lang"
  shift;;
esac
done

topic=""
if [[ "$topic_constraint" == "lang" ]]; then
  topic=$(printf "go\nrust\nc" | fzf) 
  stty sane
else
  topic=$(curl -s cht.sh/:list | fzf)
  stty sane
fi

if [[ -z "$topic" ]]; then
  exit 0
fi

# sheet=$(curl -s cht.sh/$topic/:list | fzf --tmux)
read -p "Query: " sheet

if [[ -z "$sheet" ]]; then
  tmux neww bash -c "curl -s cht.sh/$topic?style=rrt | less -R"
  exit 0
fi

tmux neww bash -c "curl -s cht.sh/$topic/$sheet?style=rrt  | less -R"
