predicate subseqBy(xs: seq<int>, ys: seq<int>, ixs: seq<int>)
{
	|ixs| == |xs|
		&& (forall i | 0 <= i < |ixs| :: 0 <= ixs[i] < |ys| && ys[ixs[i]] == xs[i])
		&& (forall i, j | 0 <= i < j < |ixs| :: ixs[i] < ixs[j])
}

predicate subseq(xs: seq<int>, ys: seq<int>)
{
	exists ixs :: subseqBy(xs, ys, ixs)
}

lemma lemma0(xs: seq<int>, ys: seq<int>)
	requires xs == [] || ys == []
	ensures forall ws | subseq(ws, xs) && subseq(ws, ys) :: ws == []
{
	forall ws | subseq(ws, xs) && subseq(ws, ys)
		ensures ws == []
	{
		if xs == []
		{
			var ixs :| subseqBy(ws, xs, ixs);
			if ws != []
			{
				assert 0 <= ixs[0] < 0;
				assert false;
			}			
		}
		else
		{
			assert ys == [];
			var ixs :| subseqBy(ws, ys, ixs);
			if ws != []
			{
				assert 0 <= ixs[0] < 0;
				assert false;
			}
		}
	}
}

lemma lemma1(xs: seq<int>, ys: seq<int>, zs: seq<int>)
	requires xs != [] && ys != [] && xs[|xs| - 1] == ys[|ys| - 1]
	requires forall ws | subseq(ws, xs[..|xs|-1]) && subseq(ws, ys[..|ys|-1]) :: |ws| <= |zs|
	ensures forall ws | subseq(ws, xs) && subseq(ws, ys) :: |ws| <= |zs| + 1
{
	forall ws | subseq(ws, xs) && subseq(ws, ys)
		ensures |ws| <= |zs| + 1
	{
		var ixs0 :| subseqBy(ws, xs, ixs0);
		var ixs1 :| subseqBy(ws, ys, ixs1);

		if ws != []
		{
			assert forall i | 0 <= i < |ixs0| - 1 :: ixs0[i] < ixs0[|ixs0| - 1];
			assert forall i | 0 <= i < |ixs1| - 1 :: ixs1[i] < ixs1[|ixs1| - 1];
			assert subseqBy(ws[..|ws|-1], xs[..|xs|-1], ixs0[..|ixs0|-1]);
			assert subseqBy(ws[..|ws|-1], ys[..|ys|-1], ixs1[..|ixs1|-1]);
			assert |ws| <= |zs| + 1;
		}
	}
}

lemma lemma2(xs: seq<int>, ys: seq<int>, zs0: seq<int>, zs1: seq<int>)
	requires xs != [] && ys != [] && xs[|xs| - 1] != ys[|ys| - 1] && |zs0| >= |zs1|
	requires forall ws | subseq(ws, xs) && subseq(ws, ys[..|ys|-1]) :: |ws| <= |zs1|
	requires forall ws | subseq(ws, xs[..|xs|-1]) && subseq(ws, ys) :: |ws| <= |zs0|
	ensures forall ws | subseq(ws, xs) && subseq(ws, ys) :: |ws| <= |zs0|
{
	forall ws | subseq(ws, xs) && subseq(ws, ys)
		ensures |ws| <= |zs0|
	{
		var ixs0 :| subseqBy(ws, xs, ixs0);
		var ixs1 :| subseqBy(ws, ys, ixs1);

		if ws == []
		{
			assert |ws| <= |zs0|;
		}
		else if ixs1[|ixs1|-1] == |ys| - 1
		{
			if ixs0[|ixs0|-1] == |xs| - 1
			{
				assert xs[|xs|-1] == ys[|ys|-1];
			}

			assert ixs0[|ixs0|-1] < |xs| - 1;
			assert forall i | 0 <= i < |ixs0| - 1 :: ixs0[i] < ixs0[|ixs0| - 1];
			assert subseq(ws, ys) && subseqBy(ws, xs[..|xs|-1], ixs0);
			assert |ws| <= |zs0|;
		}
		else
		{
			assert forall i | 0 <= i < |ixs1| - 1 :: ixs1[i] < ixs1[|ixs1| - 1];
			assert subseq(ws, xs) && subseqBy(ws, ys[..|ys|-1], ixs1);
			assert |ws| <= |zs0|;
		}
	}
}

