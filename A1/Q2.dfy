predicate sorted(a:array<int>, min:int, max:int)
requires a != null;
requires 0 <= min <= max <= a.Length;
reads a;
{
    forall j, k :: min <= j < k < max ==> a[j] <= a[k]
}

function min (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
{
    if (a[left] > a[right]) then a[right] else a[left]
}

function max (a: array<int>, left: int, right: int): int
    requires a != null && a.Length > 0;
    requires 0 < left <= right < a.Length;
    reads a;
{
    if (a[left] > a[right]) then a[left] else a[right]
}

method stoogeSort(a: array <int>, left: int, right: int) 
    requires a != null;
    requires a.Length > 0;
    requires 1 <= left <= right <= a.Length - 1;
    modifies a;
    ensures sorted(a, left, right);
    ensures forall i :: (0 <= i < left || right < i < a.Length) ==> a[i] == old(a[i]);
    ensures a[left] == min(a,left,right);
    ensures a[right] == max(a,left,right);
    ensures min(a, left, right) == old(min(a, left, right));
    ensures max(a, left, right) == old(max(a, left, right));
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

// method min (a: array<int>, left: int, right: int) returns (min: int)
//     requires a != null && a.Length > 0;
//     requires left <= right <= a.Length;
//     ensures a[left] <= a[right];
// {
//     if (a[left] > a[right]) {
//         min := a[right];
//     } else {
//         min := a[left];
//     }
// }

//  method max (a: array<int>, left: int, right: int) returns (max: int)
//     requires a != null && a.Length > 0;
//     requires left <= right <= a.Length;
//     ensures a[left] <= a[right];
// {
//     if (a[left] > a[right]) {
//         max := a[left];
//     } else {
//         max := a[right];
//     }
// }