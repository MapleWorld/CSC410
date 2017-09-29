method stoogeSort(a : array<int>, left : int, right : int)
{

    if (a[left] > a[right]) {
        // swap a[left] and a[right]
        var tmp := a[left];
        a[left] := a[right];
        a[right] := tmp;
    }
    if (left + 1 >= right) {
        return;
    }
    var k := (right - left + 1) / 3;
    stoogeSort(a,left, right - k); // First two-thirds
    stoogeSort(a,left + k, right); // Last two-thirds
    stoogeSort(a,left, right - k); // First two-thirds again
}