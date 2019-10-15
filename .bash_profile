
export -p PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

export -p PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export -p UNISONLOCALHOSTNAME=Jesses-MacBook-Air.local

export -p ANDROID_HOME=/usr/local/opt/android-sdk

#export -p PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export -p CPATH=/usr/local/include:$CPATH
export -p LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

source ~/Development/src/switch-src/_completion.sh

function openDash() {
    open "dash://$*"
}

alias dash=openDash

function doLaunch() {
    JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/" CLASSPATH="." ~/projects/c6m/resources/scripts/launch "$@"
}
alias launch=doLaunch

complete -C aws_completer aws

alias vi=mvim

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if [ -e ~/.bash_private ];
then
    source ~/.bash_private
fi
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="~/.local/bin:$PATH"

