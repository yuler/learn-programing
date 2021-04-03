package constant_test

import "testing"

const (
	Monday = iota + 1
	Tuesday
	Wednesday
)

const (
	Readable = 1 << iota
	Writable
	Executable
)

func TestConstantsTry(t *testing.T) {
	t.Log(Monday, Tuesday, Wednesday)
}

func TestConstantsTry1(t *testing.T) {
	a := 7 // 0111
	t.Log(a&Readable == Readable, a&Writable == Writable, a&Executable == Executable)
}
