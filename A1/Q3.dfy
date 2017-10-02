function method unpair (i: nat ): (nat, nat)
requires i >= 0;
decreases i;
{ 
    if (i == 0) then (0, 0) else 
        var (p, q) := unpair(i - 1); 
        if (q > 0) then (p + 1, q - 1) else (q, p + 1)
    //assert unpair(i) == unpair(reverse(unpair(i)));
}

function method reverse (x: nat, y: nat): nat
    decreases x+y, x

{
    if (x == 0 && y == 0) then 0 else
        if (x > 0 && y >= 0) then 1 + reverse(x - 1, y + 1) else
            if (x == 0 && y > 0) then 1 + reverse(y - 1, x) else 
                0
}


lemma existz(x: nat, y: nat)
  ensures exists z :: z>=0 && x + z * y == pick(z)
{
    if (x == 0 && y == 0){
        var z:= reverse(x, y);
        assert x + z * y == pick(z);
    }else if (x > 0 && y >= 0){
        var z := reverse(x - 1, y + 1);
        calc == {
        unpair(z) == (x - 1, y + 1); 
        unpair(z+1) == (x,y);
        x + (z+1) * y == pick(z+1); //{assert unpair(z+1) == (x,y) ==> x + (z+1) * y == pick(z+1);}
        }
        //assert 0 ==1;
    }
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
//requires findFinalIndex(a,b) >= 0;
//requires a + findFinalIndex(a,b) * b == pick(findFinalIndex(a,b));
ensures exists x:: x>=0 &&  a + x * b == pick(x);
{
    var i := 0;
    while a + i * b != pick (i)
    invariant reverse(a, b) >= i;
    decreases reverse(a, b) - i; 
    { 
        i := i + 1; 
        assume exists z :: z==reverse(a,b) && a + z * b == pick(z);
    }
}

