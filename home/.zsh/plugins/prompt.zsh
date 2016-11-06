# Load and execute the prompt theming system.
fpath=(
  ~/.zsh/prompt
  $fpath
)
autoload -Uz promptinit && promptinit
