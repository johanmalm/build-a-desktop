all:
	@$(MAKE) -C src/

gen:
	codespell book/book.md
	@echo '     GEN   README.md';./src/generate-readme < book/book.md > README.md
	@./book/gen-html

clean:
	@$(MAKE) -C src $@
