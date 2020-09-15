# Go Tutorial

## Installation

We can go to [https://golang.org/dl/](https://golang.org/dl/) and download the binary depending on our Operating System and install it. Once installed run `go version` and you should be able to see the go version.

```bash
$ go version
go version go1.14.1 darwin/amd64
$
```

Once go is installed set `GOPATH` environment variable. On MacOS by default it is set to `${user.home}/go`. We can also add `$GOPATH/bin` to our `PATH`.

```bash
$ export GOPATH=~/go
$ export PATH=$PATH:$GOPATH/bin
```

## Quickstart

### Create New Project

Create a new project directory **hello-go** and **cd** into the directory:

```bash
$ mkdir hello-go & cd hello-go
```

In **hello-go** directory create `hello.go` as follows:

hello.go

```go
package main

import "fmt"

func main() {
   fmt.Println("Hello World!!!")
}

```

Now you can run the application using `go run hello.go` and build the application as executable binary using `go build` as follows:

```bash
hello-go> go run hello.go
Hello World!!!
hello-go> go build
hello-go> ls
hello hello.go
hello-go> ./hello
Hello World!!!
```

We can initialize the hello-go application as a module using `go mod init` command as follows:

```bash
hello-go> go mod init github.com/sivaprasadreddy/hello-go
go: creating new go.mod: module github.com/sivaprasadreddy/hello-go
hello-go> cat go.mod
module github.com/sivaprasadreddy/hello-go

go 1.14
hello-go>
```

We can install 3rd-party dependencies using `go get` command as follows:

```bash
hello-go> go get -u github.com/mitchellh/go-homedir
hello-go> cat go.mod
module github.com/sivaprasadreddy/hello-go

go 1.14

require github.com/mitchellh/go-homedir v1.1.0 // indirect
hello-go>
```

We can use `homedir` module as follows:

hello.go

```go
package main

import (
	"fmt"
	"github.com/mitchellh/go-homedir"
	"os"
)

func main()  {
	fmt.Println("Hello World!!!")
	home, err := homedir.Dir()
	if err != nil {
		fmt.Println("Error: ", err)
		os.Exit(1)
	}
	fmt.Println("My Home directory: ", home)
}
```
