import os
import sys
import subprocess
import itertools
from subprocess import Popen, PIPE

if len(sys.argv) < 2:
    sys.exit('Usage: %s <problem size>' % sys.argv[0])
    
# Output file
outputFormulaFileName = "grouping-formula.smt2"
outputFormulaFile = open(outputFormulaFileName, 'w')

map = dict()
inputs = []

inputFile = open(sys.argv[1], 'r')

for line in inputFile.readlines():
    inputs.append(line.replace("\n","").split(" "))

numOfStudent = len(inputs);
    

for currStudent in range(0, numOfStudent):
    map[currStudent] = [];
    
def buildVarNameAlone(a):
    return "b" + str(a) 
    
def buildVarName(a, b):
    return "b" + str(a) + "b" + str(b) 
    
# Declare variables
def declareVar():
    # Need to include case, where a student has no preference
    for currStudent in range(0, numOfStudent):
        for partner in inputs[currStudent]:
            map[currStudent].append(buildVarNameAlone(partner))
            outputFormulaFile.write("(declare-const " + buildVarName(currStudent + 1, partner) + " Bool)\n")

               
# Declare that every student must group with ones of its preference partner
def oneMustBeGroupWithItsPreferencePartner():
    outputFormulaFile.write(";; Every student should pair with one of its perferenced student\n")
    for currStudent in range(0, numOfStudent):
        line = "(assert-soft (or " 
        for partner in map[currStudent]:
            line += buildVarNameAlone(currStudent + 1) + partner + " " 
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""


# There can't be duplicate between groups
def noDuplicateBetweenGroup():
    dup = dict()
    outputFormulaFile.write(";; There shouldn't be duplicate between group\n")
    for currStudent in range(0, numOfStudent):
        dupStudent = []
        for c in range(0, numOfStudent): 
            if ((currStudent != c) and currStudent in map[c]):
                dupStudent.append(c)
        dupVar = []
        for c in map[currStudent]:
            dupVar.append(buildVarName(currStudent + 1, c[1:]))
        for c in dupStudent:
            dupVar.append(buildVarName(c, currStudent + 1))
            
        dup[currStudent] = itertools.combinations(dupVar,2)
        
        

        for c in dup[currStudent]:
            if not(c[0][1] == c[1][3] and c[0][3] == c[1][1]):
                line = "(assert (not (and  " + c[0] + " " + c[1] + ")))"
                outputFormulaFile.write(line + "\n")
                line = ""                
    
    
    
def formulateZ3Code():
    declareVar()
    oneMustBeGroupWithItsPreferencePartner()
    noDuplicateBetweenGroup()
    outputFormulaFile.write("(check-sat)\n")
    outputFormulaFile.write("(get-model)\n")
    outputFormulaFile.close()
    print map
    

def executeZ3Code(z3Result):
    # Execute the z3 code and fetch the result
    list = dict()
    position = None
    value = None
    outputGroupingFileName = "grouping-output.txt"
    outputGroupingFile = open(outputGroupingFileName, 'w')
    z3ResultLines = z3Result.split("\n")
    
    # Check if there is no solution
    if "unsat" in z3ResultLines[0]:
        outputGroupingFile.write("NO SOLUTION")
        return

    # Parse the output 
    for line in z3ResultLines:
        if "(define-fun" in line:
            position = line[14:17]
        if "    " in line:
            value = line[4:len(line) - 2]
        if position != None and value != None:
            list[position] = value
            position = None
            value = None
        
    outputGroupingFile.write("gg" + "\n")
    outputGroupingFile.close()

formulateZ3Code()
z3ExecuablePath ='./z3/bin/z3.exe'
process = Popen([z3ExecuablePath, outputFormulaFileName], stdout=PIPE, stderr=PIPE)
z3Result, stderr = process.communicate()
print z3Result
executeZ3Code(z3Result)
#process.terminate()
























