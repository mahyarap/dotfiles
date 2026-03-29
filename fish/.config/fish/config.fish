#
# Things that are OK for *all* fish invocations (interactive or not)
#

# Universal-ish defaults
if type -q nvim
    set -Ux EDITOR nvim
else type -q vim
    set -Ux EDITOR vim
end
set -Ux PAGER less

# Add common paths (safe, no duplicates)
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin


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
bind \cr '
    if commandline --paging-mode >/dev/null
        commandline -f down-line
    else
        commandline -f history-pager
    end
'
