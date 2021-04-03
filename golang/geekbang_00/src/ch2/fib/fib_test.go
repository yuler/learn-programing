package fib

import (
	"fmt"
	"testing"
)

func TestFibList(t *testing.T) {
	a := 1
	b := 1
	fmt.Println(" ", a)
	for i := 0; i < 5; i++ {
		fmt.Println(" ", b)
		tmp := a
		a = b
		b = tmp + a
	}
}

func TestExchange(t *testing.T) {
	a := 1
	b := 2
	a, b = b, a
	fmt.Println(a, b)
}
