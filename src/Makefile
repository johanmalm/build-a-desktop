CC = gcc
RM = rm -f
MAKEFLAGS += --no-print-directory
QUIET_CC   = @echo '     CC    '$@;
QUIET_LINK = @echo '     LINK  '$@;

CFLAGS = -g -Wall -Wextra -std=gnu23
CFLAGS += -fsanitize=address,undefined -fno-common -fno-omit-frame-pointer -rdynamic
CFLAGS += -fanalyzer
CFLAGS += -Wno-unused-parameter
CFLAGS += `pkg-config --cflags glib-2.0`
LDFLAGS += `pkg-config --libs glib-2.0`

PROGS = \
	generate-toc \
	generate-readme

SRC  = $(wildcard *.c)
OBJ  = $(SRC:.c=.o)

all: $(PROGS)

$(PROGS): % : %.o
	$(QUIET_LINK)$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

%.o : %.c
	$(QUIET_CC)$(CC) $(CFLAGS) -c $<

clean:
	@$(RM) -f $(PROGS) $(OBJ)
