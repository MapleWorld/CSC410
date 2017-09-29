function min(a, left, right) {
    if (a[left] > a[right]) {
        return a[right];
    } else {
        return a[left];
    }
}

var a = [1,3,6,8,2,9,10,4,0];
console.log(a[1,2]);