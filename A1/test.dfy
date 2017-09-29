// Find minimum element in the array between left and right
function method findMin (a: array<int>, left: int, right: int): int
    reads a;
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    ensures  0 <= left <= right < a.Length;
{
    if (left < right) then 
        if (a[left] < a[right]) then 
            findMin(a, left, right - 1) 
        else findMin(a, left + 1, right) 
    else left
}

method stoogeSort(a: array <int>, left: int, right: int) 
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    requires 0 <= findMin(a, left, right) < a.Length;
    ensures 0 <= left <= right < a.Length;
{
    if (left + 1 >= right) {
        return;
    }
    stoogeSort(a, left, right - 1); 
    stoogeSort(a, left + 1, right);
}

