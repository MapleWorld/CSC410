import org.jboss.util.Null;
import org.jboss.util.propertyeditor.IntegerEditor;
import soot.Local;
import soot.Unit;
import soot.ValueBox;
import soot.toolkits.graph.DirectedGraph;
import soot.toolkits.graph.UnitGraph;
import soot.toolkits.scalar.BackwardFlowAnalysis;
import soot.toolkits.scalar.FlowSet;
import soot.toolkits.scalar.ArraySparseSet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/*** Class to hold Upward Exposed Uses analyis. Extend appropriate class. ***/

public class UpwardExposedUses extends BackwardFlowAnalysis<Unit, FlowSet<Local>>  {
	
	// Constructor for class
	private FlowSet<Local> emptySet;

    @SuppressWarnings("unchecked")
	public UpwardExposedUses(UnitGraph g) {
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

        ArrayList<String> lst = new ArrayList<>();
        ArrayList<String> codeLst = new ArrayList<>();
        try {
            writer = new BufferedWriter(new FileWriter(fileName));

            printToConsole(g);

            // Initialize and collect the data needed to write to file
            HashMap<String, ArrayList<ArrayList<Local>>> blockMap = new HashMap<>();

            for (Unit s : (Iterable<Unit>) g) {
                //System.out.println(s.getDefBoxes());
                //System.out.println(s.getUseAndDefBoxes());

                ArrayList<Local> entry = new ArrayList<>();
                for (Local local : this.getFlowBefore(s)) {
                    entry.add(local);
                }

                ArrayList<Local> exit = new ArrayList<>();
                for (Local local : this.getFlowAfter(s)) {
                    exit.add(local);
                }

                ArrayList<ArrayList<Local>> entryExit = new ArrayList<>();
                entryExit.add(entry);
                entryExit.add(exit);
                System.out.println(s.getDefBoxes());

                if (s.getDefBoxes().size() > 0) {
                    String name = s.getDefBoxes().get(0).toString();
                    blockMap.put(name, entryExit);
                    lst.add(name);
                    codeLst.add(s.toString());
                }
            }

            HashMap<String, Integer> trackMap = new HashMap<>();

            // Find the upward exposed uses of the entry value
            // Loop the code backward
            for (int i = lst.size() - 1; i >= 0; i--) {
                String current = lst.get(i);

                // Find the entry set of the block
                ArrayList<ArrayList<Local>> blockDataList = blockMap.get(current);
                ArrayList<Local> blockEntryList = blockDataList.get(0);

                // For each entry set, loop each entry set backward
                for (int j = blockEntryList.size() - 1; j >= 0; j--) {
                    Local currentEntryVal = blockEntryList.get(j);

                    // Prevent duplicate
                    if (!trackMap.containsKey(currentEntryVal.toString())) {
                        trackMap.put(currentEntryVal.toString(), 1);
                    } else {
                        continue;
                    }

                    // Find all line that contains the entry value in their ExitEntrySet
                    for (int k = 0; k < i; k++) {
                        ArrayList<ArrayList<Local>>  tempDataList = blockMap.get(lst.get(k));
                        ArrayList<Local> tempExitList = tempDataList.get(1);
                        if (tempExitList.contains(currentEntryVal)) {
                            writer.write(codeLst.get(k) + "\n");
                            writer.write(codeLst.get(i) + "\n");
                            writer.write(currentEntryVal.toString() + "\n");
                            System.out.println("Write");
                        }
                    }
                    System.out.println("Test: " + currentEntryVal.toString() + " " + j + " " + blockEntryList.toString());
                }
            }

            System.out.println(lst.toString());
            System.out.println(blockMap.toString());
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
	}

    @SuppressWarnings("unchecked")
	private void printToConsole(UnitGraph g) {
        for (Unit s : g) {
            System.out.print(s);

            int d = 40 - s.toString().length();
            while (d > 0) {
                System.out.print(".");
                d--;
            }
            FlowSet<Local> set = this.getFlowBefore(s);

            System.out.print("\t[entry: ");
            for (Local local : set) {
                System.out.print(local + " ");
            }

            set = this.getFlowAfter(s);

            System.out.print("]\t[exit: ");
            for (Local local : set) {
                System.out.print(local + " ");
            }
            System.out.println("]");
        }
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
}

