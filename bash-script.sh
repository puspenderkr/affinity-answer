#!/bin/bash

# Define the input URL
url="https://www.amfiindia.com/spages/NAVAll.txt"

# Use `curl` to fetch the data from the URL and extract the relevant lines
data=$(curl -s "$url" | grep -E '^[0-9]+;[^;]+;[^;]+;[^;]+;[0-9]+\.[0-9]+;[0-9]{2}-[A-Za-z]{3}-[0-9]{4}$')

# Extract the "Scheme Name" and "Net Asset Value" fields and save them in a TSV file
echo -e "Scheme Name\tNet Asset Value" > extracted_data.tsv
echo "$data" | awk -F';' '{ print $4 "\t" $5 }' >> extracted_data.tsv

# Provide feedback
echo "Data extraction complete. Results saved in 'extracted_data.tsv'."


# Regarding the question of whether this data should be stored in JSON, it depends on our specific use case and requirements. JSON is a structured and more versatile data format, but if we only need to work with these two specific fields and prefer a simpler format, a TSV file may suffice. JSON could be a better choice if we need to store additional metadata or if we plan to use the data in a more complex and structured way.