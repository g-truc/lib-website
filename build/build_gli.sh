java -jar xalan.jar -OUT ../gli/gli.atom            -IN ../gli/source/data.xml   -XSL ./atom.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM SERVE atom
java -jar xalan.jar -OUT ../gli/0.4.1/index.html    -IN ../gli/source/data.xml   -XSL ./index.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.4.1'
java -jar xalan.jar -OUT ../gli/0.4.1/updates.html  -IN ../gli/source/data.xml   -XSL ./updates.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.4.1'
java -jar xalan.jar -OUT ../gli/0.4.1/code.html     -IN ../gli/source/data.xml   -XSL ./code.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.4.1'
java -jar xalan.jar -OUT ../gli/0.5.0/index.html    -IN ../gli/source/data.xml   -XSL ./index.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.5.0'
java -jar xalan.jar -OUT ../gli/0.5.0/updates.html  -IN ../gli/source/data.xml   -XSL ./updates.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.5.0'
java -jar xalan.jar -OUT ../gli/0.5.0/code.html     -IN ../gli/source/data.xml   -XSL ./code.xsl	-PARAM DIRECTORY ../gli/source/ -PARAM VERSION '0.5.0'