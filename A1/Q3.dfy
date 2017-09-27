/*
MathUtils.reverseCantorPair = function(i)
{
    var pair = [];
    var t = Math.floor((-1 + Math.sqrt(1 + 8 * i))/2);
    var x = t * (t + 3) / 2 - i;
    var y = i - t * (t + 1) / 2;
    pair[0] = x;
    pair[1] = y;
    return pair;
}

*/
/*
How the sqrt function works:
Guess a number, in this case we use 'x'
Check if x * x > target,
If it is, then find a new value that is the average of 'x' and the target number
Check the new value recursively 
Return 'x' if the product of itself is lower than the target value

Check https://leetcode.com/problems/sqrtx/discuss/
For iterative implementation of the sqrt function 
*/
function method sqrt(x: nat, target: nat): nat
{
    if (x * x > target) then sqrt(((x + target / x) / 2), target) else x
}

function method floor(x: nat): nat
{
    var n := x - (x % 1);
    x
}

function method unpair (i: nat ): nat
{ // TODO 
    var t := floor((-1 + sqrt(1 + 8 * i, 1 + 8 * i))/2);
    var x := t * (t + 3) / 2 - i;
    var y := i - t * (t + 1) / 2;
    var part := (x,y);
    part
}

function method pick (i: nat ): nat
{
    var (x, y) := unpair (i);
    x + i * y
}

method catchTheSpy (a: nat , b: nat )
{
    var i := 0;
    while a + i * b != pick (i)
    { 
        i := i + 1; 
    }
}
