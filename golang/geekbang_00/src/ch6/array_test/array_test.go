package array_test

import "testing"

func TestArrayInit(t *testing.T) {
	var arr [3]int
	arr1 := [4]int{1, 2, 3, 4}
	arr2 := [...]int{1, 2, 3, 4, 5}
	arr[1] = 5
	t.Log(arr[1], arr[2])
	t.Log(arr1, arr2)
}

func TestArrayTravel(t *testing.T) {
	arr3 := [...]int{1, 2, 3, 4, 5}
	for _, val := range arr3 {
		t.Log(val)
	}
}

func TestArraySlice(t *testing.T) {
	arr := [...]int{1, 2, 3, 4, 5}
	arr1_section := arr[:3]
	arr2_section := arr[2:]
	t.Log(arr1_section, arr2_section)
}
