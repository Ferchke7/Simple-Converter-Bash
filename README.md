# Simple-Converter-Bash

## Simple Unit Converter and Definition Management Tool - Documentation

### Overview
This Bash script provides a simple unit conversion and definition management tool. The script allows users to convert values between different units based on predefined conversion ratios stored in a file called "definitions.txt". Users can also add new unit conversion definitions and delete existing ones from the file.

### Usage
1. Save the script in a file, e.g., "converter.sh".
2. Make sure the script has execution permissions (`chmod +x converter.sh`).
3. Run the script using `./converter.sh` or `bash converter.sh` in the terminal.

### Functions

#### `show_menu()`
Displays the available options for the user in the command-line menu. Options include:
- 0: Quit the program.
- 1: Convert units.
- 2: Add a new unit conversion definition.
- 3: Delete an existing unit conversion definition.

#### `convert()`
Performs the unit conversion based on the user's selection and input. This function does the following:
1. Checks if "definitions.txt" exists and has content. If not, it prompts the user to add a definition first.
2. Asks the user to choose a line number from the "definitions.txt" file to use for conversion.
3. Reads and validates the user input value to convert.
4. Computes the result of the conversion and displays it to the user.

#### `add_def()`
Allows the user to add a new unit conversion definition to the "definitions.txt" file. The user must provide a definition in the format "unit_from_to_unit_to ratio". Example: "meters_to_feet 3.28084".
- The function validates the format of the new definition using regular expressions.
- If the input is valid, the new definition is appended to the "definitions.txt" file.

#### `print_with_line_numbers()`
Prints the contents of a file along with line numbers. This function is used to display the available unit conversion definitions to the user with corresponding line numbers.

#### `read_line_number()`
Reads and validates the line number entered by the user. It checks that the input is a valid positive integer within the range of available lines.

#### `del_def()`
Allows the user to delete an existing unit conversion definition from the "definitions.txt" file. The function does the following:
1. Checks if "definitions.txt" exists and has content. If not, it prompts the user to add a definition first.
2. Asks the user to choose a line number from the "definitions.txt" file to delete.
3. Reads and validates the user input line number.
4. If the line number is valid and not zero, it deletes the corresponding line from the "definitions.txt" file.

### Important Note
- The script assumes that the "definitions.txt" file exists and is correctly formatted with unit conversion definitions.
- Input validation is implemented for user-entered values, but there may still be some edge cases not accounted for in this basic implementation.
- For production use, additional error handling, user prompts, and input validations may be required to ensure the stability and security of the tool.

### Example Usage
```
$ ./converter.sh
Welcome to the Simple converter!
Select an option
0. Type '0' or 'quit' to end program
1. Convert units
2. Add a definition
3. Delete a definition
1
Type the line number to convert units or '0' to return
1. meters_to_feet 3.28084
2. liters_to_gallons 0.264172
2
Enter a value to convert:
10
Result: 2.64172
1
Type the line number to convert units or '0' to return
1. meters_to_feet 3.28084
2. liters_to_gallons 0.264172
0
Select an option
0. Type '0' or 'quit' to end program
1. Convert units
2. Add a definition
3. Delete a definition
0
Goodbye!
```

### Disclaimer
This documentation provides an overview of the script and its functionality. The script is intended for educational purposes and may require additional modifications and security measures before use in production environments. Use at your own risk.
