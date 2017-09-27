function method unpair (i: nat ): nat
{ // TODO 


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