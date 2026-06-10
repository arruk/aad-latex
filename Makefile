ROOT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
TEMPLATE ?= report
MODEL_DIR := $(ROOT_DIR)/model/$(TEMPLATE)
TARGET_DIR := $(ROOT_DIR)/$(NAME)
DOC_DIR ?= .
MAIN ?= Main.tex
MAIN_STEM := $(basename $(notdir $(MAIN)))
LATEXMK ?= latexmk

.PHONY: new build clean distclean

new:
	@test -n "$(NAME)" || { echo "Usage: make new NAME=documento [TEMPLATE=report|essay]"; exit 1; }
	@test -d "$(MODEL_DIR)" || { echo "Template directory '$(MODEL_DIR)' not found"; exit 1; }
	@test ! -e "$(TARGET_DIR)" || { echo "Target '$(TARGET_DIR)' already exists"; exit 1; }
	cp -R "$(MODEL_DIR)" "$(TARGET_DIR)"
	@echo "Created '$(TARGET_DIR)' from template '$(TEMPLATE)'"

build:
	@test -f "$(DOC_DIR)/$(MAIN)" || { echo "Main file '$(DOC_DIR)/$(MAIN)' not found"; exit 1; }
	cd "$(DOC_DIR)" && "$(LATEXMK)" -pdf -pvc -halt-on-error "$(MAIN)"

clean:
	@test -f "$(DOC_DIR)/$(MAIN)" || { echo "Main file '$(DOC_DIR)/$(MAIN)' not found"; exit 1; }
	cd "$(DOC_DIR)" && "$(LATEXMK)" -c "$(MAIN)" && rm -f "$(MAIN_STEM).bbl"

distclean:
	@test -f "$(DOC_DIR)/$(MAIN)" || { echo "Main file '$(DOC_DIR)/$(MAIN)' not found"; exit 1; }
	cd "$(DOC_DIR)" && "$(LATEXMK)" -C "$(MAIN)"
