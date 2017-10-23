package csc410.hw3;

import soot.Local;
import soot.Unit;
import soot.ValueBox;
import soot.jimple.internal.ImmediateBox;
import soot.toolkits.graph.DirectedGraph;
import soot.toolkits.scalar.BackwardFlowAnalysis;
import soot.toolkits.scalar.FlowSet;
import soot.toolkits.scalar.ArraySparseSet;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

/*** Class to hold Upward Exposed Uses analyis. Extend appropriate class. ***/

public class UpwardExposedUses extends BackwardFlowAnalysis<Unit, FlowSet<Local>>  {
	
	// Constructor for class
	private FlowSet<Local> emptySet;

    @SuppressWarnings("unchecked")
	public UpwardExposedUses(DirectedGraph g) {
		// First obligation
		super(g);

		// Create the empty set
		emptySet = new ArraySparseSet<>();

		// Second obligation
		doAnalysis();

        // Note:: You should print all upward exposed uses to exposed-uses.txt
        // within the constructor of your class

        // Create output file
        String fileName = "./exposed-uses.txt";
        File file = new File(fileName);
        BufferedWriter writer;

        try {
            writer = new BufferedWriter(new FileWriter(fileName));
            for (Unit s : (Iterable<Unit>) g) {
                List<ValueBox> useBoxes = s.getUseBoxes();
                if (useBoxes.size() == 1) {
                    ValueBox currentUseBox = useBoxes.get(0);
                    // If it is not integer, then it must be variable assignment
                    // Then, we search for point where the defintion can reaches
                    if (valueBoxIsNotInteger(currentUseBox)) {
                        findAllValidPreSucessors(g, s, currentUseBox, writer);
                    }
                } else if (useBoxes.size() > 1) {
                    // Find path for each variable used on this line
                    for (ValueBox currentUseBox : useBoxes) {
                        if (currentUseBox instanceof ImmediateBox) {
                            findAllValidPreSucessors(g, s, currentUseBox, writer);
                        }
                    }
                }
            }
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

    @SuppressWarnings("unchecked")
	private void findAllValidPreSucessors(DirectedGraph g, Unit s, ValueBox useBox, BufferedWriter writer) throws IOException {
        Queue<Unit> queue = new LinkedList<>();
        queue.add(s);
        boolean skippedOnce = false;
        HashMap<Unit, Boolean> trackMap = new HashMap<>();

        while (queue.size() > 0) {
            Unit currentS = queue.poll();
            if (!trackMap.containsKey(currentS)) {
                if (!skippedOnce) {
                    skippedOnce = true;
                } else {
                    ArrayList<Local> exitSet = findExitSet(currentS);
                    // Make sure that the variable is still alive
                    if (exitSet.contains(useBox.getValue())) {
                        ArrayList<String> strValueBoxList = convertValueBoxToString(currentS.getDefBoxes());
                        // Make sure to exit when the variable get redefined
                        if (!strValueBoxList.contains(useBox.getValue().toString())) {
                            writer.write(currentS.toString() + "\n");
                            writer.write(s.toString() + "\n");
                            writer.write(useBox.getValue() + "\n");
                        } else {
                            writer.write(currentS.toString() + "\n");
                            writer.write(s.toString() + "\n");
                            writer.write(useBox.getValue() + "\n");
                            continue;
                        }
                        if (currentS == s) {
                            break;
                        }
                    }
                    trackMap.put(currentS, true);
                }
                queue.addAll(g.getPredsOf(currentS));
            }
        }
    }

    private ArrayList<String> convertValueBoxToString(List<ValueBox> valueBoxes) {
        ArrayList<String> strList = new ArrayList<>();
        for (ValueBox current : valueBoxes) {
            strList.add(current.getValue().toString());
        }
        return strList;
    }

	private boolean valueBoxIsNotInteger(ValueBox valueBox) {
        String str = valueBox.getValue().toString();
        try {
            Integer.parseInt(str);
        } catch(NumberFormatException e) {
            return true;
        } catch(NullPointerException e) {
            return true;
        }
        return false;
    }

	// Override appropriate functions here

	// Used to initialize the in and out sets for each node. In
	// our case we build up the sets as we go, so we initialize
	// with the empty set.
    @SuppressWarnings("unchecked")
	@Override
	protected FlowSet<Local> newInitialFlow() {
		return emptySet.clone();
	}

	// Returns FlowSet representing the initial set of the entry
	// node. In our case the entry node is the last node and it
	// should contain the empty set.
    @SuppressWarnings("unchecked")
	@Override
	protected FlowSet<Local> entryInitialFlow() {
		return emptySet.clone();
	}

    @SuppressWarnings("unchecked")
	@Override
	protected void merge(FlowSet<Local> in1, FlowSet<Local> in2, FlowSet<Local> out) {
		in1.union(in2, out);
	}

    @SuppressWarnings("unchecked")
	@Override
	protected void copy(FlowSet<Local> srcSet, FlowSet<Local> destSet) {
		srcSet.copy(destSet);
	}

	// Sets the outSet with the values that flow through the
	// node from the inSet based on reads/writes at the node
	// Set the outSet (entry) based on the inSet (exit)
    @SuppressWarnings("unchecked")
	@Override
	protected void flowThrough(FlowSet<Local> inSet,
							   Unit node, FlowSet<Local> outSet) {

		// outSet is the set at entry of the node
		// inSet is the set at exit of the node
		// out <- (in - def(node)) union use(node)
		// out <- (in - def(node))

        // use == gen = read
        // def == kill = write
        FlowSet<Local> definitions = (FlowSet) emptySet.clone();

        for (ValueBox def: node.getUseAndDefBoxes()) {
            if (def.getValue() instanceof Local) {
                definitions.add((Local)def.getValue());
            }
        }
        inSet.difference(definitions, outSet);

        // out <- out union read(node)

        for (ValueBox use: node.getUseBoxes()) {
            if (use.getValue() instanceof Local) {
                outSet.add((Local) use.getValue());
            }
        }
	}

    private ArrayList<Local> findExitSet(Unit s ) {
        ArrayList<Local> exit = new ArrayList<>();
        for (Local local : this.getFlowAfter(s)) {
            exit.add(local);
        }
        return exit;
    }
}








