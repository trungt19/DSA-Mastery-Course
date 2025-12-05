#!/bin/bash

# Read current day
DAY=$(cat current_day.txt)

# Read JSON using jq (we'll help you install jq if you don't have it)
PROBLEM=$(jq ".[] | select(.day == $DAY)" problems.json)

ID=$(echo $PROBLEM | jq -r '.id')
SLUG=$(echo $PROBLEM | jq -r '.slug')
TITLE=$(echo $PROBLEM | jq -r '.title')

FOLDER="day${DAY}_${SLUG}"

# Create folder
mkdir -p $FOLDER

# Create solution file
cat << EOT > $FOLDER/Solution.cs
// Day $DAY – $TITLE (LeetCode $ID)
// Solution Template

public class Solution {
    public void TODO() {
        // implement
    }
}
EOT

# Create notes file
cat << EOT > $FOLDER/NOTES_DAY${DAY}.md
# Day $DAY – $TITLE (LeetCode $ID)
Link: https://leetcode.com/problems/$SLUG

## My Approach




## Complexity



## Lessons Learned



EOT

# Auto-increment day
NEXT=$((DAY + 1))
echo $NEXT > current_day.txt

echo "Generated Day $DAY: $TITLE"
