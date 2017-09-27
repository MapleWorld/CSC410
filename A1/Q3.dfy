function method findSum(sum : nat, next: nat, i : nat): (nat, nat)
requires i >= 0;
requires sum >= 0 && sum <= i;
requires next >= 0;
decreases i - sum - next
ensures sum <= i;
{
    //var x := i - sum;
    //var y := next - x - 1;
    if (sum + next <= i) then findSum(sum + next, next + 1, i) else (i - sum, next - (i - sum) - 1)
}

function method unpair (i: nat ): (nat, nat)
requires i >= 0;
{ // TODO 
    var (x, y) := findSum(0, 0, i);
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
    invariant (a + b) >= findXYSum(i);
    decreases ((a + b) - findXYSum(i)), findY(i); 
    { 
        i := i + 1; 
    }
}

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
// a + i * b == x + i * y


