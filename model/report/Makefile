ROOT_MAKEFILE := $(abspath $(CURDIR)/../Makefile)
MAIN ?= Main.tex

.PHONY: build clean distclean

build clean distclean:
	@test -n "$(ROOT_MAKEFILE)" || { echo "Root Makefile not found"; exit 1; }
	@$(MAKE) -f "$(ROOT_MAKEFILE)" $@ DOC_DIR="$(CURDIR)" MAIN="$(MAIN)"
