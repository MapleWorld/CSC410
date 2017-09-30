predicate sorted(a:array<int>, min:int, max:int)
requires a != null;
requires 0 <= min <= max < a.Length;
reads a;
{
    forall j, k :: min <= j < k < max ==> a[j] <= a[k]
}

// Find maximum element in the array between left and right
function method findMax (a: array<int>, left: int, right: int): int
    reads a;
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    ensures  0 <= left <= right < a.Length;
    ensures  left <= findMax(a, left, right) <= right;
    ensures forall i :: left <= i <= right ==> a[i] <= a[findMax(a, left, right)];
{
    if (left < right) then 
        if (a[left] < a[right]) then 
            findMax(a, left + 1, right) 
        else findMax(a, left, right - 1) 
    else right
}

// Find minimum element in the array between left and right
function method findMin (a: array<int>, left: int, right: int): int
    reads a;
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    ensures  0 <= left <= right < a.Length;
    ensures  left <= findMin(a, left, right) <= right;
    ensures forall i :: left <= i <= right ==> a[i] >= a[findMin(a, left, right)];
{
    if (left < right) then 
        if (a[left] < a[right]) then 
            findMin(a, left, right - 1) 
        else findMin(a, left + 1, right) 
    else left
}

method stoogeSort(a: array <int>, left: int, right: int)
    modifies a;
    requires a != null;
    requires a.Length > 0;
    requires 0 <= left <= right < a.Length;
    requires 0 <= findMin(a, left, right) < a.Length;
    requires 0 <= findMax(a, left, right) < a.Length;
    
    ensures sorted(a, left, right);
    ensures a[left] <= a[right];

    ensures forall i :: (0 <= i < left || right < i < a.Length) ==> a[i] == old(a[i]);
    ensures a[left] == a[findMin(a, left, right)];
    ensures a[right] == a[findMax(a, left, right)];

    ensures a[findMin(a, left, right)] <= old(a[left]);
    ensures a[findMin(a, left, right)] >= old(a[findMin(a, left, right)]);
    ensures a[findMax(a, left, right)] >= old(a[right]);
    ensures a[findMax(a, left, right)] <= old(a[findMax(a, left, right)]);

    decreases right - left;
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
    stoogeSort(a, left, right - 1);
    stoogeSort(a, left + 1, right);
    stoogeSort(a, left, right - 1);
}