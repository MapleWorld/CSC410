function method unpair (i: nat ): (nat, nat)
requires i >= 0;
decreases i;
{ 
    if (i == 0) then (0, 0) else var (p, q) := unpair(i - 1); 
    if (q > 0) then (p + 1, q - 1) else (q, p + 1)
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
