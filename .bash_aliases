alias ll='echo [COMMAND]: lsd -alF && lsd -alF'
alias code='echo [COMMAND]: codium && codium'
alias aria2c='echo [COMMAND]: "aria2c -c -s 16 -x 16 -k 1M -j 16" && aria2c -c -s 16 -x 16 -k 1M -j 16'
alias weather='echo [COMMAND]: curl wttr.in/?format=3 && curl wttr.in/?format=3'
# makes parent directories mentioned in the path argument
alias mkdir='echo [COMMAND]: mkdir -p && mkdir -p'

# Bind Alt+S to insert "sudo " at the beginning of the current command
bind -x '"\e\s": sudo_prefix'

# Bind Ctrl+L to clear the command line
bind -x '"\C-l": "clear;"'

# ls before cding into a dir
cd() {
    # if $1(first argument) is empty then emit cd command without argument(s)
    if [ -z "$1" ]; then
        # builtin command prevent infinte recursive loop
        builtin cd
        ll
    else
        builtin cd "$1"
        ll
    fi
}

# copy pwd output to clipboard
pwd() {
    echo 'command: pwd'
    builtin pwd
    builtin pwd | tr -d '\n' | xclip -selection clipboard
}

# Function to insert "sudo " at the beginning of the current command
sudo_prefix() {
    READLINE_LINE="sudo ${READLINE_LINE}"
    # In Bash, the READLINE_POINT variable represents the current position of the cursor within the command line. By modifying this variable, we can control the cursor's position.
    # READLINE_POINT + 5 adds 5 to the current value of READLINE_POINT. +5 means shift the cursor 5 characters right. Bcoz sudo consists of 4 chars and and the 5th character is space
    READLINE_POINT=$((READLINE_POINT + 5))
}
