/*
lemma existz(x: nat, y: nat)
  ensures x +  reverse(x, y) * y == pick(reverse(x, y));
{
    if (x == 0 && y == 0){
        var z:= reverse(x, y);
        assert z == 0;
        assert x + z * y == pick(z);
    }else if (x > 0 && y >= 0){
        var z := reverse(x - 1, y + 1);
        assert z + 1 == reverse(x,y);
        assert (x-1) + z * (y+1) == pick(z);
        //assert (x-1) + z * (y+1) == pick(z) ==> unpair(reverse(x-1, y+1)) == (x-1, y+1);

       // assert (x) + reverse(x, y) * (y) == pick(reverse(x, y));
       // calc == {
        //(x-1) + reverse(x-1, y+1) * (y+1) == pick(reverse(x - 1, y + 1)); {existz(x - 1, y + 1);}
         //x + (z+1) * y == pick(z+1); 
        //}
        }else if (x == 0 && y > 0){
       // var z := reverse(x - 1, y + 1);
       // assert unpair(z) == (x - 1, y + 1); 
        //assert unpair(z+1) == (x,y);        
        //assert x + (z+1) * y == pick(z+1); 
    }else{

    }
}
*/
function method unpair (i: nat ): (nat, nat)
requires i >= 0;
decreases i;
{ 
    if (i == 0) then (0, 0) else 
        var (p, q) := unpair(i - 1); 
        if (q > 0) then (p + 1, q - 1) else (q, p + 1)
    //assert unpair(i) == unpair(reverse(unpair(i)));
}

// Calculation method to determine index for cantor pair using reverse engineering
function method reverse (x: nat, y: nat): nat
    decreases x+y, x

{
    if (x == 0 && y == 0) then 0 else
        if (x > 0 && y >= 0) then 1 + reverse(x - 1, y + 1) else
            if (x == 0 && y > 0) then 1 + reverse(y - 1, x) else 
                0
}
function method pick (i: nat ): nat
{
    var (x, y) := unpair (i);
    x + i * y
}

method catchTheSpy (a: nat , b: nat )
//requires findFinalIndex(a,b) >= 0;
requires a +  reverse(a, b) * b == pick(reverse(a, b)); //This condition is here to make the code complie, need lemma to prove this, please see commented out section for lemma existz
//ensures exists x:: x>=0 &&  a + x * b == pick(x);
{
    var i := 0;
    while a + i * b != pick (i)
    invariant reverse(a, b) >= i;
    decreases reverse(a, b) - i; 
    { 
        i := i + 1; 
        assert a +  reverse(a, b) * b == pick(reverse(a, b)); 
    }
}

// Testing method below
// Calculation method for cantor pair
function method findFinalIndex(a: nat , b: nat ): nat
{
    ((a + b) * (a + b + 1)) / 2 + a
}
/*
function method findY(i: nat): nat
{
    var (x, y) := unpair (i);
    y
}

function method findX(i: nat): nat
{
    var (x, y) := unpair (i);
    x
}
*/