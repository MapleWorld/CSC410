package hw3;

import soot.Local;
import soot.Unit;
import soot.ValueBox;
import soot.toolkits.graph.DirectedGraph;
import soot.toolkits.scalar.BackwardFlowAnalysis;
import soot.toolkits.scalar.FlowSet;
import soot.toolkits.scalar.ArraySparseSet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

/*** Class to hold Upward Exposed Uses analyis. Extend appropriate class. ***/

public class UpwardExposedUses extends BackwardFlowAnalysis<Unit, FlowSet<Local>>  {
	
	// Constructor for class
	private FlowSet<Local> emptySet;

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

            Iterator<Unit> unitIt = g.iterator();

            while (unitIt.hasNext()) {
                Unit s = unitIt.next();

                writer.write(s.toString() + "\n");
                System.out.print(s);

                int d = 40 - s.toString().length();
                while (d > 0) {
                    System.out.print(".");
                    d--;
                }
                FlowSet<Local> set = this.getFlowBefore(s);

                System.out.print("\t[entry: ");
                for (Local local: set) {
                    System.out.print(local+" ");
                }

                set = this.getFlowAfter(s);

                System.out.print("]\t[exit: ");
                for (Local local: set) {
                    System.out.print(local+" ");
                }
                System.out.println("]");
            }
            writer.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	// Override appropriate functions here

	// Used to initialize the in and out sets for each node. In
	// our case we build up the sets as we go, so we initialize
	// with the empty set.
	@Override
	protected FlowSet<Local> newInitialFlow() {
		return emptySet.clone();
	}

	// Returns FlowSet representing the initial set of the entry
	// node. In our case the entry node is the last node and it
	// should contain the empty set.
	@Override
	protected FlowSet<Local> entryInitialFlow() {
		return emptySet.clone();
	}

	@Override
	protected void merge(FlowSet<Local> in1, FlowSet<Local> in2, FlowSet<Local> out) {
		in1.union(in2, out);
	}


	@Override
	protected void copy(FlowSet<Local> srcSet, FlowSet<Local> destSet) {
		srcSet.copy(destSet);
	}

	// Sets the outSet with the values that flow through the
	// node from the inSet based on reads/writes at the node
	// Set the outSet (entry) based on the inSet (exit)
	@Override
	protected void flowThrough(FlowSet<Local> inSet,
							   Unit node, FlowSet<Local> outSet) {

		// outSet is the set at entry of the node
		// inSet is the set at exit of the node
		// out <- (in - def(node)) union use(node)
		// out <- (in - def(node))

        // use == gen = read
        // def == kill = write
        FlowSet definitions = (FlowSet)emptySet.clone();

        for (ValueBox def: node.getUseAndDefBoxes()) {
            if (def.getValue() instanceof Local) {
                definitions.add(def.getValue());
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

