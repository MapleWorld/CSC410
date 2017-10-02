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

// function method reverse (x: nat, y: nat): nat
//     decreases x, y
// {
//     if (x == 0 && y == 0) then 0 else
//         if (x > 0 && y >= 0) then 1 + reverse(x - 1, y + 1) else
//             if (x == 0 && y > 0) then 1 + reverse(y - 1, x) else 
//                 0
// }

function method reverse(a: nat , b: nat ): nat
{
    ((a + b) * (a + b + 1)) / 2 + a
}

lemma check(a: nat , b: nat, i: nat)
    requires a >= 0;
    requires b >= 0;
    requires i >= 0;
    ensures reverse(a, b) >= i;
    ensures exists x, y :: i == reverse(x, y) == reverse(a, b) ==> x == unpair(i).0 && y == unpair(i).1;
{

}

method catchTheSpy (a: nat , b: nat )
{
    var i := 0;
    while a + i * b != pick (i)
    invariant reverse(a, b) >= 0;
    decreases reverse(a, b) - i; 
    { 
        check(a, b, i);
        i := i + 1; 
    }
}



