#!/usr/bin/make -f

CASK ?= cask
EMACS ?= $(CASK) emacs -Q --batch

SRC := gitlab-ci-mode-flycheck.el
OBJ := $(SRC:.el=.elc)

all: $(OBJ)

.cask/stamp: Cask $(SRC)
	$(CASK) install
	touch $@

clean:
	$(RM) $(OBJ)
	$(RM) -r .cask

%.elc: %.el .cask/stamp
	$(EMACS) -eval "(checkdoc-file \"$<\")"
	$(EMACS) -l tests/init.el -f package-lint-batch-and-exit $<
	$(EMACS) -L . -f batch-byte-compile $<

.PHONY: all clean
