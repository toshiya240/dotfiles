# set aliases
if status is-interactive
    alias eng='LANG=C LANGUAGE=C LC_ALL=C'
    if test (uname) = 'Darwin'
        alias ls 'ls -F -G'
    else
        alias ls 'ls -F --color=auto'
    end

    alias cp='cp -i'
    alias mv='mv -i'
    alias rm='rm -i'
end
