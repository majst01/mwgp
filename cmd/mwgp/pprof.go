//go:build pprof

package main

import (
	"log"
	"net/http"
	_ "net/http/pprof"
)

var pprofListenAddr = "127.0.0.1:6060"

func init() {
	go func() {
		log.Printf("[info] pprof server listen at %s", pprofListenAddr)
		log.Printf("[info] pprof server exit: %v", http.ListenAndServe(pprofListenAddr, nil))
	}()
}
