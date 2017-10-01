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
    
    //ensures sorted(a, left, right);
    // Exact same as test.dfy
    ensures a[left] <= a[right];

    ensures forall i :: (0 <= i < left || right < i < a.Length) ==> a[i] == old(a[i]);
    ensures a[left] == a[findMin(a, left, right)];
    ensures a[right] == a[findMax(a, left, right)];
    ensures sorted(a,left,right);
    ensures a[findMin(a, left, right)] <= old(a[left]);
    ensures a[findMin(a, left, right)] >= old(a[findMin(a, left, right)]);
    ensures a[findMax(a, left, right)] >= old(a[right]);
    ensures a[findMax(a, left, right)] <= old(a[findMax(a, left, right)]);

    // New ensures code, temp.dfy contains some sample ensure to test, no idea if it works
    // Note: new ensures code is really slow to compile
    ensures a[findMin(a, left, right)] <= a[findMin(a, left + ((right - left + 1) / 3), right)];
    ensures a[findMin(a, left, right)] >= a[findMin(a, left, right - ((right - left + 1) / 3))];
    ensures a[findMax(a, left, right)] >= a[findMax(a, left + ((right - left + 1) / 3), right)];
    ensures a[findMax(a, left, right)] <= a[findMax(a, left, right - ((right - left + 1) / 3))];

   // ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= old(a[left]);
    ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= old(a[findMin(a, left, right)]);

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
    var k := (right - left + 1) / 3;
    stoogeSort(a, left, right - k); // First two-thirds
    stoogeSort(a, left + k, right); // Last two-thirds
    stoogeSort(a, left, right - k); // First two-thirds again
}


/*
Note from professor in 2013 year
After each recursive call, I know that 
- a[left .. right] is sorted. 
- a[1 .. left-1] and a[right+1 .. a.length - 1 ] is unchanged (you can use "old" for this)
- a[left] is the minimum of a[left .. right] range
- a[right] is the maximum of a[left .. right] range

These, all of you agree with trivially. You just may or may not have forgotten to include all the facts in your argument.
The more interesting facts are:
- sorting does not affect the value of the minimum of the interval being sorted.
- sorting does not affect the value of the maximum of the interval being sorted. 

You are not supposed to use old over the whole array. The fact that it passes is because the content of "a", 
which is just the address at which the array is stored, doesn't really change when you make changes inside the array. 
You are supposed to use "old" over elements of the array (or groups of them). For example:
When I soft from left to right, and want to say that the rest of the elements do not change, I would say (not the correct syntax):
forall k > right, a[k] == old(a[k])
*/