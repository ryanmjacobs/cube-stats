CC=gcc
CFLAGS=-c -Wall
LDFLAGS=-lncurses
SOURCES=src/main.c src/cube/cube.c src/cube/draw.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=cube-stats

all: $(SOURCES) $(EXECUTABLE)
            
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(EXECUTABLE)
	rm -f src/*.o
	rm -f src/cube/*.o

.PHONY: install uninstall clean
