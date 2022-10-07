# remap prefix from 'C-b' to 'C-Space'
unbind C-b
set-option -g prefix C-Space
bind-key C-Space send-prefix

# window navigation
unbind n
unbind p
bind -r C-h previous-window # select previous window
bind -r C-l next-window     # select next window
bind Tab last-window        # move to last active window

# window splitting 
bind-key | split-window -h -c '#{pane_current_path}'
bind-key - split-window -h -c '#{pane_current_path}'
bind-key = split-window -v -c '#{pane_current_path}'

# pane navigation
bind -r h select-pane -L  # move left
bind -r j select-pane -D  # move down
bind -r k select-pane -U  # move up
bind -r l select-pane -R  # move right
bind > swap-pane -D       # swap current pane with the next one
bind < swap-pane -U       # swap current pane with the previous one

# Allow mouse pane resizing
set -g mouse on

# Status bar
set-option -g status-style 'bg=#e1e2e7,fg=#3760bf'
set-option -g status-left "#[bg=#cbcbd0,fg=#717174] #S#[bg=#e1e2e7,fg=#cbcbd0]\uE0B4  "
set-option -g status-right "#[fg=#005f87]$USER@#h #[fg=#005f87]%l:%M %p"
set-option -g status-interval 60 # Default is 15.

# Inactive window label text
set-option -w -g window-status-style fg=#3760bf,dim

# Active window label text
set-option -w -g window-status-current-style fg=#e1e2e7,bg=#2e7de9,bright
set-option -g window-status-current-format "#[fg=#2e7de9,bg=#e1e2e7]\uE0B6#[fg=#e1e2e7,bg=#2e7de0,bright]#I:#W#[fg=#2e7de9,bg=#e1e2e7]\uE0B4"

# Message style
set-option -g message-style fg=#e9e9ed,bg=#b15c00

# Slightly more useful width in "main-vertical" layout; enough room for 3-digit
# line number gutter in Vim + 80 columns of text + 1 column breathing room
# (default looks to be about 79).
set-option -w -g main-pane-width 85

# Source tmux config
bind r source-file ~/dev/dotfiles/tmux \; display-message "Config reloaded..."

set-option -g history-limit 10000

# Start window and pane numbering at 1, (0 is too hard to reach).
set-option -g base-index 1
set-option -g pane-base-index 1

# Don't wait for an escape sequence after seeing C-Space.
set-option -s escape-time 0

# Needed as on tmux 1.9 and up (defaults to off).
set-option -g focus-events on

# But don't change tmux's own window titles.
set-option -w -g automatic-rename on

# Don't wrap searches; it's super confusing given tmux's reverse-ordering of
# position info in copy mode.
set-option -w -g wrap-search off

# Show bells in window titles.
set-option -g window-status-bell-style fg=#ffb964,bold,underscore

# Turn off distracting border highlight.
set-option -ga pane-active-border-style bg=default,fg=default

set-option -g default-terminal "xterm-256color"
