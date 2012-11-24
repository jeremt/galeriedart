
DART = ~/dev/dart/dart-sdk/bin/dart
DARTIUM = ~/dev/dart/chromium/chrome

server:
	@python -m SimpleHTTPServer # replace with a custom dart server

browser:
	@$(DARTIUM) localhost:8000 &

dev: browser server

.PHONY: server browser dev