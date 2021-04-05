package once_test

import (
	"fmt"
	"sync"
	"testing"
	"unsafe"
)

type Singleton struct {
}

var singleInstance *Singleton
var once sync.Once

func GetSingletonInstance() *Singleton {
	once.Do(func() {
		fmt.Println("Create Instance")
		singleInstance = new(Singleton)
	})
	return singleInstance
}

func Test(t *testing.T) {
	var wg sync.WaitGroup
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func() {
			instance := GetSingletonInstance()
			fmt.Printf("%X\n", unsafe.Pointer(instance))
			wg.Done()
		}()
	}
	wg.Wait()
}
