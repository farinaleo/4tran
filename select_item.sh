select_item_f() {
	if [ ! -d "../srcs" ]; then
			echo "The directory ../srcs is missing."  >&1
			exit 1
	fi

	items=()
	while IFS= read -r -d '' item; do
			items+=("$item")
	done < <(find "../srcs" \( -type d -o -name "*.f90" \) -print0)
	wait
	echo "Directories and .f90 files found in ../srcs:"  >&1
	print_items "${items[@]}" >&1

	echo "Select an item:"  >&1
	select item in "${items[@]}"; do
			if [ -n "$item" ]; then
					echo "$item : selected"  >&1
					wait
					break
			else
					echo "Invalid selection. Please try again." >&1
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
echo $PWD'/'$item  > ./.last_dir
