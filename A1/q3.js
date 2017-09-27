function unpair(i) {
	var result = findSum(0, 0, i);
	var sum = result[0];
	var next = result[1];
	var x = i - sum;
	var y = next - x - 1;
	var z = ((x + y) * (x + y + 1)) / 2 + x;
	console.log("i = " + i + " x = " + x + " y = " + y + " sum = " + (x + i * y) + " x+y= "+ (x+y) + " z = " + z);
}
//while a + i * b != pick (i)

function findSum(sum, next, i) {
    if (sum + next <= i) {
    	return findSum(sum + next, next + 1, i)
    } else {
    	var result = [sum, next];
    	return result;
    }
}

for (var t = 0; t < 10; t++) {
	unpair(t);
}
//unpair(8);
/*
		Index	
0		0 		0,0
1		1		0,1
1		2		1,0
2		3		0,2
2		4		1,1
2		5		2,0
3		6		0,3
3		7		1,2
3		8		2,1
3		9		3,0
*/








