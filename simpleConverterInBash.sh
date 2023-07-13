
#!/usr/bin/bash

filename="definitions.txt"

show_menu() {
  echo "Select an option"
  echo "0. Type '0' or 'quit' to end program"
  echo "1. Convert units"
  echo "2. Add a definition"
  echo "3. Delete a definition"
}

convert() {
  if [[ ! -f "$filename" || $(wc -l < "$filename") -eq 0 ]]; then
    echo "Please add a definition first!"
    return
  else
    echo "Type the line number to convert units or '0' to return"
    print_with_line_numbers "$filename"
    local line_number
    read_line_number line_number $(wc -l < "$filename")
    if [[ $line_number -eq 0 ]]; then
      return 0
    fi

      echo "Enter a value to convert:"
        while true; do
      local value
      read value
      if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        local line=$(sed "${line_number}!d" "$filename")
        local array=($line)
        local unit_ratio=${array[1]}
        local result=$(bc <<< "$value * $unit_ratio")
        echo "Result: $result"
        break
      else
        echo "Enter a float or integer value!"
      fi
    done
  fi
}

add_def() {
  local reDef="^[a-z]+_to_[a-z]+$"
  local reNum="^-?[0-9]+(\.[0-9]+)?$"
  local def ratio
  while true; do
    echo "Enter a definition:" && read -r def ratio
    if [[ "$def" =~ $reDef && "$ratio" =~ $reNum ]]; then
      echo "$def $ratio" >> "$filename"
      break
    else
      echo "The definition is incorrect!"
    fi
  done
}

print_with_line_numbers() {
  local n=0
  while read -r line; do
    n=$((n + 1))
    echo "$n. $line"
  done < "$1"
}

read_line_number() {
  local number_of_lines=$2
  while true; do
    read -r "$1"
    if [[ "${!1}" =~ ^[0-9]+$ && ${!1} -ge 0 && ${!1} -le $number_of_lines ]]; then
      break
    else
      echo "Enter a valid line number!"
    fi
  done
}

del_def() {
  local nLines=$(wc -l < "$filename")
  if [[ ! -f "$filename" || $nLines -eq 0 ]]; then
    echo "Please add a definition first!"
  else
    echo "Type the line number to delete or '0' to return"
    print_with_line_numbers "$filename"
    local line_number
    read_line_number line_number "$nLines"
    if [[ $line_number -eq 0 ]]; then
      return 0
    fi
    sed -i "${line_number}d" "$filename"
  fi
}

echo "Welcome to the Simple converter!"
while true; do
  show_menu
  read -r option
  case $option in
    "0" | "quit" ) echo "Goodbye!"; break;;
    "1" ) convert;;
    "2" ) add_def;;
    "3" ) del_def;;
    *  ) echo "Invalid option!"
  esac
done