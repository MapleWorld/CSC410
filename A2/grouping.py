import os
import sys
import subprocess
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
    
print inputs
    
def buildVarName(row, col):
    return "b" + str(row) + str(inputs[row][col])
    
# Declare variables
def declareVar():
    for row in range(0, numOfStudent):
        for col in range(0, len(inputs[row])):
            map[buildVarName(row, col)] = True;
            outputFormulaFile.write("(declare-const " + buildVarName(row, col) + " Boolean)\n")
            #if (inputs[row][col] != "-"):
            #    outputFormulaFile.write("(assert (= " + buildVarName(row, col) + " " + inputs[row][col] + "))\n")
                
            

def formulateZ3Code():
    declareVar()
    outputFormulaFile.write("(check-sat)\n")
    outputFormulaFile.write("(get-model)\n")
    outputFormulaFile.close()
    
    
    
    
#executeZ3Code();
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

    # Parse the output in matrix form
    for line in z3ResultLines:
        if "(define-fun" in line:
            position = line[14:17]
        if "    " in line:
            value = line[4:len(line) - 2]
        if position != None and value != None:
            list[position] = value
            position = None
            value = None
        
    for row in range(0, rows):
        line = ""
        for col in range(0, cols):
            str1 = "m" + str(row) + str(col)
            if list.has_key(str1):
                line += list[str1] + " "
            else:
                line += "* "
        outputGroupingFile.write(line + "\n")

    outputGroupingFile.close()

formulateZ3Code()
#z3ExecuablePath ='./z3/bin/z3.exe'
#process = Popen([z3ExecuablePath, outputFormulaFileName], stdout=PIPE, stderr=PIPE)
#z3Result, stderr = process.communicate()
#executeZ3Code(z3Result)
#process.terminate()

























