#!/usr/bin/env bash
if ! tmux has-session -t=Test; then
	# create a detached new session "Test"
	tmux new -s Test -d
	# split pane
	tmux split-window -v -t Test:1.1
	tmux split-window -h -t Test:1.2

	tmux send-keys -t Test:1.1 'vi 1.c' Enter
	tmux send-keys -t Test:1.2 'gcc 1.c'
	tmux send-keys -t Test:1.3 'htop' Enter
fi

tmux a -t=Test
