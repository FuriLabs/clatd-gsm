PREFIX ?= /usr
LIBDIR = $(PREFIX)/lib
LIBEXECDIR = $(PREFIX)/libexec

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install the files."

install:
	install -d $(DESTDIR)$(LIBDIR)
	install -d $(DESTDIR)$(LIBEXECDIR)
	install -d $(DESTDIR)$(LIBDIR)/NetworkManager/dispatcher.d
	install -d $(DESTDIR)$(LIBDIR)/systemd/system/clatd@.service.d

	install -m 755 src/50-clat-bearer-manager $(DESTDIR)$(LIBDIR)/NetworkManager/dispatcher.d
	install -m 755 src/clatd-bearer-manager $(DESTDIR)$(LIBEXECDIR)
	install -m 644 src/clatd-notify.conf $(DESTDIR)$(LIBDIR)/systemd/system/clatd@.service.d/10-notify.conf

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/NetworkManager/dispatcher.d/50-clat-bearer-manager
	rm -f $(DESTDIR)$(LIBEXECDIR)/clatd-bearer-manager
	rm -f $(DESTDIR)$(LIBDIR)/systemd/system/clatd@.service.d/10-notify.conf
