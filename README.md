[![Build Status](https://travis-ci.org/weaming/go-scrapy.svg?branch=master)](https://travis-ci.org/weaming/go-scrapy) [![Coverage Status](https://coveralls.io/repos/github/weaming/go-scrapy/badge.svg?branch=master)](https://coveralls.io/github/weaming/go-scrapy?branch=master)

# go-scrapy

[Fork from https://github.com/kabelsea/go-scrapy]

A scrapy implementation in Go. (Work in progres)

# Overview
`go-scrapy` is a very useful and productive web crawlign framework, used to crawl websites and extract structured data from parsed pages.

# Requirements
* Golang 1.x - 1.9.x
* Works on Linux, Windows, Mac OSX, BSD

# Installation
Install:

```
go get github.com/weaming/go-scrapy
```

Import:

```golang
import scrapy "github.com/weaming/go-scrapy/scrapy"
```

# Quickstart
```golang
func main() {
  // Init spider configuration
  config := &scrapy.SpiderConfig{
    Name:               "HabraBot",
    MaxDepth:           5,
    ConcurrentRequests: 20,
    StartUrls: []string{
      "https://habrahabr.ru/",
    },
    Rules: []scrapy.Rule{
      {
        LinkExtractor: &scrapy.LinkExtractor{
          Allow:        []string{`^/post/\d+/$`},
          AllowDomains: []string{`^habrahabr\.ru`},
        },
        Follow: true,
      },
      {
        LinkExtractor: &scrapy.LinkExtractor{
          Allow:        []string{`^/users/[^/]+/$`},
          AllowDomains: []string{`^habrahabr\.ru`},
        },
        Handler: ProcessItem,
      },
    },
  }

  // Create new spider
  spider, err := scrapy.NewSpider(config)
  if err != nil {
    panic(err)
  }

  // Run spider and wait
  spider.Wait()
}

// Process crawled page
func ProcessItem(resp *scrapy.Response) {
  log.Println("Process item:", resp.Url, resp.StatusCode)
}
```

# Howto
Please go through [examples of kabelsea/go-scrapy](https://github.com/kabelsea/go-scrapy/tree/master/examples) to get an idea how to use this package.

# Roadmap
  - Middlewares
  - Tests
