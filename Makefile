# Config

DARTDIR = ~/dev/dart
DART = $(DARTDIR)/dart-sdk/bin/dart
DARTIUM = $(DARTDIR)/chromium/chrome
DARTSDK = $(DARTDIR)/dart-sdk

# Simple server to handle simple http requests

server:
	@python -m SimpleHTTPServer # replace with a custom dart server

# Launch app into the browser

browser:
	@$(DARTIUM) localhost:8000 &

# Start development

dev: browser server

.PHONY: server browser dev