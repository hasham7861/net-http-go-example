//go:build tools
// +build tools

package tools

import (
	_ "github.com/air-verse/air" // Development-time dependency
)

// This file is used to track development tool dependencies.
// It's never compiled into the final binary.