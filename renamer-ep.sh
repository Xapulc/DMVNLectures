#!/bin/bash
set -xe

if [ $# -lt 2 ] ; then
	echo "Usage: $0 <dir-name> <course-num> [<no-numbers>]"
	echo "  Example: $0 'EP - Complex Calculus - A.U. Thor' 5.6 yes"
	exit 1
fi

dirName="$1"
course="$2"
nn="$3"
prefix="`echo -n "$dirName" | perl -p -e 's/^(..).*/\1/'`"

discipline="`echo -n "$dirName" | perl -p -e 's/ \[.+\]//' | perl -p -e 's/'$prefix' - ([^-]+) - .*/\1/'`"
author="`echo -n "$dirName" | perl -p -e 's/'$prefix' - .* - (.*)/\1/'`"

properDiscipline="`echo -n "$discipline" | tr \  \.`"
properAuthor="`echo -n "$author" | sed -e 's/ //g'`"
properDirName="$prefix.$properDiscipline.[$course].$properAuthor"

disciplineLC="`echo -n "$discipline" | tr [A-Z] [a-z] | sed -e 's/ /./g'`"
authorLC="`echo -n "$author" | perl -p -e 's/^[A-Za-z]+\.[A-Za-z]+\. //' | tr [A-Z] [a-z]`"
distCourse="`echo -n "$course" | perl -p -e 's/\./s/g' | perl -p -e 's/$/s/'`"

if [ -n "$nn" ] ; then
	oldTexName="$prefix - $discipline - $author"
else
	oldTexName="$prefix - $discipline [$course] - $author"
fi
newTexName="$prefix.$properDiscipline.[$course].$properAuthor"
prefixLC="`echo -n "$prefix" | tr [A-Z] [a-z]`"
distrName="$prefixLC-$disciplineLC-$distCourse-$authorLC"

#exit 0

hg=
$hg mv "$dirName" "$properDirName"
cd "$properDirName"
$hg mv "$oldTexName.tex" "$newTexName.tex"
$hg rm -f [Mm]akefile
rm -f [Mm]akefile
echo "texify ($newTexName $distrName)" > CMakeLists.txt
hg add CMakeLists.txt
hg add "$newTexName.tex"
cd -
echo "add_subdirectory($properDirName)" >> CMakeLists.txt