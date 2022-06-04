java -jar compiler.jar --js calendar.js jdate-class.js --js_output_file jdate.min.js --summary_detail_level 4 --compilation_level ADVANCED_OPTIMIZATIONS --jscomp_off=checkVars --output_wrapper "(function(){%%output%%}());"
	
pause