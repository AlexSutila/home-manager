{ pkgs, config, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
      ];
    extraConfig = ''

    # Apply automated colorscheme
    run-shell ~/.scripts/tmux_theme.sh

    # Misc sets
    set -g status-position top
    set -g visual-activity off
    set -g visual-bell off
    set -g visual-silence off
    setw -g monitor-activity off
    set -g bell-action none
    set -g renumber-windows on
    set-option -g detach-on-destroy off

    # Fix coloring
    set -as terminal-features ",xterm-256color:RGB"

    # Remap prefix key
    set -g prefix C-f

    # Remap arrows to vim binds
    set-window-option -g mode-keys vi
    bind-key -r -T prefix C-h resize-pane -L 2
    bind-key -r -T prefix C-j resize-pane -D 2
    bind-key -r -T prefix C-k resize-pane -U 2
    bind-key -r -T prefix C-l resize-pane -R 2
    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R

    # Start windows and panes at 1, not 0
    set -g base-index 1
    setw -g pane-base-index 1

    # I don't use the window switcher
    bind-key w choose-session

    # Easy switching back and fourth between two sessions
    unbind Space
    bind-key Space switch-client -l

    # Vim-like selection and copying
    bind-key -T copy-mode-vi 'v' send -X begin-selection
    bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel

    # Remaps to mimic vim like window splitting
    bind 'v' split-window -h -c "#{pane_current_path}"
    bind 's' split-window -v -c "#{pane_current_path}"
    unbind '"'
    unbind '%'

    # Some random workflow binds for navigation and remote work
    bind-key g run-shell "bash ~/.scripts/tmux_zoxide.sh"
    bind-key G run-shell "bash ~/.scripts/tmux_repo.sh"
    bind-key C run-shell "bash ~/.scripts/tmux_remote.sh window"
    bind-key V run-shell "bash ~/.scripts/tmux_remote.sh hori"
    bind-key S run-shell "bash ~/.scripts/tmux_remote.sh vert"
    bind-key i neww bash -c "bash ~/.scripts/istolethis.sh"

    # For remote work
    bind -T root F12 set prefix None \;\
        set key-table off \;\
        set -g status off
    bind -T off F12 set -u prefix \;\
        set -u key-table \;\
        set -g status on
    '';
  };
}
