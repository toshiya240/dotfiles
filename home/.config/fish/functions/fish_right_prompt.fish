function fish_right_prompt
    set -l ruby_version
    set -l python_version
    set -l node_version
    if type -q rbenv; and test -f .ruby-version
        set ruby_version (cat .ruby-version)
    end
    if type -q pyenv; and test -f .python-version
        set python_version (cat .python-version)
    end
    if type -q nodenv; and test -f .node-version
        set node_version (cat .node-version)
    end
    test -n "$ruby_version";   and echo -n " $ruby_version"
    test -n "$python_version"; and echo -n " $python_version"
    test -n "$node_version";   and echo -n " $node_version"
end

