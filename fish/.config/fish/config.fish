#
# Things that are OK for *all* fish invocations (interactive or not)
#

# Universal-ish defaults
if type -q nvim
    set -gx EDITOR nvim
else type -q vim
    set -gx EDITOR vim
end
set -gx PAGER less

# Add common paths (safe, no duplicates)
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
    set -gx LS_COLORS (dircolors -c | string match -rg "setenv LS_COLORS '([^']*)'")
end

bind alt-backspace backward-kill-word
bind \cr '
    if commandline --paging-mode >/dev/null
        commandline -f down-line
    else
        commandline -f history-pager
    end
'
