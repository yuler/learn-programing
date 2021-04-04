package panic_test

import (
	"errors"
	"fmt"
	"testing"
)

func TestPanicVsExit(t *testing.T) {
	defer func() {
		if err := recover(); err != nil {
			fmt.Println("recovered from", err)
		}
	}()
	fmt.Println("Start")
	panic(errors.New("Something wrong!"))
	// os.Exit(-1)
}
