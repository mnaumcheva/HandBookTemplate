#-----------------------------------------------------
# Some usefull instructions...
#
BOOKS = Goals.adoc Environment.adoc Project.adoc System.adoc changelog.adoc definitions.adoc
DOC = asciidoctor -a allow-uri-read
#-----------------------------------------------------

all: main.pdf index.html 

# main.adoc: main-template.adoc $(BOOKS)
# 	mvn asciidoc-template::build

index.html: main.adoc $(BOOKS)
	$(DOC) -a toc=left -o index.html $<

%.html: %.adoc 
	$(DOC) -a toc=left $<

main.pdf: main.adoc $(BOOKS) 
	asciidoctor-pdf -a allow-uri-read -a toc=2 -a pdf-backend  main.adoc

clean:
	rm *.html

check:
	cucumber

deploy: index.html check
	@echo "========================================"
	@echo "==> Deploy updates "
	git commit -am "🤖 DEPLOY: last updates"; git pull; git push