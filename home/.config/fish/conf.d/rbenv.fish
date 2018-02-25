if status is-login >/dev/null

    #
    # NOTE: tmux 起動時もログイン扱いなので
    #       除外しないと PATH の要素が重複するが、
    #       function 定義は継承されないので
    #       やむなく PATH の要素を重複させておく。
    #

    if which rbenv >/dev/null ^&1
        rbenv init - | source
    end

end
