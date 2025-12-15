function fish_prompt
    set_color normal
    echo -n (prompt_pwd)
    echo -n (fish_vcs_prompt)
    set job_count (count (jobs))
    echo -n "[$job_count]"
    echo -n '> '
end
