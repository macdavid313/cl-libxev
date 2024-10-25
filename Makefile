##
# Common Lisp bindings for libxev
# @file
##

ZIG_VERSION=0.13.0
LIBXEV_GIT_COMMIT=b8d1d93e5c899b27abbaa7df23b496c3e6a178c7

ifeq ($(shell zig version), $(ZIG_VERSION))
$(info Zig version: $(ZIG_VERSION))
$(info libxev git commit: $(LIBXEV_GIT_COMMIT))
else
$(error Zig version must be $(ZIG_VERSION))
endif

libxev:
	curl -L https://github.com/mitchellh/libxev/archive/$(LIBXEV_GIT_COMMIT).tar.gz | tar xz
	mv libxev-$(LIBXEV_GIT_COMMIT) libxev

include/xev.h: libxev
	cd libxev; \
	zig build --release=fast install --prefix $(shell pwd)

OS := $(shell uname -s)
ARCH := $(shell uname -m)
ifeq ($(OS), Linux)
	ifeq ($(ARCH), x86_64)
		GROVEL_DIR := src/grovel/x86_64-linux
	else ifeq ($(ARCH), arm64)
		GROVEL_DIR := src/grovel/aarch64-linux
	else
		$(error Unsupported architecture $(ARCH) on Linux)
	endif
else ifeq ($(OS), Darwin)
	ifeq ($(ARCH), arm64)
		GROVEL_DIR := src/grovel/aarch64-macos
	else
		$(error Unsupported architecture $(ARCH) on macOS)
	endif
else
	$(error Unsupported operating system $(OS))
endif

.PHONY: grovel
grovel: include/xev.h
	cc -g -Wall -c grovel.c -o grovel.o -Iinclude
	cc grovel.o lib/libxev.a -o libxev-grovel
	mkdir -p $(GROVEL_DIR)
	./libxev-grovel > $(GROVEL_DIR)/grovel.lisp

.clang-format:
	clang-format --style=GNU --sort-includes -dump-config >.clang-format

.PHONY: format
format: .clang-format
	@echo "Formatting grovel.c ... "
	@clang-format -i grovel.c
	@echo "Done."

.PHONY: clean
clean:
	rm -rf libxev include lib share
	rm -f *.o libxev-grovel
