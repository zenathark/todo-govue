package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("web/todo-ui/dist"))
	http.Handle("/", fs)

	fmt.Printf("Starting server...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
