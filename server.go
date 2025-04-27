package main

import (
	"log"
	"net/http"
)


func homeHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Hello, world 1!!"))
}

func main() {
	mux := http.NewServeMux()
	
	mux.Handle("/", http.HandlerFunc(homeHandler))

	log.Print("Listening on localhost:8080")
	
	// Properly handle errors when starting the server
	err := http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
