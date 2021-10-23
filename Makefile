PREFIX ?= /usr

all:
	@echo RUN \'make install\' to install coinfetch

install:
	@install -Dm755 src/coinfetch $(DESTDIR)$(PREFIX)/bin/coinfetch

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/coinfetch