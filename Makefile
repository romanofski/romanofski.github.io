VPATH := posts

.PHONY: all

all: wordpress/export.xml
	saxon-he $< wordpress/wordpress-to-markdown.xslt
