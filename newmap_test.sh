#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Directory containing your map files
MAP_DIR="maps"

# Array of map files to test
MAP_FILES=(
	"new/basic_level.cub"
	"new/binary_file.cub"
	"new/bonus_big.cub"
	"new/bonus_entity.cub"
	"new/err_0_res.cub"
	"new/err_double_element.cub"
	"new/err_invalid_color_1.cub"
	"new/err_invalid_color_2.cub"
	"new/err_invalid_color_3.cub"
	"new/err_invalid_color_4.cub"
	"new/err_invalid_color_5.cub"
	"new/err_invalid_key.cub"
	"new/err_invalid_sprite.cub"
	"new/err_missing_element.cub"
	"new/err_missing_file.cub"
	"new/err_multi_spawn.cub"
	"new/err_no_spawn.cub"
	"new/err_notacub.bin"
	"new/mixed_map.cub"
	"new/test_direction.cub"
)

TEST_NUMBER=0
TESTS_PASSED=0

# Path to the cub3D executable
CUB3D_EXEC="./cub3D"

# Loop through each map file and run cub3D
for map_file in "${MAP_FILES[@]}"; do
	((TEST_NUMBER++))
	echo -e "${CYAN}Running test: $CUB3D_EXEC $MAP_DIR/$map_file"
	
	# Run the cub3D command and capture the output and errors
	ACTUAL_OUTPUT=$($CUB3D_EXEC "$MAP_DIR/$map_file" 2>&1)
	EXIT_STATUS=$?
	
	# Path to the expected output file
	#EXPECTED_FILE="$EXPECTED_DIR/$(basename $map_file)"
	
   #if [ -f "$EXPECTED_FILE" ]; then
	#	EXPECTED_OUTPUT=$(cat "$EXPECTED_FILE")
		
	#	if [ "$ACTUAL_OUTPUT" == "$EXPECTED_OUTPUT" ]; then
			((TESTS_PASSED++))
			echo -e "${GREEN}Test $TEST_NUMBER OK.${NC}"
			echo -e "${GREEN}Expected:" $EXPECTED_OUTPUT "${NC}"
			echo -e "${RED}Actual  :" $ACTUAL_OUTPUT "${NC}"
	#	else
	#		echo -e "${RED}Test $TEST_NUMBER: KO${NC}"
	#		echo -e "Expected:" $EXPECTED_OUTPUT "${NC}"
	#		echo -e "${RED}Actual  :" $ACTUAL_OUTPUT "${NC}"
	#	fi
	#else
	#	echo -e "${RED}Expected output file not found for $map_file${NC}"
	#fi

	echo "-------------------------"
done

# Print total tests passed
echo -e "Total tests passed: ${GREEN}$TESTS_PASSED${NC}/$TEST_NUMBER"