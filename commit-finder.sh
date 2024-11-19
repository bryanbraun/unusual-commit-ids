#!/bin/bash

# To prevent API rate limits, set a personal access token to the GITHUB_TOKEN
# environment vairable in your terminal before running this script.

username="bryanbraun"
start_year=2012
end_year=2024

# Create a file for each year checked
for year in $(seq $start_year $end_year); do
  next_year=$((year + 1))
  echo "Fetching commits from $year to $next_year..."
  gh api -X GET \
    "/search/commits?q=author:$username+committer-date:$year-01-01..$next_year-01-01" \
    --header "Accept: application/vnd.github.cloak-preview" \
    --paginate \
    -q '.items.[].sha' >> "commits-$year.txt"
done

# Combine all files into one
cat commits-*.txt > all_commits.txt

# Clean up unused files
for year in $(seq $start_year $end_year); do
  rm "commits-$year.txt"
done

echo "All done! See all_commits.txt for your commits."
