package string

import (
	"strconv"
	"strings"
	"testing"
)

func Test(t *testing.T) {
	s := "A,B,C"
	parts := strings.Split(s, ",")
	for _, part := range parts {
		t.Log(part)
	}
	t.Log(strings.Join(parts, "-"))
}

func TestConv(t *testing.T) {
	t.Log("str" + strconv.Itoa(10))
	if i, err := strconv.Atoi("10"); err == nil {
		t.Log(10 + i)
	}
}
