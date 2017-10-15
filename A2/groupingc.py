import os
import sys
import time
import subprocess
import itertools
from subprocess import Popen, PIPE

if len(sys.argv) < 2:
    sys.exit('Usage: %s <problem size>' % sys.argv[0])
    
# Output file
outputFormulaFileName = "grouping-formula.smt2"
outputFormulaFile = open(outputFormulaFileName, 'w')

preferencMap = dict()
nonpreferenceMap = dict()

inputs = []

inputFile = open(sys.argv[1], 'r')

for line in inputFile.readlines():
    elements = line.replace("\n","").split(" ")
    if elements != ['']:
        inputs.append(elements)
    else:
        inputs.append([])

numOfStudent = len(inputs);
    
for currStudent in range(0, numOfStudent):
    preferencMap[currStudent] = [];
    nonpreferenceMap[currStudent] = [];
    
def buildVarNameAlone(a):
    return "b" + str(a) 
    
def buildVarName(a, b):
    return "b" + str(a) + "b" + str(b) 
    
# Declare variables
def declareVar():
    outputFormulaFile.write(";; Declaring variables\n")
    for currStudent in range(0, numOfStudent):
        outputFormulaFile.write("(declare-const " + buildVarNameAlone(currStudent + 1) + " Int)\n")
        for partner in inputs[currStudent]:
            preferencMap[currStudent].append(partner)

# Declare that every student must group with ones of its preference partner
def oneMustBeGroupWithItsPreferencePartner():
    outputFormulaFile.write(";; Every student should pair with one of its perferenced student\n")
    for currStudent in range(0, numOfStudent):
        if len(preferencMap[currStudent]) != 0:
            line = "(assert-soft (or " 
            for partner in preferencMap[currStudent]:
                line += "(= " + buildVarNameAlone(currStudent + 1) + " " + partner + ")"  
            line +="))"
            outputFormulaFile.write(line + "\n")
            line = ""
            
# Ensure that the remaining student will pair up into group
def pairRemainingStudents():
    outputFormulaFile.write(";; Ensures the remaining student pairs up\n")
    for studA in range(0, numOfStudent):
        line = "(assert (or "
        for studB in range(0, numOfStudent):
            line += "(= " + buildVarNameAlone(studA + 1)  + " " + str(studB + 1) + ")"
        line += "))"
        
        if line != "(assert-soft (or ))":
            outputFormulaFile.write(line + "\n")

# Ensure there are no duplicate between groups
def noDuplicateBetweenGroup():
    outputFormulaFile.write(";; Ensure there are no duplicate between groups\n")
    for studA in range(0, numOfStudent):
        line = "(assert (or " 
        for studB in range(0, numOfStudent):
            if studA != studB:
                line = "(assert (or " 
                line += "(< " + buildVarNameAlone(studA + 1) + " " + buildVarNameAlone(studB + 1) + ")" 
                line += "(< " + buildVarNameAlone(studB + 1) + " " + buildVarNameAlone(studA + 1) + ")" 
                line +="))"
                outputFormulaFile.write(line + "\n")
                line = ""
                
# Ensures each student is in the same group
def studentsInTheSameGroup():
    outputFormulaFile.write(";; Ensures each student is in the same group\n")
    for studA in range(0, numOfStudent):
        line = "(assert (or (= " + buildVarNameAlone(studA + 1) + " " + str(studA + 1) + ")" 
        for studB in range(0, numOfStudent):
            if studA != studB:
                line += "(and "
                line += "(= " + buildVarNameAlone(studA + 1) + " " + str(studB + 1) + ")" 
                line += "(= " + buildVarNameAlone(studB + 1) + " " + str(studA + 1) + ")" 
                line += ")"
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""
        

# Ensures max group formed
def maxGroupformed():
    outputFormulaFile.write(";; Ensures each student is in the same group\n")
    for studA in range(0, numOfStudent):
        line = "(assert-soft (or "
        for studB in range(0, numOfStudent):
            if studA != studB:
                line += "(and "
                line += "(= " + buildVarNameAlone(studA + 1) + " " + str(studB + 1) + ")" 
                line += "(= " + buildVarNameAlone(studB + 1) + " " + str(studA + 1) + ")" 
                line += ")"
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""

    
    
  
def formulateZ3Code():
    declareVar()
    outputFormulaFile.write("\n")
    oneMustBeGroupWithItsPreferencePartner()
    outputFormulaFile.write("\n")
    pairRemainingStudents()
    outputFormulaFile.write("\n")
    noDuplicateBetweenGroup()
    outputFormulaFile.write("\n")
    studentsInTheSameGroup()
    outputFormulaFile.write("\n")
    maxGroupformed()
    outputFormulaFile.write("\n")
    outputFormulaFile.write("(check-sat)\n")
    outputFormulaFile.write("(get-model)\n")
    outputFormulaFile.close()
    #print preferencMap
    #print nonpreferenceMap
    

def executeZ3Code(z3Result):
    # Execute the z3 code and fetch the result
    list = dict()
    position = None
    value = None
    outputGroupingFileName = "grouping-output.txt"
    outputGroupingFile = open(outputGroupingFileName, 'w')
    z3ResultLines = z3Result.split("\n")

    # Parse the output 
    for line in z3ResultLines:
        if "(define-fun" in line:
            position = line.split("(define-fun ")[1].split(" () Int")[0]
        elif ")" in line:
            value = line.split(")")[0].strip()
            
        if position != None and value != None:
            list[position] = value
            position = None
            value = None
        
    groupList = []
    numGroupFormed = 0
    for group in list:
        if list[group] == "1":
            numGroupFormed += 1
            groupList.append(",".join(group.split("b")[1:]));
              
    outputGroupingFile.write(str(numGroupFormed) + " groups formed:\n")
    for group in groupList:
        outputGroupingFile.write(group + "\n")
        
    outputGroupingFile.close()

formulateZ3Code()
z3ExecuablePath = './z3/bin/z3.exe'
#z3ExecuablePath = '/u/csc410h/fall/pub/z3/bin/z3'
start_time = time.time()
process = Popen([z3ExecuablePath, outputFormulaFileName], stdout=PIPE, stderr=PIPE)
z3Result, stderr = process.communicate()
#print("--- %s seconds ---" % (time.time() - start_time))
print z3Result
executeZ3Code(z3Result)