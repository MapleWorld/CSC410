predicate sorted(a:array<int>, min:int, max:int)
requires a != null;
requires 0 <= min <= max <= a.Length;
reads a;
{
    forall j, k :: min <= j < k < max ==> a[j] <= a[k]
}

// Find the smaller one, a[left] or a[right]
function min (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
{
    if (a[left] > a[right]) then a[right] else a[left]
}

// Find the bigger one, a[right] or a[left]
function max (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
{
    if (a[left] > a[right]) then a[left] else a[right]
}

// Find minimum element in the array between left and right
function findMin (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
    decreases right - left;
{
    if (left == right) then a[left] else 
        if (a[left] < a[right]) then findMin(a, left, right - 1) else findMin(a, left + 1, right)
}

// Find maximum element in the array between left and right
function findMax (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
    decreases right - left;
{
    if (left == right) then a[left] else 
        if (a[left] < a[right]) then findMax(a, left + 1, right) else findMax(a, left, right - 1)
}

method stoogeSort(a: array <int>, left: int, right: int) 
    decreases left;
    decreases right;
    requires a != null;
    requires a.Length > 0;
    requires 1 <= left <= right <= a.Length - 1;
    modifies a;
    ensures sorted(a, left, right);
    ensures forall i :: (0 <= i < left || right < i < a.Length) ==> a[i] == old(a[i]);
    ensures a[left] == findMin(a,left,right);
    ensures a[right] == findMax(a,left,right);
    ensures findMin(a, left, right) == old(findMin(a, left, right));
    ensures findMax(a, left, right) == old(findMax(a, left, right));
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



// method max (a: array<int>) returns (max: nat)
//     requires a != null && a.Length > 0;
//     ensures forall j:: 0 <= j < a.Length ==> a[j] <= max;
//     ensures exists j:: 0 <= j < a.Length && a[j] == max;
// {
//     max := 0;
//     var i := 0;

//     while (i < a.Length)
//         invariant 0 <= i <= a.Length;
//         invariant forall j:: 0<=j<i ==> a[j] <= max;
//         invariant i!=0 ==> exists j:: 0<=j<i && a[j]==max;
//         invariant i==0 ==> a[0] >= max;
//     {
//         if (a[i] > max) {
//             max := a[i]; 
//         }
//         i := i + 1;
//     }
// }

// method min (a: array<int>) returns (max: nat)
//     requires a != null && a.Length > 0;
//     ensures forall j:: 0<=j<a.Length ==> a[j] <= max;
//     ensures exists j:: 0<=j<a.Length && a[j]==max;
// {
//     max := 0;
//     var i := 0;

//     while (i < a.Length)
//         invariant 0 <= i <= a.Length;
//         invariant forall j:: 0<=j<i ==> a[j] <= max;
//         invariant i!=0 ==> exists j:: 0<=j<i && a[j]==max;
//         invariant i==0 ==> a[0] >= max;
//     {
//         if (a[i] > max) {
//             max := a[i]; 
//         }
//         i := i + 1;
//     }
// }
