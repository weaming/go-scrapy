SRC_FILES := $(wildcard scrapy/*.go)

test:
	go test ./scrapy -coverprofile=coverage.txt -v -race && go tool cover -html=coverage.txt -o coverage.html

.PHONY: test
