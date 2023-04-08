#! /bin/sh

selected_project=$(ls $HOME/dev | dmenu -l 10)
tmuxinator=$(echo $HOME/.asdf/shims/tmuxinator)

if [ -n "$selected_project" ]
then
  working_dir=$HOME/dev/$selected_project
  has_tmuxinator=$($tmuxinator list | grep $selected_project)

  if [ -n "$has_tmuxinator" ]
  then
    i3-msg "workspace 3;exec alacritty -e zsh -c '$tmuxinator start $selected_project && zsh -i' &"
    sleep 4
  fi
  i3-msg "workspace 2;exec alacritty --working-directory=$working_dir -e $EDITOR .;"
fi
