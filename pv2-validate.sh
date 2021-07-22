#!/bin/bash

#default_dir=$(pwd)
target_dir=$1
files=$(ls ${target_dir})
validator_cmd="newdoc -l"

if ! command -v newdoc &> /dev/null
then
  echo "newdoc not found. Exiting."
  exit 2
fi

validate ()
{
  if [[ -f $file && "$file" == *.adoc ]]
  then
    #echo "Checking: ${target_dir}/${file}"
    ${validator_cmd} ${file};
    echo
  fi
}

#if [ $target_dir -ne $(pwd) ]
#then
pushd $target_dir &> /dev/null
#fi

for file in $files
do
  validate $file
done
popd &> /dev/null

exit 0
