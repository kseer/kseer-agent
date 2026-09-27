// Command kseer-agent is a benign proof-of-concept for a bug bounty report.
//
// The vendor README instructs users to build/execute an agent binary. This POC
// demonstrates that an attacker controlling the account can ship any binary —
// this one executes the bundled poc.sh (banner only) and exits. No network
// activity, no data collection, no persistence.
package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	fmt.Println("POC: unclaimed supply chain (benign demonstration) - binary path")

	// Prefer a poc.sh sitting next to the binary (repo root after `make build`,
	// or any directory the binary is run from).
	if _, err := os.Stat("poc.sh"); err == nil {
		cmd := exec.Command("bash", "poc.sh")
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		_ = cmd.Run() // benign script; ignore errors
		return
	}

	// Fallback: embedded banner if poc.sh is not present.
	fmt.Println("Bugbounty poc by @nvk0x")
}
