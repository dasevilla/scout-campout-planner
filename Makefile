# Source directory for TeX files
SRC_DIR=src

# Build directory for PDF files
BUILD_DIR=build

# All TeX files in the source directory
TEX_FILES=$(wildcard $(SRC_DIR)/*.tex)

# Snippet files
SNIPPET_FILES=$(wildcard $(SRC_DIR)/snippets/*.tex)

# All PDF files in the build directory
PDF_FILES=$(patsubst $(SRC_DIR)/%.tex,$(BUILD_DIR)/%.pdf,$(TEX_FILES))

# Combined PDF file of workshets in a specific order
COMBINED_PDF=$(BUILD_DIR)/scout-campout-planner.pdf

# Required PDFs for the combined PDF
COMBINED_PDF_REQS=$(BUILD_DIR)/planner-overview.pdf \
	$(BUILD_DIR)/planner-menu-planner.pdf \
	$(BUILD_DIR)/planner-menu-shopping-list.pdf \
	$(BUILD_DIR)/planner-activities.pdf \
	$(BUILD_DIR)/planner-equipment.pdf \
	$(BUILD_DIR)/planner-roster.pdf

# Default target
.PHONY: all
all: $(BUILD_DIR) $(PDF_FILES) $(COMBINED_PDF)

# Rule to remove the build directory
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Rule to combine all PDF files into a single PDF file in a specific order
$(COMBINED_PDF): $(COMBINED_PDF_REQS)
	pdfunite $^ $@

# Rule to create the build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to generate PDF files from TeX files
$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.tex $(SNIPPET_FILES)
	latexmk -pdf -output-directory=$(BUILD_DIR) -auxdir=$(BUILD_DIR) $<

# GitHub release target that creates a release, and uploads all the PDFs as assets
# Uses the GitHub CLI (gh) to create the release and upload the assets
.PHONY: release
release: $(PDF_FILES) $(COMBINED_PDF)
	gh release create --generate-notes --latest v$(shell date +%Y%m%d%H%M%S) $(COMBINED_PDF) $(PDF_FILES)
