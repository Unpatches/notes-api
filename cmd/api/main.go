package main

import (
	"log"
	"net/http"

	httpapi "example.com/notes-api/internal/http"
	"example.com/notes-api/internal/http/handlers"
	"example.com/notes-api/internal/repo"
)

func main() {
	repository := repo.NewNoteRepoMem()
	h := handlers.NewNotesHandler(repository)
	r := httpapi.NewRouter(h)

	log.Println("Server started at :8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
