package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func main() {
	// Seed the random number generator
	rand.Seed(time.Now().UnixNano())

	// Maximum lifetime is 2 minutes (120 seconds)
	maxDuration := 120
	duration := rand.Intn(maxDuration) + 1 // at least 1 second

	// Randomly decide if it will fail (80% chance)
	shouldFail := rand.Float64() < 0.8

	fmt.Printf("Task started. Duration: %d seconds. Will fail: %v\n", duration, shouldFail)

	for i := 1; i <= duration; i++ {
		time.Sleep(1 * time.Second)
		fmt.Printf("Step %d/%d: Still running...\n", i, duration)
	}

	if shouldFail {
		fmt.Println("Task failed randomly.")
		os.Exit(1)
	}

	fmt.Println("Task completed successfully.")
}
