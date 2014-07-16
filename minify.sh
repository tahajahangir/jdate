#!/bin/sh
if [ ! -e compiler.jar ]; then
	wget http://dl.google.com/closure-compiler/compiler-latest.zip
	unzip compiler-latest.zip compiler.jar
	rm compiler-latest.zip
fi
java -jar compiler.jar --js calendar.js jdate-class.js \
	--js_output_file jdate.min.js \
	--summary_detail_level 4 \
	--compilation_level ADVANCED_OPTIMIZATIONS \
	--output_wrapper "(function(){%output%}());"
