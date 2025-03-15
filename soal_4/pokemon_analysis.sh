if [[ $# -eq 1 && ($1 == "-h" || $1 == "--help") ]]; then
    cat << "EOF"
    ██████╗  ██████╗ ██╗  ██╗███████╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗ ████║██╔═══██╗████╗  ██║
    ██████╔╝██║   ██║█████╔╝ █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
    ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
    ██║     ╚██████╔╝██║  ██╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ 
    Pokemon Usage Analysis Script - Gen 9 OverUsed
    ---------------------------------------------------------
    Usage:
    ./pokemon_analysis.sh <file.csv> --info          Show data summary
    ./pokemon_analysis.sh <file.csv> --sort <column> Sort Pokémon by column
    ./pokemon_analysis.sh <file.csv> --grep <name>   Search Pokémon by name
    ./pokemon_analysis.sh <file.csv> --filter <type> Filter Pokémon by type
    ./pokemon_analysis.sh -h | --help                Show this help screen
    ---------------------------------------------------------
EOF
    exit 0
fi

if [[ $# -lt 2 ]]; then
    echo "Error: Not enough arguments. Use -h or --help for usage details."
    exit 1
fi

FILE=$1
COMMAND=$2

if [[ ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' not found."
    exit 1
fi

display_info() {
    echo "🔥 Summary of $FILE 🔥"
    HIGHEST_USAGE=$(tail -n +2 "$FILE" | sort -t, -k2 -nr | head -1)
    POKEMON_USAGE=$(echo "$HIGHEST_USAGE" | cut -d, -f1)
    USAGE_PERCENT=$(echo "$HIGHEST_USAGE" | cut -d, -f2)
    HIGHEST_RAW_USAGE=$(tail -n +2 "$FILE" | sort -t, -k3 -nr | head -1)
    POKEMON_RAW=$(echo "$HIGHEST_RAW_USAGE" | cut -d, -f1)
    RAW_USAGE=$(echo "$HIGHEST_RAW_USAGE" | cut -d, -f3)
    echo "-------------------------------------------"
    echo "🚀 The most terrifying Pokémon in Gen 9 OU!"
    echo "👑 Highest Adjusted Usage: $POKEMON_USAGE with $USAGE_PERCENT%"
    echo "📊 Highest Raw Usage: $POKEMON_RAW with $RAW_USAGE uses"
    echo "-------------------------------------------"
}

sort_pokemon() {
    COLUMN=$3
    HEADER=$(head -1 "$FILE")
    SORTED_DATA=$(tail -n +2 "$FILE" | sort -t, -k1,1 -k2,2nr)
    case $COLUMN in
        usage) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k2 -nr);;
        raw) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k3 -nr);;
        name) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k1);;
        hp) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k6 -nr);;
        atk) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k7 -nr);;
        def) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k8 -nr);;
        spatk) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k9 -nr);;
        spdef) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k10 -nr);;
        speed) SORTED_DATA=$(echo "$SORTED_DATA" | sort -t, -k11 -nr);;
        *) echo "Error: Invalid sort column '$COLUMN'"; exit 1;;
    esac
    echo "$HEADER"
    echo "$SORTED_DATA"
}

search_pokemon() {
    NAME=$3
    HEADER=$(head -1 "$FILE")
    RESULT=$(awk -F, -v name="$NAME" 'NR==1 || tolower($1) ~ tolower(name)' "$FILE")
    if [[ -z "$(echo "$RESULT" | tail -n +2)" ]]; then
        echo "Error: No Pokémon named '$NAME' found."
        exit 1
    fi
    echo "$RESULT"
}

filter_pokemon() {
    TYPE=$3
    HEADER=$(head -1 "$FILE")
    RESULT=$(awk -F, -v type="$TYPE" 'NR==1 || tolower($4) == tolower(type) || tolower($5) == tolower(type)' "$FILE")
    if [[ -z "$(echo "$RESULT" | tail -n +2)" ]]; then
        echo "Error: No Pokémon of type '$TYPE' found."
        exit 1
    fi
    echo "$RESULT"
}

case $COMMAND in
    --info) display_info;;
    --sort) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No sort column provided"
            exit 1
        fi
        sort_pokemon "$@";;
    --grep) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No Pokémon name provided"
            exit 1
        fi
        search_pokemon "$@";;
    --filter) 
        if [[ $# -lt 3 ]]; then
            echo "Error: No filter type provided"
            exit 1
        fi
        filter_pokemon "$@";;
    *) echo "Error: Unknown command '$COMMAND'"; exit 1;;
esac
