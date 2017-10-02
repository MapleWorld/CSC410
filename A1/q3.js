function unpair(i) {
	var result = findSum(0, 0, i);
	var sum = result[0];
	var next = result[1];
	var x = i - sum;
	var y = next - x - 1;
	var z = ((x + y) * (x + y + 1)) / 2 + x;
	console.log("i = " + i + " x = " + x + " y = " + y + " sum = " + (x + i * y) + " x+y= "+ (x+y) + " z = " + z);
}

function findSum(sum, next, i) {
    if (sum + next <= i) {
        return findSum(sum + next, next + 1, i)
    } else {
        var result = [sum, next];
        return result;
    }
}


function unpair1(i) {
    if (i == 0) { 
        return [0, 0];
    } else {
        var [p, q] = unpair1(i - 1); 
    }
        
    if (q > 0) {
        return [p + 1, q - 1];
    }  else {
        return [q, p + 1];
    }
}

function reverse(x, y) {
    if (x == 0 && y == 0) {
        return 0;
    }

    if (x > 0 && y >= 0) {
        return 1 + reverse(x - 1, y + 1);
    }

    if (x == 0 && y > 0) {
        return 1 + reverse(y - 1, x);
    }
}

function reverse1(x, y) {
    if (x == 0 && y == 0) {
        return 0;
    } else {
        if (x > 0 && y >= 0) {
            return 1 + reverse1(x - 1, y + 1);
        } else {

            if (x == 0 && y > 0) {
                return 1 + reverse1(y - 1, x);
            } else {
                return 0;
            }
        }
    }
}

for (var t = 0; t < 10; t++) {
	var gg = unpair1(t);
    console.log(t + " " + gg[0] + "," + gg[1] + " " + reverse1(gg[0], gg[1]));
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








