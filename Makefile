CV_FILES=$(wildcard cv/*.yaml)
OUTPUTS=$(CV_FILES:.yaml=)
MD_FILES=$(wildcard cv/*/*.md)
OUTPUT_MD=$(patsubst cv/%/*.md, docs/%.md, $(MD_FILES))
INDEX_FILE=pt-pt

.PHONY: render
render:
	@echo "Rendering all CVs in cv/ folder..."
	@for file in $(CV_FILES); do \
		rendercv render "$$file" -o "$${file%.yaml}"; \
	done

.PHONY: copy-md
copy-md:
	@echo "Copying Markdown files to docs/..."
	@mkdir -p docs
	@for file in $(MD_FILES); do \
		dir_name=$$(basename $$(dirname "$$file")); \
		if [ "$$dir_name" = "$(INDEX_FILE)" ]; then \
			dest="docs/index.md"; \
		else \
			dest="docs/$$dir_name.md"; \
		fi; \
		cp "$$file" "$$dest"; \
		echo "Copied $$file to $$dest"; \
	done

.PHONY: serve
serve:
	@echo "Starting MkDocs server..."
	mkdocs serve


.PHONY: update-mkdocs
update-mkdocs:
	@echo "Updating mkdocs.yml with available markdown files..."
	@echo "site_name: '[CV] Ricardo Carreira da Silva'" > mkdocs.yml
	@echo "nav:" >> mkdocs.yml
	@echo '  - $(INDEX_FILE): index.md' >> mkdocs.yml
	@for file in $(wildcard docs/*.md); do \
		name=$$(basename $$file .md); \
		if [ "$$name" != "index" ]; then \
			echo "  - $$name: $$name.md" >> mkdocs.yml; \
		fi; \
	done
	@echo "theme:\n  name: 'material'\n  language: 'pt'" >> mkdocs.yml
	@echo "plugins:\n  - search" >> mkdocs.yml
	@echo "Updated mkdocs.yml"
