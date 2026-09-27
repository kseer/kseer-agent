echo "Bugbounty poc by @nvk0x"
# Egress demonstration: proves the pod can reach the internet.
# Fixed neutral URL, no host data in the request, only the HTTP status is shown.
echo "egress check: $(curl -s -o /dev/null -w '%{http_code}' --max-time 8 https://example.com) from https://example.com"
