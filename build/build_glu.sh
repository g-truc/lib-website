java -jar xalan.jar -OUT ../glu/glu.atom            -IN ../glu/source/data.xml   -XSL ./atom.xsl	-PARAM DIRECTORY ../glu/source/ -PARAM SERVE atom
java -jar xalan.jar -OUT ../glu/0.1.0/index.html    -IN ../glu/source/data.xml   -XSL ./index.xsl	-PARAM DIRECTORY ../glu/source/ -PARAM VERSION '0.1.0'
java -jar xalan.jar -OUT ../glu/0.1.0/updates.html  -IN ../glu/source/data.xml   -XSL ./updates.xsl	-PARAM DIRECTORY ../glu/source/ -PARAM VERSION '0.1.0'
java -jar xalan.jar -OUT ../glu/0.1.0/code.html     -IN ../glu/source/data.xml   -XSL ./code.xsl	-PARAM DIRECTORY ../glu/source/ -PARAM VERSION '0.1.0'
