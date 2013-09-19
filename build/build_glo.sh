java -jar xalan.jar -OUT ../glo/glo.atom            -IN ../glo/source/data.xml   -XSL ./atom.xsl	-PARAM DIRECTORY ../glo/source/ -PARAM SERVE atom
java -jar xalan.jar -OUT ../glo/0.3.0/index.html    -IN ../glo/source/data.xml   -XSL ./index.xsl	-PARAM DIRECTORY ../glo/source/ -PARAM VERSION '0.3.0'
java -jar xalan.jar -OUT ../glo/0.3.0/updates.html  -IN ../glo/source/data.xml   -XSL ./updates.xsl	-PARAM DIRECTORY ../glo/source/ -PARAM VERSION '0.3.0'
java -jar xalan.jar -OUT ../glo/0.3.0/code.html     -IN ../glo/source/data.xml   -XSL ./code.xsl	-PARAM DIRECTORY ../glo/source/ -PARAM VERSION '0.3.0'
