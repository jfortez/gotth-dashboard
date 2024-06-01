package main

import (
	"fmt"
	"gochi/internal/server"
	"os"
)

func main() {

	server := server.NewServer()

	host := "http://localhost"
	port := os.Getenv("PORT")
	fmt.Printf("Server running on %s:%s\n", host, port)

	err := server.ListenAndServe()
	if err != nil {
		panic(fmt.Sprintf("cannot start server: %s", err))
	}
}
