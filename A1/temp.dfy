    //ensures sorted(a, left, right);
    /*
        Making sure that whenever spawing happens
        Only because it found an element that is smaller/bigger than previous ones
        a[left] <= a[right] wouldn't work witout it
        As we might swap a[left] or a[right] again during the recursive call 
    -*/
    // ensures left <= right;
    // ensures a[left] <= old(a[left]);
    // ensures a[left] <= old(a[right]);
    // ensures a[right] >= old(a[right]);
    // ensures a[right] >= old(a[left]);
    // ensures a[left] <= a[findMin(a, left, right)];
    // ensures a[right] >= a[findMax(a, left, right)];
    // ensures a[left] >= old(a[findMin(a, left, right)]);
    // ensures a[right] <= old(a[findMax(a, left, right)]);
    



    //ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= old(a[left]);
    //ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= old(a[findMin(a, left, right)]);

    // ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= a[findMin(a, left, right - ((right - left + 1) / 3))]
    // ensures a[findMin(a, left, right - ((right - left + 1) / 3))] <= old(a[left]);

    // ensures a[findMin(a, left + ((right - left + 1) / 3), right)] <= old(a[left + ((right - left + 1) / 3)]);
    // ensures a[findMin(a, left + ((right - left + 1) / 3), right)] <= old(a[findMin(a, left + ((right - left + 1) / 3), right)]);
    // ensures a[findMin(a, left, right)] >= old(a[findMin(a, left, right - ((right - left + 1) / 3))]);

    // ensures a[findMax(a, left, right)] >= old(a[right]);
    // ensures a[findMax(a, left, right)] <= old(a[findMax(a, left, right)]);

    // requires a[left] > a[right] ==> (left + 1) <= right;
    // requires 0 <= (right - left + 1) / 3 <= a.Length;
    // requires 0 <= right - ((right - left + 1) / 3) <= a.Length;
    // requires 0 <= left + ((right - left + 1) / 3) <= a.Length;

    // ensures 0 <= (right - left + 1) / 3 <= a.Length;
    // ensures 0 <= right - ((right - left + 1) / 3) <= a.Length;
    // ensures 0 <= left + ((right - left + 1) / 3) <= a.Length;

    // ensures a[left] <= a[findMin(a, left, right - ((right - left + 1) / 3))];
    // ensures a[left] <= a[findMin(a, left + ((right - left + 1) / 3), right)];
    // ensures a[left] >= old(a[findMin(a, left, right - ((right - left + 1) / 3))]);
    // ensures a[left] >= old(a[findMin(a, left + ((right - left + 1) / 3), right)]);

    // ensures a[right] >= a[findMax(a, left, right - ((right - left + 1) / 3))];
    // ensures a[right] >= a[findMax(a, left + ((right - left + 1) / 3), right)];
    // ensures a[right] >= old(a[findMax(a, left, right - ((right - left + 1) / 3))]);
    // ensures a[right] >= old(a[findMax(a, left + ((right - left + 1) / 3), right)]);

    // ensures a[findMin(a, left + ((right - left + 1) / 3), right)] >= old(a[findMin(a, left + ((right - left + 1) / 3), right)]);
    // ensures a[findMin(a, left, right - ((right - left + 1) / 3))] >= old(a[findMin(a, left, right - ((right - left + 1) / 3))]);
    // ensures a[findMax(a, left + ((right - left + 1) / 3), right)] <= old(a[findMax(a, left  + ((right - left + 1) / 3), right)]);
    // ensures a[findMax(a, left, right - ((right - left + 1) / 3))] <= old(a[findMax(a, left, right - ((right - left + 1) / 3))]);















    // Find the bigger one, a[left] or a[right]
// function method max (a: array<int>, left: int, right: int): int
//     requires a != null && a.Length > 0;
//     requires 0 < left <= right < a.Length;
//     reads a;
// {
//     if (a[left] > a[right]) then left else right
// }

// // Find the smaller one, a[left] or a[right]
// function method min (a: array<int>, left: int, right: int): int
//     requires a != null && a.Length > 0;
//     requires 0 < left <= right < a.Length;
//     reads a;
// {
//     if (a[left] > a[right]) then right else left
// }
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

// method findMin1 (a: array<int>) returns (min: int)
//     requires a != null && a.Length > 0;
//     ensures forall j:: 0<=j<a.Length ==> a[j] <= min;
//     ensures exists j:: 0<=j<a.Length && a[j]==min;
// {
//     min := 0;
//     var i := 0;

//     while (i < a.Length)
//         invariant 0 <= i <= a.Length;
//         invariant forall j:: 0<=j<i ==> a[j] <= min;
//         invariant i!=0 ==> exists j:: 0<=j<i && a[j]==min;
//         invariant i==0 ==> a[0] >= min;
//     {
//         if (a[i] > min) {
//             min := a[i]; 
//         }
//         i := i + 1;
//     }
// }
