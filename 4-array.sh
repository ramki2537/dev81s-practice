#!/bin/bash

MOVIES=("telugu" "hindi" "english" "tamil")

echo "Best south indian industry: ${MOVIES[0]}"
echo "Best noth indian industry: ${MOVIES[1]}"
echo "Best english movie industry: ${MOVIES[2]}"
echo "Best screenplay movies from: ${MOVIES[3]}"

echo "All cinema industrys: ${MOVIES[@]}"

echo "Number of cinema industrys: $#"