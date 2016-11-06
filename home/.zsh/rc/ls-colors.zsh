#
# ls colors
#

# BSD ls
# The color designators are as follows:
#   a  black
#   b  red
#   c  green
#   d  brown
#   e  blue
#   f  magenta
#   g  cyan
#   h  light grey
#   A  bold black, usually shows up as dark grey
#   B  bold red
#   C  bold green
#   D  bold brown, usually shows up as yellow
#   E  bold blue
#   F  bold magenta
#   G  bold cyan
#   H  bold light grey; looks like bright white
#   x  default foreground or background
#
# The order of the attributes are as follows:
#   1.   directory
#   2.   symbolic link
#   3.   socket
#   4.   pipe
#   5.   executable
#   6.   block special
#   7.   character special
#   8.   executable with setuid bit set
#   9.   executable with setgid bit set
#   10.  directory writable to others, with sticky bit
#   11.  directory writable to others, without sticky bit
export LSCOLORS=gxFxcxdxBxegedxbxgxcxd

# GNU ls
export LS_COLORS='di=36:ln=01;35:so=32:pi=33:ex=01;31:bd=34;46:cd=34;43:su=41:sg=46:tw=42:ow=43'

