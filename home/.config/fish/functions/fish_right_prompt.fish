function fish_right_prompt
    set -l ruby_version
    set -l python_version
    if type rbenv >/dev/null ^&1
        if test -f .ruby-version
            set ruby_version (cat .ruby-version)
        end
    end
    if type pyenv >/dev/null ^&1
        if test -f .python-version
            set python_version (cat .python-version)
        end
    end
    test -n "$ruby_version"; and echo -n " $ruby_version"
    test -n "$python_version"; and echo -n " $python_version"
end

