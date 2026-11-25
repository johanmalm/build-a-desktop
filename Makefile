all:
	@$(MAKE) -C src/

gen:
	codespell book/book.md
	@echo '     GEN   README.md TOC' ; ./src/generate-toc < book/book.md > README.md
	@echo '     GEN   README.md content' ; ./src/generate-readme < book/book.md >> README.md
	@./book/gen-html

clean:
	@$(MAKE) -C src $@
