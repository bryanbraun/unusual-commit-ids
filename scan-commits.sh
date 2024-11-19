#!/bin/bash

# Define the input file containing commit SHAs
input_file="all_commits.txt"

echo "Analyzing patterns in the first 7 characters of commit SHAs..."

# Check: SHAs where the first 7 characters are the same
echo "\n1. SHAs where the first 7 characters are the same:"
grep -E '^(.)\1{6}' "$input_file"

# Check: SHAs starting with a palindrome (e.g., "abcdcba")
echo "\n2. SHAs starting with a palindrome:"
grep -E '^(.)(.)(.)(.)\3\2\1' "$input_file"

# Check: SHAs where the first 7 characters form an ascending sequence
echo "\n4. SHAs where the first 7 characters form an ascending sequence:"
grep -E '^(0123456|1234567|2345678|3456789|456789a|56789ab|6789abc|789abcd|89abcde|9abcdef)' "$input_file"

# Check: SHAs where the first 7 characters form a descending sequence
echo "\n5. SHAs where the first 7 characters form a descending sequence:"
grep -E '^(fedcba9|edcba98|dcba987|cba9876|ba98765|a987654|9876543|8765432|7654321|6543210)' "$input_file"

# Check: SHAs where the first 7 characters form a repeating pattern (e.g., "abababa")
echo "\n6. SHAs where the first 7 characters form a repeating pattern:"
grep -E '^(.)(.)\1\2\1\2\1' "$input_file"

# Check: SHAs where the first 7 characters are vowels only
echo "\n7. SHAs where the first 7 characters are vowels only:"
grep -E '^[aeiouAEIOU]{7}' "$input_file"

# Summary
echo "\nAnalysis complete!"
