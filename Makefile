index.html: index.rst
	pandoc -t revealjs -s -V theme=beige index.rst -o index.html