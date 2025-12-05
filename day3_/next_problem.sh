#!/bin/bash

DAY=$(cat current_day.txt)

PROBLEM=$(jq ".[] | select(.day == $DAY)" problems.json)

ID=$(echo $PROBLEM | jq -r '.id')
SLUG=$(echo $PROBLEM | jq -r '.slug')
TITLE=$(echo $PROBLEM | jq -r '.title')
PATTERN=$(echo $PROBLEM | jq -r '.pattern')

FOLDER="day${DAY}_${SLUG}"

echo "========================================"
echo "🚀 DSA MASTER: DAY $DAY"
echo "📌 Problem: $TITLE (LeetCode $ID)"
echo "🧠 Pattern: $PATTERN"
echo "🔗 Link: https://leetcode.com/problems/$SLUG"
echo "📂 Folder: $FOLDER"
echo "========================================"

mkdir -p $FOLDER

cat << EOT > $FOLDER/Solution.cs
// Day $DAY – $TITLE (LeetCode $ID)
// Pattern: $PATTERN

public class Solution {
    // YOUR CODE HERE
}
EOT

cat << EOT > $FOLDER/NOTES_DAY${DAY}.md
# Day $DAY – $TITLE (LeetCode $ID)
Pattern: $PATTERN

## 🔍 Problem Summary
(Explain in your own words)

## 🧠 Brute Force Idea
(Describe the slow solution)

## ⚡ Optimal Solution
(Explain HashSet logic)

## 📈 Complexity
Time:  
Space:

## 🧩 Pattern Insight
Why does a HashSet solve this instantly?
What interviewers want to hear:

## 📝 Lessons Learned
(Your personal insights here)
EOT

open "https://leetcode.com/problems/$SLUG"

git add $FOLDER current_day.txt
git commit -m "Day $DAY scaffold created: $TITLE"

NEXT=$((DAY + 1))
echo $NEXT > current_day.txt
