function mkdircd
    if test (count $argv) -lt 1
        printf "mkdircd: missing directory operand\n" >&2
        return 1
    end

    command mkdir -p -- $argv[1]
    and cd -- $argv[1]
end
