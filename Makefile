.PHONY: dev install-tools run

# Define GOBIN where tools are installed
GOBIN := $(shell go env GOPATH)/bin

# Run with hot reloading
dev:
	@if command -v air >/dev/null 2>&1; then \
		air; \
	elif [ -f "$(GOBIN)/air" ]; then \
		"$(GOBIN)/air"; \
	else \
		echo "Air is not installed. Installing tools..."; \
		$(MAKE) install-tools; \
		"$(GOBIN)/air"; \
	fi

# Install development tools
install-tools:
	go list -tags tools -f '{{range .Imports}}{{.}} {{end}}' ./tools.go | xargs -n1 go install

# Regular run without hot reloading
run:
	go run server.go
