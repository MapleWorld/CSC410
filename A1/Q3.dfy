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
    // Will compile if I change to 6
    //6
}

method catchTheSpy (a: nat , b: nat )
requires findFinalIndex(a,b) >= 0;
requires findFinalIndex(a,b) == pick(findFinalIndex(a,b))
{
    var i := 0;
    var z := findFinalIndex(a, b);
    while a + i * b != pick (i)
    invariant z >= i;
    //invariant (a + b) >= findXYSum(i); 
    //decreases ((a + b) - findXYSum(i)), findY(i); 
    decreases z - i; 
    { 
        i := i + 1; 
    }
}





// Testing methods
function method findXYSum(i: nat): nat
{
    var (x, y) := unpair (i);
    x + y
}

function method findY(i: nat): nat
{
    var (x, y) := unpair (i);
    y
}

