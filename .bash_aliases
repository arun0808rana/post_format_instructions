alias ll='echo lsd -alF && lsd -alF'
alias code='codium'

# makes parent directories mentioned in the path argument
alias mkdir='mkdir -p'

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
