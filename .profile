### rc files list ###
secrets_rc="$HOME/.secrets_rc"
zshrc="$HOME/.config/.zshrc"
rc_files=($zshrc $secrets_rc)


### source other rc files ###
function maybe_source_file {
  echo "might source $1"
  if [ -f $1 ]
  then
    . $1
    echo "sourced $1"
  else
    echo "did not source $1"
  fi
}

for file in $rc_files
do
  maybe_source_file $file
done


### password generation ###
alias gpw="openssl rand 12 | base64 | tr '-d' '\n' | tr '-d' '/' | pbcopy"


### easily open neovim ###
alias e="nvim"
alias en="nvim +NERDTree"


### responsible npm global install location ###
export PATH=~/.local/npm-global/bin:$PATH


### another thing ###

