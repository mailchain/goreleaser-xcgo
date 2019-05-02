# goreleaser-xcgo

![Travis](https://travis-ci.com/mailchain/goreleaser-xcgo.svg?branch=master!:https://travis-ci.com/mailchain/goreleaser-xcgo)

Docker container to do cross compilation (linux, windows, OSX) of go packages including support for cgo. Created for [Mailchain](https://github.com/mailchain/mailchain) can be used with any go project.

Find it on docker hub https://cloud.docker.com/u/mailchain/repository/docker/mailchain/goreleaser-xcgo or run 
```
docker run --rm --privileged \
  -v $PWD:/go/src/github.com/mailchain/mailchain \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /go/src/github.com/mailchain/mailchain \
  mailchain/goreleaser-xcgo goreleaser --snapshot --rm-dist
```
