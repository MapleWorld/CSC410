
function findMin(a, left, right) {
    if (left < right)  {
        if (a[left] < a[right]) { 
            return findMin(a, left, right - 1);
        } else {
            return findMin(a, left + 1, right);
        }
    } else {
        return left;
    }
}

function stoogeSort(a, left, right) {
    console.log("Find min index = " + findMin(a, left, right) );
    console.log("Array = " + a);
    console.log("Left = " + left + " Right = " + right + " Ele = " + a[findMin(a, left, right)]);
    if (a[left] > a[right]) {
        var tmp = a[left];
        a[left] = a[right];
        a[right] = tmp;
    }
    if (left + 1 >= right) {
        return;
    }
    var k = Math.floor((right - left + 1) / 3);
    stoogeSort(a, left, right - k); // First two-thirds
    stoogeSort(a, left + k, right); // Last two-thirds
    stoogeSort(a, left, right - k); // First two-thirds again
}


var a = [1,2,7,2,8,0,10];
var a = [2, 4, 5, 3, 1];
stoogeSort(a, 0, a.length - 1);
console.log(a);