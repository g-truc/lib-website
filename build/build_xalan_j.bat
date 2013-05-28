java -jar xalan.jar -OUT ../index.html     -IN ../src/data.xml   -XSL ../src/news.xsl
java -jar xalan.jar -OUT ../download.html  -IN ../src/data.xml   -XSL ../src/download.xsl
java -jar xalan.jar -OUT ../goodies.html   -IN ../src/data.xml   -XSL ../src/goodies.xsl
java -jar xalan.jar -OUT ../about.html     -IN ../src/data.xml   -XSL ../src/about.xsl
java -jar xalan.jar -OUT ../code.html      -IN ../src/data.xml   -XSL ../src/code.xsl
pause
