CURRENT_DIRECTORY=$(pwd)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

cd ~/.oh-my-zsh/plugins 
git clone https://github.com/zsh-users/zsh-autosuggestions.git
echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

sed -i -e "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g" ~/.zshrc
sed -i -e "s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc

echo '

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search \# Up
bindkey "^[[B" down-line-or-beginning-search \# Down
bindkey "^[^M" self-insert-unmeta
bindkey "[C" forward-word
bindkey "[D" backward-word
bindkey "^[begin" beginning-of-line
bindkey "^[end" end-of-line
' >> ~/.zshrc

source ~/.zshrc

open "https://superuser.com/questions/349439/how-to-bind-command-key-in-zsh"

cd $CURRENT_DIRECTORY
