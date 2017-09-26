predicate sorted(a:array<int>, min:int, max:int)
requires a != null;
requires 0 <= min <= max <= a.Length;
reads a;
{
    forall j, k :: min <= j < k < max ==> a[j] <= a[k]
}

method stoogeSort(a: array <int>, left: int, right: int) 
    modifies a;
    requires a != null;
    requires a.Length > 0;
    requires 1 <= left <= right <= a.Length - 1;
    ensures sorted(a, left, right);
    ensures forall i ::( 0 <= i < left || right < i < a.Length) ==> a[i] == old(a[i]);
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
    stoogeSort(a, left, right - k); // First two-thirds
    stoogeSort(a, left + k, right); // Last two-thirds
    stoogeSort(a, left, right - k); // First two-thirds again
}
