method stoogeSort(a: array < int > , left: int, right: int) 
    //pre-conditions
    modifies a;
    requires a != null;
    requires a.Length > 0;
    //post-conditions
    ensures forall j,k: int :: 0 <= j < k < a.Length ==> a[j] <= a[k]; // All sorted
{
    if (a[left] > a[right]) {
        // swap a[left] and a[right]
        var tmp: = a[left];
        a[left]: = a[right];
        a[right]: = tmp;
    }
    if (left + 1 >= right)
        return;
    k: = (right - left + 1) div 3;
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