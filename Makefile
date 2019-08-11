# Usage:
# make                 same as make build=safe
# make build=safe      general-purpose build, minimal warnings
# make build=debug     debug symbol build, extreme warnings
# make build=release   optimized release build

build=safe

cflags.safe=-Wall -Werror
cflags.release=-Wall -Werror -O2 -s

# -Wno-unused-parameter required due to some functions in directives[]
# not making use of their function arguments
#
cflags.debug=-Wall -Werror -g3 -Wextra -Wformat=2 -Wno-unused-parameter -Wbad-function-cast -Wcast-align -Wdeclaration-after-statement -Wdisabled-optimization -Wfloat-equal -Winline -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpacked -Wpointer-arith -Wredundant-decls -Wstrict-prototypes -Wunreachable-code -Wwrite-strings

# Detect use of gmake.exe on Windows
ifneq ($(shell echo),)
  BINARY=asm6f.exe
  RM=del /Q
else
  BINARY=asm6f
endif

SRC=asm6f.c

CFLAGS=$(cflags.$(build))

ifeq ($(CFLAGS),)
$(error Invalid build value. Valid choices are safe, debug, release.)
endif

all: $(BINARY)

$(BINARY): $(SRC)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	-$(RM) $(BINARY)

.PHONY: all clean
