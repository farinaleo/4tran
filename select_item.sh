select_item_f() {
    if [ ! -d "../srcs" ]; then
        echo -e "\e[31mThe directory ../srcs is missing.\e[0m" >&1
        exit 1
    fi

    items=()
    while IFS= read -r -d '' item; do
        if [ -d "$item" ] && [[ ! "$item" == */.* ]]; then
            items+=("$item")
        fi
    done < <(find "../srcs" -type d ! -path '*/\.*' -print0)
    wait

    echo -e "\e[33mSelect a directory:\e[0m" >&1
    select item in "${items[@]}"; do
        if [ -n "$item" ]; then
            echo -e "\e[32m$item : selected\e[0m" >&1
            wait
            break
        else
            echo -e "\e[31mInvalid selection. Please try again.\e[0m" >&1
        fi
    done
    local -n var=$1
    var="$item"
}

print_items() {
	local item_path
	for item_path; do
			local indent=""
			while IFS= read -r -d '/' subdir; do
					indent+="	"
			done <<< "$item_path/"
			echo "$indent$item_path"  >&1
	done
}

select_item_f item
echo $PWD'/'$item > ./.last_dir
