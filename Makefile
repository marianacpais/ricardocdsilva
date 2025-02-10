CV_FILE?=Cv Ricardo Silva.yaml
OUTPUT_PDF=$(CV_FILE:.yaml=)

.PHONY: render
render:
	@echo "Rendering CV from $(CV_FILE)..."
	rendercv render "$(CV_FILE)" -o "$(OUTPUT_PDF)"

.PHONY: serve
serve:
	@echo "Starting MkDocs server..."
	mkdocs serve