method lcs(xs: seq<int>, ys: seq<int>) returns (zs: seq<int>)
	ensures subseq(zs, xs) && subseq(zs, ys)
{
	var d := new seq<int>[|xs| + 1, |ys| + 1];

	var i := 0;
	while i <= |xs|
		invariant i <= |xs| + 1
		invariant forall m, n     | 0 <= m < i && 0 <= n <= |ys| :: subseq(d[m, n], xs[..m]) && subseq(d[m, n], ys[..n])
		invariant forall m, n, ws | 0 <= m < i && 0 <= n <= |ys| :: subseq(ws,      xs[..m]) && subseq(ws,      ys[..n]) ==> |ws| <= |d[m, n]|
	{
		var j := 0;
		while j <= |ys|
			invariant j <= |ys| + 1
			invariant forall m, n     | 0 <= m < i && 0 <= n <= |ys| :: subseq(d[m, n], xs[..m]) && subseq(d[m, n], ys[..n])
			invariant forall m, n, ws | 0 <= m < i && 0 <= n <= |ys| :: subseq(ws,      xs[..m]) && subseq(ws,      ys[..n]) ==> |ws| <= |d[m, n]|
			invariant forall    n     |             0 <= n < j    :: subseq(d[i, n], xs[..i]) && subseq(d[i, n], ys[..n])
			invariant forall    n, ws |             0 <= n < j    :: subseq(ws,      xs[..i]) && subseq(ws,      ys[..n]) ==> |ws| <= |d[i, n]|
		{
			if i == 0 || j == 0
			{
				d[i, j] := [];
				assert subseqBy(d[i, j], xs[..i], []);
				assert subseqBy(d[i, j], ys[..j], []);

				lemma0(xs[..i], ys[..j]);
				assert forall ws | subseq(ws, xs[..i]) && subseq(ws, ys[..j]) :: |ws| <= |d[i, j]|;
			}
			else if xs[i - 1] == ys[j - 1]
			{
				d[i, j] := d[i - 1, j - 1] + [xs[i-1]];

				ghost var ixs0 :| subseqBy(d[i - 1, j - 1], xs[..i-1], ixs0);
				ghost var ixs1 :| subseqBy(d[i - 1, j - 1], ys[..j-1], ixs1);
				assert subseqBy(d[i, j], xs[..i], ixs0 + [i-1]);
				assert subseqBy(d[i, j], ys[..j], ixs1 + [j-1]);

				assert xs[..i][..i-1] == xs[..i-1];
				assert ys[..j][..j-1] == ys[..j-1];
				lemma1(xs[..i], ys[..j], d[i - 1, j - 1]);
				assert forall ws | subseq(ws, xs[..i]) && subseq(ws, ys[..j]) :: |ws| <= |d[i, j]|;
			}
			else if |d[i - 1, j]| > |d[i, j - 1]|
			{
				d[i, j] := d[i - 1, j];

				ghost var ixs :| subseqBy(d[i, j], xs[..i-1], ixs);
				assert subseqBy(d[i, j], xs[..i], ixs);
				assert subseq(d[i, j], ys[..j]);

				assert xs[..i][..i-1] == xs[..i-1];
				assert ys[..j][..j-1] == ys[..j-1];
				lemma2(xs[..i], ys[..j], d[i - 1, j], d[i, j - 1]);
				assert forall ws | subseq(ws, xs[..i]) && subseq(ws, ys[..j]) :: |ws| <= |d[i, j]|;
			}
			else
			{
				d[i, j] := d[i, j - 1];

				ghost var ixs :| subseqBy(d[i, j], ys[..j-1], ixs);
				assert subseq(d[i, j], xs[..i]);
				assert subseqBy(d[i, j], ys[..j], ixs);

				assert xs[..i][..i-1] == xs[..i-1];
				assert ys[..j][..j-1] == ys[..j-1];
				lemma2(ys[..j], xs[..i], d[i, j - 1], d[i - 1, j]);
				assert forall ws | subseq(ws, xs[..i]) && subseq(ws, ys[..j]) :: |ws| <= |d[i, j]|;
			}
			
			j := j + 1;
		}

		i := i + 1;
	}

	assert xs == xs[..|xs|];
	assert ys == ys[..|ys|];
	zs := d[|xs|, |ys|];
}
