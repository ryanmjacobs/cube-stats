CC=gcc
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=src/main.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=cube-stats

all: $(SOURCES) $(EXECUTABLE)
            
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

install:
	install -Dm 775 $(EXECUTABLE) /usr/bin/$(EXECUTABLE)

uninstall:
	rm -f /usr/bin/$(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE)
	rm -f *.o

.PHONY: install uninstall clean
