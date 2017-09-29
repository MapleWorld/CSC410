// Find minimum element in the array between left and right
function method findMax (a: array<int>, left: int, right: int): int
    reads a;
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    ensures  0 <= left <= right < a.Length;
    ensures 0 <= findMax(a, left, right) < a.Length;
{
    if (left < right) then 
        if (a[left] < a[right]) then 
            findMax(a, left + 1, right) 
        else findMax(a, left, right - 1) 
    else 0
}

method random(a: array <int>, left: int, right: int) 
    decreases right - left;
    requires a != null && a.Length > 0;
    requires 0 <= left <= right < a.Length;
    requires 0 <= findMax(a, left, right) < a.Length;
    ensures 0 <= left <= right < a.Length;
{
    if (left + 1 >= right) {
        return;
    }
    random(a, left, right - 1); 
    random(a, left + 1, right);
}
