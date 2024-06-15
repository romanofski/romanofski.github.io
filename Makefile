VPATH := blog:blog/2015
FILES := $(shell find ./blog -name '*.md' | sort -nr)

index.html: main.md $(FILES)
	pandoc -s --toc -c pandoc.css -f markdown+smart $^ -t html5 -o index.html

.PHONY: clean
clean: index.html
	rm -f $<
