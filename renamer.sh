#!/bin/bash
set -xe

if [ $# -lt 2 ] ; then
	echo "Usage: $0 <dir-name> <course-num>"
	exit 1
fi

dirName="$1"
course="$2"
subd="$3"

discipline="`echo $dirName | perl -p -e 's/([^-]+) - .*/\1/'`"
echo "DISC='$discipline'"
author="`echo $dirName | perl -p -e 's/.* - (.*)/\1/'`"

echo "Auth='$author'"
properAuthor="`echo -n "$author" | sed -e 's/ //g'`"
properDirName="$discipline.[$course].$author"

disciplineLC="`echo -n "$discipline" | tr [A-Z] [a-z]`"
authorLC="`echo -n "$author" | perl -p -e 's/^[A-Za-z]+\.[A-Za-z]+\. //' | tr [A-Z] [a-z]`"

oldTexName="$discipline [$course] - $author"
newTexName="$discipline.[$course].$properAuthor"
distrName="$disciplineLC-${course}s-$authorLC"

#exit 0

hg mv "$1" "$properDirName"
cd "$properDirName"
hg mv "$oldTexName.tex" "$newTexName.tex"
echo "texify ($newTexName $distrName)" > CMakeLists.txt
cd -
