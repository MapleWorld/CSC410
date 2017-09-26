predicate sorted(a:array<int>, min:int, max:int)
requires a != null;
requires 0<= min <= max <= a.Length;
reads a;
{
  forall j, k :: min <= j < k < max ==> a[j] <= a[k]
}

method insertSort(a : array<int>)
    //pre-conditions
    modifies a;
    requires a != null;
    requires a.Length > 0;
    //post-conditions
    ensures sorted(a, 0, a.Length);
    ensures forall j,k: int :: 0 <= j < k < a.Length ==> a[j] <= a[k]; // All sorted
{
    var i := 1;
    while (i < a.Length)
        invariant 0 <= i <= a.Length <==> a.Length > 0;
        invariant sorted(a, 0, i);
    {
        
        var j := i;
        var value := a[i];
        a[i] := a[i-1];
        while (j > 0 && a[j-1] > value)
            invariant sorted(a,0,i+1);
            invariant j < i ==> forall k,l:: 0 <= k <= l <= i ==> a[k] <= a[l];
            invariant forall k :: j-1 < k < i ==> a[k]> value;
        {
            assume j > 0 && a[j-1] > value;
            a[j] := a[j-1];
            j := j - 1;
        }
        assume j <= 0 || a[j-1] <= value;
        a[j] := value;
        i := i + 1;
    }
}

method insertSort1(a : array<int>)
requires a != null && a.Length >= 1;
ensures sorted(a,0,a.Length);
modifies a;
{
    var i := 1;
    while (i < a.Length)
    invariant 1 <= i <= a.Length;
    invariant sorted(a,0,i);
  {
        var j := i;
        var value := a[i];
        a[i] := a[i-1];
        while (j > 0 && a[j-1] > value)
        invariant sorted(a,0,i+1);
        invariant forall k :: j-1 < k < i ==> a[k]> value;
        {
            a[j] := a[j-1];
            j := j - 1;
        }
    a[j] := value;
    i := i + 1;
    }
}



/*
[23,42,4,16,8,15]

When i and j = 2
a[2] = 4 = value
a[j-1] = 42
a[j-1] > value 

[23,42,42,16,8,15]
[23,23,42,16,7,15]
[4,23,42,16,7,15]
*/