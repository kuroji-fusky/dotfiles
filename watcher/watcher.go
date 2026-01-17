package main

import (
	"flag"
	"fmt"
	"os"
	"runtime"
)

const isWindows = runtime.GOOS == "windows"

func isElevated() bool {
	if isWindows {
		_, err := os.Open("\\\\.\\PHYSICALDRIVE0")

		return err == nil
	}

	return os.Geteuid() == 0
}

func main() {
	// pollIntrval := flag.Int("poll-interval", 2, "The goddamn polling interval lol")

	flag.Parse()

	if isElevated() {
		fmt.Println("Running with escalated/admin privilages - proceed with caution lol\n")
	}
}
