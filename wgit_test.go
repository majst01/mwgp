package mwgp

import "testing"

func BenchmarkWireGuardIndexTranslationTable_generateProxyIndexLocked(b *testing.B) {
	table := NewWireGuardIndexTranslationTable()
	for i := 0; i < b.N; i++ {
		n := table.generateProxyIndexLocked(table.serverMap, 0)
		table.serverMap[n] = nil
	}
	b.Logf("len(serverMap) = %d", len(table.serverMap))
	table.serverMap = make(map[uint32]*Peer)
}
