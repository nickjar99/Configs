#!/bin/bash
## Replacing single and double quotes with `
echo $SHELL

echo "Cleaning up partial downloads"
find Music -type f -name "*.part" -exec rm -rfv {} \;
find Music -type f -name "*.temp" -exec rm -rfv {} \;

find $1 -type f \( -name "*\'*" -o -name "*\"*" \) | while read -r file
do
    # echo $file
    strip=$(echo $file | sed -e "s/$1//")
    newname=$(echo $2$strip | sed -e "s/'/\`/g" -e "s/\"/\`/g")
    # echo $newname
    mv -v "$file" "$newname"
done

