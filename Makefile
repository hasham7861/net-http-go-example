.PHONY: dev install-air run

# Run with hot reloading
dev:
	@if command -v air >/dev/null 2>&1; then \
		air; \
	else \
		echo "Air is not installed. Installing and running directly..."; \
		go run github.com/air-verse/air@v1.61.7; \
	fi

# Install air globally
install-air:
	go install github.com/air-verse/air@v1.61.7
	@echo "Air installed. You may need to add $(shell go env GOPATH)/bin to your PATH"

# Regular run without hot reloading
run:
	go run server.go
