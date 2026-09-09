function fish_title
    set -l host (hostname -s)

    set -l root (command git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$root"
        printf '%s · %s' $host (basename $root)
    else
        printf '%s' $host
    end
end
