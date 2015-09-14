index.html: ~/Dropbox/blog.markdown
	pandoc -s -S --toc -c pandoc.css -f markdown ~/Dropbox/blog.markdown -t html5 -o index.html
