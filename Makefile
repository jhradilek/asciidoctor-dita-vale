# A custom makefile for the AsciidoctorDITA Vale style
# Copyright (C) 2025 Jaromir Hradilek

# MIT License
#
# Permission  is hereby granted,  free of charge,  to any person  obtaining
# a copy of  this software  and associated documentation files  (the "Soft-
# ware"),  to deal in the Software  without restriction,  including without
# limitation the rights to use,  copy, modify, merge,  publish, distribute,
# sublicense, and/or sell copies of the Software,  and to permit persons to
# whom the Software is furnished to do so,  subject to the following condi-
# tions:
#
# The above copyright notice  and this permission notice  shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS
# OR IMPLIED,  INCLUDING BUT NOT LIMITED TO  THE WARRANTIES OF MERCHANTABI-
# LITY,  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
# SHALL THE AUTHORS OR COPYRIGHT HOLDERS  BE LIABLE FOR ANY CLAIM,  DAMAGES
# OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM,  OUT OF OR IN CONNECTION WITH  THE SOFTWARE  OR  THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

# Global settings:
SHELL     = /bin/sh
NAME      = AsciiDocDITA

# Important paths:
STYLESDIR = styles
SRCSDIR  := $(STYLESDIR)/$(NAME)
TESTDIR		= test
SRCS     := $(wildcard $(SRCSDIR)/*.yml)
TESTS    := $(wildcard $(TESTDIR)/*.bats)
LOGFILE   = CHANGELOG.md
ZIPFILE  := $(NAME).zip

# Command aliases:
BATS      = \bats
YAMLLINT  = \yamllint -s -f auto
CHANGELOG = \git log --pretty='{%D}* %s' | \sed -e 's/^{[^}]*tag: \([^},]\+\)[^}]*}/\n\#\# \1\n\n/;s/^{[^}]*}//;1i \# Changelog\n' | \sed -e '/^\* Merge pull request/d'
ZIP       = \zip -r

# Generate a changelog from revision history:
.PHONY: changelog
changelog:
	@echo "Generating $(LOGFILE)..."
	@$(CHANGELOG) > $(LOGFILE)
	@echo "Done."

# Prepare a Vale package:
.PHONY: package
package: $(SRCS)
	@echo "Generating $(ZIPFILE)..."
	@\cd $(STYLESDIR) && $(ZIP) $(ZIPFILE) . && \mv $(ZIPFILE) ..
	@echo "Done."

# Verify all Vale rules are valid YAML files:
.PHONY: validate
validate: $(SRCS)
	@echo "Validating Vale rules in $(SRCSDIR)..."
	@$(YAMLLINT) $^
	@echo "Done."

# Run tests:
.PHONY: test
test: $(TESTS)
	@echo "Running test files in $(TESTDIR)..."
	@$(BATS) $^
	@echo "Done."

# Remove generated files:
.PHONY: clean
clean:
	@echo "Removing generated files:"
	-rm -f $(LOGFILE)
	-rm -f $(ZIPFILE)
	@echo "Done."
