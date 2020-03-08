# goreleaser-xcgo

[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=for-the-badge)](/LICENSE.md)
[![Travis](https://img.shields.io/travis/com/mailchain/goreleaser-xcgo/master.svg?style=for-the-badge)](https://travis-ci.com/mailchain/goreleaser-xcgo)

Docker container to do cross compilation (linux, windows, OSX) of go packages including support for cgo. Created for [Mailchain](https://github.com/mailchain/mailchain) can be used with any go project.

## Docker

Find it on docker hub https://hub.docker.com/r/mailchain/goreleaser-xcgo or run

```bash
docker run --rm --privileged \
  -v $PWD:/go/src/github.com/mailchain/mailchain \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /go/src/github.com/mailchain/mailchain \
  mailchain/goreleaser-xcgo --snapshot --rm-dist
```

## Travis

To see an example of it running in travis check out https://github.com/mailchain/mailchain/blob/master/.travis.yml
