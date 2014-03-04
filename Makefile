index.html: README.rst
	pandoc -t revealjs -s -V theme=beige -V revealjs-url=./bower_components/components-revealjs/ README.rst -o index.html