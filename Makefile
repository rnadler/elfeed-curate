.POSIX:
EMACS   = emacs
BATCH   = $(EMACS) -batch -Q -L . -L test

EL   = elfeed-curate.el
TEST = test/elfeed-curate-tests.el

# Doom repo(s)
LDFLAGS = -L ~/.emacs.d/.local/straight/repos/elfeed

compile: $(EL:.el=.elc) $(TEST:.el=.elc)

check: test
test: $(EL:.el=.elc) $(TEST:.el=.elc)
	$(BATCH)  $(LDFLAGS) -l $(TEST) -f ert-run-tests-batch

clean:
	rm -f $(EL:.el=.elc) $(TEST:.el=.elc)

elfeed-curate-tests.elc: elfeed-curate.elc

.SUFFIXES: .el .elc

.el.elc:
	$(BATCH) $(LDFLAGS) -f batch-byte-compile $<
