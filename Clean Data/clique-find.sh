echo "Cleaning malicious domains"
cat "$1" | grep ".com" | rev | cut -d "." -f 1-2 | rev > malicious-cleaned-coms
echo "Cleaned"
echo "Sorting malicious domains"
sort "malicious-cleaned-coms" | uniq > output
echo "Sorting all the domains"
sort "$2" | uniq >> output
echo "Sorting merged file"
sort "output" | uniq -d > activated_malicious
wc -l "activated_malicious"
today=$(date '+%d_%m_%y', )
num_malicious=$(wc -l "activated_malicious")
echo "${today},${num_malicious}" >> malicious_count.csv
echo "The number of malicous domains is: ${num_malicious}"
rm output
rm malicious-cleaned-coms
filename=$(date '+%d_%m_%y')
echo "File written"
mv "activated_malicious" "${filename}_activated_malicous.txt"

echo "Done"


