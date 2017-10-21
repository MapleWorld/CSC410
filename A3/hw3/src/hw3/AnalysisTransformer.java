package hw3;

import java.util.*;
import soot.*;
import soot.toolkits.graph.*;
import soot.toolkits.scalar.FlowSet;

/*** *** *** YOU DO NOT SUBMIT THIS FILE *** *** ***/
/*** *** *** PLEASE DON'T EDIT THIS FILE *** *** ***/

public class AnalysisTransformer extends SceneTransformer {

	@Override
	protected void internalTransform(String arg0, Map arg1) {

		// Get Main Method
		SootMethod sMethod = Scene.v().getMainMethod();

		// Create graph based on the method
		UnitGraph graph = new BriefUnitGraph(sMethod.getActiveBody());

		// Perform your Data Flow Analysis on the Graph
		// Note:: You should print all upward exposed uses to exposed-uses.txt
		// within the constructor of your class
		UpwardExposedUses analysis = new UpwardExposedUses(graph);

		/** Edited below **/
		// Print live variables at the entry and exit of each node

		Iterator<Unit> unitIt = graph.iterator();

		while (unitIt.hasNext()) {
			Unit s = unitIt.next();

			System.out.print(s);

			int d = 40 - s.toString().length();
			while (d > 0) {
				System.out.print(".");
				d--;
			}

			FlowSet<Local> set = analysis.getFlowBefore(s);

			System.out.print("\t[entry: ");
			for (Local local: set) {
				System.out.print(local+" ");
			}

			set = analysis.getFlowAfter(s);

			System.out.print("]\t[exit: ");
			for (Local local: set) {
				System.out.print(local+" ");
			}
			System.out.println("]");
		}

	}
}