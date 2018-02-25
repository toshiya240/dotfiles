function fish_prompt
    # 直前のコマンドの正否を退避
    set -l last_status $status
    # 空行を入れてプロンプトを目立たせる
    echo
    # 日時
    set_color yellow
    echo -n '['(date +"%Y-%m-%d %H:%M:%S")'] '
    # CWD
    if test $last_status -eq 0
        set_color green
    else
        set_color red
    end
    echo (prompt_pwd)
    set_color normal
    # git
    echo -n (__fish_git_prompt '%s ')
    # prefix
    echo -n '$ '
end
