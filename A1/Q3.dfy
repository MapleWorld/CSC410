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
How the sqrt function w==orks:
Guess a number, in this case we use 'x'
Check if x * x > target,z
If it is, then find a new value that is the average of 'x' and the target number
Check the new value recursively 
Return 'x' if the product of itself is lower than the target value

Check https://leetcode.com/problems/sqrtx/discuss/
For iterative implementation of the sqrt function 
*/
function method findSum(sum : nat, next: nat, i : nat): (nat, nat)
requires i >= 0;
requires sum >= 0 && sum <= i;
requires next >= 0;
decreases i - sum - next
ensures sum <= i;
{
    if (sum + next <= i) then findSum(sum + next, next + 1, i) else (sum, next)
}
function method substract(a :nat, b : nat): nat
requires a >= b;
{
    a - b
}

function method unpair (i: nat ): (nat, nat)
requires i >= 0;
{ // TODO 
    var (sum, next) := findSum(0, 0, i);
    var x := i - sum;
    //var x := substract(i, sum);
    //var y := next - x - 1;
    var y:= 2;
    var part := (x, y);
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