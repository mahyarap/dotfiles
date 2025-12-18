#
# Things that are OK for *all* fish invocations (interactive or not)
#

# Universal-ish defaults
set -Ux EDITOR vim
set -Ux PAGER less

# Add common paths (safe, no duplicates)
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin


#
# Interactive-only setup
#
if not status is-interactive
    exit
end

# Disable greeting
set -g fish_greeting  

# Create/refresh LS_COLORS from dircolors output
if type -q dircolors
    set -Ux LS_COLORS (dircolors -c | string match -rg "setenv LS_COLORS '([^']*)'")
end

# Emacs-style autosuggestion acceptance
bind ctrl-s accept-autosuggestion
bind alt-backspace backward-kill-word
