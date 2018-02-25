# at login
if status is-login >/dev/null; and test -z "$TMUX"

    #
    # Editors
    #
    set -x EDITOR 'vim'
    set -x VISUAL 'vim'
    set -x PAGER 'less'

    #
    # Language
    #
    if test -z "$LANG"
        set -x LANG 'ja_JP.UTF-8'
    end

    #
    # Paths
    #
    for i in \
            /usr/local/{bin,sbin} \
            /usr/local/share/npm/bin \
            /Applications/MacVim.app/Contents/MacOS \
            $HOME/.cabal/bin \
            $HOME/bin
        if not contains $i $PATH
            if test -d $i
                set -x PATH $i $PATH
            end
        end
    end

    # Set the default Less options.
    # Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
    # Remove -X and -F (exit if the content fits on one screen) to enable it.
    set -x LESS '-F -g -i -M -R -S -w -X -z-4'

    #
    # Temporary Files
    #
    if not test -d "$TMPDIR"
        set -x TMPDIR "/tmp/$LOGNAME"
        mkdir -p -m 700 "$TMPDIR"
    end

    #
    # Homebrew
    #
    if test -f $HOME/secret/homebrew-conf.fish
        source $HOME/secret/homebrew-conf.fish
    end

end
