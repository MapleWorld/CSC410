method stoogeSort(a: array<int>, left: int, right: int)
  requires a != null;
  requires 0 <= left <= right < a.Length;
  modifies a;
  decreases right - left;
	ensures a[left] <= old(a[left])
	ensures forall i :: 0 <= i < left || right < i < a.Length ==> a[i] == old(a[i])
	ensures forall i :: left <= i <= right ==> exists j :: left <= j <= right && a[i] == old(a[j])
	ensures forall i, j :: left <= i < j <= right ==> a[i] <= a[j]
{
  if (a[left] > a[right])
  {
    // swap a[left] and a[right]
    var tmp := a[left];
    a[left] := a[right];
    a[right] := tmp;
  }
	
  if (left + 1 >= right)
  {
    return;
	}

  stoogeSort(a, left, right - 1);
  stoogeSort(a, left + 1, right);
  stoogeSort(a, left, right - 1);
}
