CV_FILES=$(wildcard cv/*.yaml)
OUTPUTS=$(CV_FILES:.yaml=)

.PHONY: render
render:
	@echo "Rendering all CVs in cv/ folder..."
	@for file in $(CV_FILES); do \
		rendercv render "$$file" -o "$${file%.yaml}"; \
	done

.PHONY: serve
serve:
	@echo "Starting MkDocs server..."
	mkdocs serve
