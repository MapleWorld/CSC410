/*
Explanation:
We see that number of tuple that can add up to sum, following the pattern
0,1,2,3,4,5,6,7,8,...,n
There are 1 tuple that can adds up to 0 (0,0)
There are 2 tuple that can adds up to 1 (0,1),(1,0)
There are 3 tuple that can adds up to 2 (0,2),(1,1),(2,0)
There are 4 tuple that can adds up to 3 (0,3),(1,2),(2,1),(3,0)

A tuple (x,y) can be computed given i
By iteratively subtracting i with the sum_of_index (sum_of_index = 0 + 1 + 2 + ...)
Increment the current index during every iteration 

Stop it when i - (sum_of_index + next_index) < 0
Then we can find x and y using equations below
x = i - sum_of_index
y = next_index - x - 1;
Because at this point, sum_of_index is now equal to the lowest index at the given sum
For example,
Index = 8,
sum_of_index = 0 + 1 + 2 + 3 = 6, as i - sum_of_index would then become nagative if we include 4
sum_of_index = 6 which is the lowest starting point for sum 3
x = 8 - 6 = 2
y = 4 - 2 - 1 = 1
(2, 1)

Sum     Index   Tuple
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
function method findXY(sum : nat, next: nat, i : nat): (nat, nat)
requires i >= 0;
requires sum >= 0 && sum <= i;
requires next >= 0;
decreases i - sum - next
ensures sum <= i;
{
    //var x := i - sum;
    //var y := next - x - 1;
    if (sum + next <= i) then findXY(sum + next, next + 1, i) else (i - sum, next - (i - sum) - 1)
}

function method unpair (i: nat ): (nat, nat)
requires i >= 0;
{ // TODO 
    var (x, y) := findXY(0, 0, i);
    var part := (x,y);
    part
}

function method pick (i: nat ): nat
{
    var (x, y) := unpair (i);
    x + i * y
}

function method findFinalIndex(a: nat , b: nat ): nat
{
    ((a + b) * (a + b + 1)) / 2 + a
}

method catchTheSpy (a: nat , b: nat )
requires findFinalIndex(a,b) >= 0;
requires a + findFinalIndex(a,b) * b == pick(findFinalIndex(a,b));
{
    var i := 0;
    while a + i * b != pick (i)
    invariant findFinalIndex(a, b) >= i;
    decreases findFinalIndex(a, b) - i; 
    { 
        i := i + 1; 
    }
}



