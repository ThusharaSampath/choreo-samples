package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("Hello, World!")

	fmt.Println("len", len(os.Args))

	for _, arg := range os.Args[1:] {
		fmt.Println(arg)
	}
}
