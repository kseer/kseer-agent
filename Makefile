# Benign POC Makefile for the bug bounty report.
#
# Vendor README paths satisfied here:
#     make build                          -> builds ./kseer-agent
#     ./kseer-agent --config config.yaml  -> runs bundled poc.sh (banner only)
#     make poc                            -> runs poc.sh directly
# No networking, no data collection.

BINARY  := kseer-agent
GOFLAGS := CGO_ENABLED=0

.PHONY: all build poc linux-artifact darwin-artifact clean

all: build poc

build:
	$(GOFLAGS) go build -o $(BINARY) ./poc/

poc:
	bash poc.sh

# For the repo owner: refresh artifacts for the GitHub Release.
linux-artifact:
	$(GOFLAGS) GOOS=linux GOARCH=amd64 go build -o poc-artifacts/kseer-agent-linux-amd64 ./poc/

darwin-artifact:
	$(GOFLAGS) GOOS=darwin GOARCH=arm64 go build -o poc-artifacts/kseer-agent-darwin-arm64 ./poc/

clean:
	rm -f $(BINARY)
	rm -rf poc-artifacts
