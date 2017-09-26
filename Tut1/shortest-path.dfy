function numNeg(xs: seq<int>): nat
{
	if xs == [] then
		0
	else
		(if xs[0] < 0 then 1 else 0) + numNeg(xs[1..])
}

method shortestPath(graph: array2<bool>, src: int, dst: int) returns (dist: int)
	requires graph != null && graph.Length0 == graph.Length1
	requires 0 <= src < graph.Length0
	requires 0 <= dst < graph.Length0
{
	var numVerts := graph.Length0;
	var dists := new int[numVerts];

	var i := 0;
	while i < numVerts
	{
		dists[i] := -1;
		i := i + 1;
	}

	var queue := [src];
	dists[src] := 0;

	while queue != []
		invariant forall i | 0 <= i < |queue| :: 0 <= queue[i] < numVerts && dists[queue[i]] >= 0
		decreases numNeg(dists[..]), |queue|
	{
		ghost var nn := numNeg(dists[..]);
		ghost var queueLen := |queue|;

		var v1 := queue[0];
		queue := queue[1..];

		var v2 := 0;
		while v2 < numVerts
			invariant dists[v1] >= 0
			invariant forall i | 0 <= i < |queue| :: 0 <= queue[i] < numVerts && dists[queue[i]] >= 0
			invariant (|queue| == queueLen - 1 && numNeg(dists[..]) == nn) || numNeg(dists[..]) < nn
		{
			if graph[v1, v2] && (dists[v2] == -1 || dists[v1] < dists[v2])
			{
				if (dists[v2] == -1)
				{
					lemma1(dists[..], v2, dists[v1] + 1);
					queue := [v2] + queue;
					dists[v2] := dists[v1] + 1;
				}
				else
				{
					lemma2(dists[..], v2, dists[v1] + 1);
					dists[v2] := dists[v1] + 1;
				}
			}

			v2 := v2 + 1;
		}
	}

	return dists[dst];
}

lemma lemma1(xs: seq<int>, i: int, v: int)
	requires 0 <= i < |xs| && xs[i] == -1 && v >= 0
	ensures numNeg(xs[i := v]) < numNeg(xs)
{
	if i == 0
	{
		assert numNeg(xs[i := v]) == numNeg(xs) - 1;
	}
	else
	{
		assert numNeg(xs[i := v]) == (if xs[0] < 0 then 1 else 0) + numNeg(xs[i := v][1..]);
		assert numNeg(xs[i := v]) == (if xs[0] < 0 then 1 else 0) + numNeg(xs[1..][i - 1 := v]);
		lemma1(xs[1..], i - 1, v);
		assert numNeg(xs[1..][i - 1 := v]) < numNeg(xs[1..]);
		assert numNeg(xs[i := v][1..]) < numNeg(xs[1..]);
		assert numNeg(xs[i := v]) < numNeg(xs);
	}
}

lemma lemma2(xs: seq<int>, i: int, v: int)
	requires 0 <= i < |xs| && xs[i] >= 0 && v >= 0
	ensures numNeg(xs[i := v]) == numNeg(xs)
{
	if i == 0
	{
		assert numNeg(xs[i := v]) == numNeg(xs);
	}
	else
	{
		assert numNeg(xs[i := v]) == (if xs[0] < 0 then 1 else 0) + numNeg(xs[i := v][1..]);
		assert numNeg(xs[i := v]) == (if xs[0] < 0 then 1 else 0) + numNeg(xs[1..][i - 1 := v]);
		lemma2(xs[1..], i - 1, v);
		assert numNeg(xs[1..][i - 1 := v]) == numNeg(xs[1..]);
		assert numNeg(xs[i := v][1..]) == numNeg(xs[1..]);
		assert numNeg(xs[i := v]) == numNeg(xs);
	}
}
