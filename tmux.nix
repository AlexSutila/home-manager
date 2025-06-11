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

    # Minimalism
    set -g status-style bg=#${config.colorScheme.colors.base01},fg=#${config.colorScheme.colors.base0C},bright
    set -g status-left "#[bg=#${config.colorScheme.colors.base0A},fg=#${config.colorScheme.colors.base01}] #(ps -o comm= -t '#{pane_tty}' | tail -n 1 | cut -c1-6) #[bg=#${config.colorScheme.colors.base01},fg=#${config.colorScheme.colors.base0A}] "
    set -g status-right "#[bg=#${config.colorScheme.colors.base01},fg=#${config.colorScheme.colors.base0A},bright]#[bg=#${config.colorScheme.colors.base0A},fg=#${config.colorScheme.colors.base01},bright] #S "
    set -g window-status-format "•"
    set -g window-status-current-format "•"
    set -g window-status-current-style \
        "#{?window_zoomed_flag,fg=red,fg=cyan,bold}"
    set -g pane-active-border-style fg=white,bright
    set -g pane-border-style fg=white,bright

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

    # Huge quality of life hack, alt+n for window switching
    bind -n M-1 select-window -t :1
    bind -n M-2 select-window -t :2
    bind -n M-3 select-window -t :3
    bind -n M-4 select-window -t :4
    bind -n M-5 select-window -t :5
    bind -n M-6 select-window -t :6
    bind -n M-7 select-window -t :7
    bind -n M-8 select-window -t :8
    bind -n M-9 select-window -t :9

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
    bind-key g run-shell "bash ~/.local/bin/tmux_zoxide.sh"
    bind-key C run-shell "bash ~/.local/bin/tmux_remote.sh window"
    bind-key V run-shell "bash ~/.local/bin/tmux_remote.sh hori"
    bind-key S run-shell "bash ~/.local/bin/tmux_remote.sh vert"
    bind-key i neww bash -c "bash ~/.local/bin/istolethis.sh"

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
