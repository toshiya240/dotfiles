if status is-interactive

    if test -f $HOME/.homesick/repos/homeshick/homeshick.fish
        source $HOME/.homesick/repos/homeshick/homeshick.fish
    end

    # export せず各インタラクティブシェルで定義する
    set -g fish_complete_path $HOME/.homesick/repos/homeshick/completions $fish_complete_path

end
