clear

speak_to_me() {
    echo "Starting Speak to Me..."
    while true; do
        affirmation=$(curl -s https://www.affirmations.dev | jq -r '.affirmation')
        echo -e "\033[1;32m$affirmation\033[0m"
        sleep 1
    done
}


on_the_run() {
    echo "Starting On the Run..."
    sleep 1
    echo "Ready, set, go!"
    sleep 1

    TERM_WIDTH=$(tput cols)
    BAR_LENGTH=$((TERM_WIDTH - 12))

    echo -ne "["
    for ((i=0; i<=100; i++)); do
        PROGRESS=$((i * BAR_LENGTH / 100))
        BAR=$(printf "%-${PROGRESS}s" "#" | tr ' ' '#')

        printf "\r[%-*s] %3d%%" "$BAR_LENGTH" "$BAR" "$i"

        sleep $(awk -v min=0.1 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
    done
    echo -e "\nFinished!"
}

time_func() {
    echo "Starting Time..."
    while true; do
        clear
        echo -e "\033[1;34m$(date '+%A, %d %B %Y')\033[0m"
        echo -e "\033[1;32m$(date '+%H:%M:%S')\033[0m"
        sleep 1
    done
}

money() {
    echo "Starting Money..."
    sleep 1
    clear

    CURRENCY=("€" "£" "$" "¥" "₩" "₹" "₽" "₺" "₦" "฿")
    TERM_WIDTH=$(tput cols)
    TERM_HEIGHT=$(tput lines)

    while true; do
        clear
        for ((i=0; i<TERM_HEIGHT; i++)); do
            LINE=$(printf "%*s" "$TERM_WIDTH" "")

            for ((j=0; j<TERM_WIDTH; j++)); do
                if (( RANDOM % 30 == 0 )); then
                    SYMBOL="${CURRENCY[RANDOM % ${#CURRENCY[@]}]}"
                    LINE=$(echo "$LINE" | sed "s/./$SYMBOL/$((j+1))")
                fi
            done

            echo "$LINE"
        done
        sleep 0.1
    done
}

brain_damage() {
    echo "Starting Brain Damage..."
    sleep 1
    top
}
if [[ $# -eq 0 ]]; then
    echo "Usage: ./dsotm.sh --play=\"<Track>\""
    exit 1
fi

case "$1" in
    --play=*)
        TRACK="${1#*=}"
        ;;
    *)
        echo "Unknown option: $1"
        exit 1
        ;;
esac

case $TRACK in
    "Speak to Me")
        speak_to_me
        ;;
    "On the Run")
        on_the_run
        ;;
    "Time")
        time_func
        ;;
    "Money")
        money
        ;;
    "Brain Damage")
        brain_damage
        ;;
    *)
        echo "Track '$TRACK' not implemented yet."
        exit 1
        ;;
esac
