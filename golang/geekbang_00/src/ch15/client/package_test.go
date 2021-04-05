package client_test

import (
	"ch15/series"
	"testing"
)

func Test(t *testing.T) {
	t.Log(series.GetFibonacciSeries(5))
	t.Log(series.Square(5))
}
