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
		if [ "$$dir_name" = "$(INDEX_LANG)" ]; then \
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
