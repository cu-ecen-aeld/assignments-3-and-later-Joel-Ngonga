# Compiler setup
CC = $(CROSS_COMPILE)gcc

# Flags
CFLAGS = -Wall

# Source and output files
SRC = writer.c
OBJ = $(SRC:.c=.o)
TARGET = writer

# Default target
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean target
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
