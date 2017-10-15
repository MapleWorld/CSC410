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
        for partner in inputs[currStudent]:
            preferencMap[currStudent].append(buildVarNameAlone(partner))
            outputFormulaFile.write("(declare-const " + buildVarName(currStudent + 1, partner) + " Int)\n")
        
        for nextStudent in range(0, numOfStudent): 
            if currStudent != nextStudent:
                # Make sure it is not declared already
                if buildVarNameAlone(nextStudent + 1) not in preferencMap[currStudent]:
                    nonpreferenceMap[currStudent].append(buildVarNameAlone(nextStudent + 1))
                    outputFormulaFile.write("(declare-const " + buildVarName(currStudent + 1, nextStudent + 1) + " Int)\n")

# Every constant should be positive
def positiveConstant():
    outputFormulaFile.write(";; Every group should either have indicator zero or one\n")
    for currStudent in range(0, numOfStudent):
        line = "(assert (and " 
        for partner in range(0, numOfStudent):
            if partner != currStudent:
                line += "(>= " + buildVarName(currStudent + 1, partner+1) + " 0)"
                line += "(>= " + buildVarName( partner+ 1, currStudent + 1) + " 0)"
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""
        
        
# Each Student must belong to one group only
def oneGroupOnly():
    outputFormulaFile.write(";; Each Student must belong to one group only\n")
    for currStudent in range(0, numOfStudent):
        line = "(assert (<= (+" 
        for partner in range(0, numOfStudent):
            if partner != currStudent:
                line += " " + buildVarName(currStudent + 1, partner + 1) + " " + buildVarName(partner + 1, currStudent + 1)
        line +=") 1))"
        outputFormulaFile.write(line + "\n")
        line = ""
        
  
# Maximize the group preference
def maxPreference():
    outputFormulaFile.write(";; Maximize the group preference\n")
    line = "(maximize (+ " 
    for currStudent in range(0, numOfStudent):
        if len(preferencMap[currStudent]) != 0:
            for partner in preferencMap[currStudent]:
                line += buildVarNameAlone(currStudent + 1) + partner + " " + partner + buildVarNameAlone(currStudent +1) + " "
    line +="))"
    outputFormulaFile.write(line + "\n")
    line = ""

# Maximize the number of groups formed
def maxGroupformed():
    outputFormulaFile.write(";; Maximize the number of groups formed\n")
    for currStudent in range(0, numOfStudent):
        line = "(maximize (+" 
        for partner in range(0, numOfStudent):
            if partner != currStudent:
                line += " " + buildVarName(currStudent + 1, partner + 1) + " " + buildVarName(partner + 1, currStudent + 1)
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""

def formulateZ3Code():
    declareVar()
    positiveConstant()
    oneGroupOnly()
    maxPreference()
    maxGroupformed()
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
    start = False
    # Parse the output 
    for line in z3ResultLines:
        if "(define-fun" in line:
            start = True
            position = line.split("(define-fun ")[1].split(" () Int")[0]
        elif ")" in line and start == True:
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