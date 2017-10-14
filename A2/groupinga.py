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

preferencMap = dict()
nonpreferenceMap = dict()

inputs = []

inputFile = open(sys.argv[1], 'r')

for line in inputFile.readlines():
    inputs.append(line.replace("\n","").split(" "))

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
    # Need to include case, where a student has no preference
    
    for currStudent in range(0, numOfStudent):
        for partner in inputs[currStudent]:
            preferencMap[currStudent].append(buildVarNameAlone(partner))
            outputFormulaFile.write("(declare-const " + buildVarName(currStudent + 1, partner) + " Bool)\n")
        
        for nextStudent in range(0, numOfStudent): 
            if currStudent != nextStudent:
                # Make sure it is not declared already
                if buildVarNameAlone(nextStudent + 1) not in preferencMap[currStudent]:
                    nonpreferenceMap[currStudent].append(buildVarNameAlone(nextStudent + 1))
                    outputFormulaFile.write("(declare-const " + buildVarName(currStudent + 1, nextStudent + 1) + " Bool)\n")
    

# Declare that every student must group with ones of its preference partner
def oneMustBeGroupWithItsPreferencePartner():
    outputFormulaFile.write(";; Every student should pair with one of its perferenced student\n")
    for currStudent in range(0, numOfStudent):
        line = "(assert-soft (or " 
        for partner in preferencMap[currStudent]:
            line += buildVarNameAlone(currStudent + 1) + partner + " " 
        line +="))"
        outputFormulaFile.write(line + "\n")
        line = ""


# There can't be duplicate between groups
def noDuplicateBetweenGroup():
    '''
    dup = dict()
    outputFormulaFile.write(";; There shouldn't be duplicate between group\n")
    for currStudent in range(0, numOfStudent):
        dupStudent = []
        for c in range(0, numOfStudent): 
            if ((currStudent != c) and buildVarNameAlone(currStudent + 1) in preferencMap[c]):
                dupStudent.append(c)
                
        dupVar = []
        for c in preferencMap[currStudent]:
            dupVar.append(buildVarName(currStudent+1, c[1:]))
        for c in dupStudent:
            dupVar.append(buildVarName(c + 1, currStudent+1))
            
        dup[currStudent] = itertools.combinations(dupVar,2)

        for c in dup[currStudent]:
            line = "(assert (not (and " + c[0] + " " + c[1] + ")))"
            outputFormulaFile.write(line + "\n")
            line = ""       
    '''
    for studA in range(0, numOfStudent):
        line = "(assert (or "
        for studB in range(0, numOfStudent):
            for studC in range(0, numOfStudent):
                if studB != studC:
                    if studA == studB or studA == studC:
                       line += buildVarName(studB + 1, studC + 1) + " " 
            
        line += "))"
        print line
        
          
                     

# Ensure that the remaining student will pair up into group
def pairRemainingStudents():
    outputFormulaFile.write(";; Make sure the remaining student pairs up\n")
    for studA in range(0, numOfStudent):
        line = "(assert (or "
        for studB in range(0, numOfStudent):
            for studC in range(0, numOfStudent):
                if studB != studC:
                    if studA == studB or studA == studC:
                        line += buildVarName(studB + 1, studC + 1) + " "
            
        line += "))"
        outputFormulaFile.write(line + "\n")
        
    
def formulateZ3Code():
    declareVar()
    oneMustBeGroupWithItsPreferencePartner()
    noDuplicateBetweenGroup()
    pairRemainingStudents()
    outputFormulaFile.write("(check-sat)\n")
    outputFormulaFile.write("(get-model)\n")
    outputFormulaFile.close()
    print preferencMap
    print nonpreferenceMap
    

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
            position = line.split("(define-fun ")[1].split(" () B")[0]
        if "    " in line:
            value = line[4:len(line) - 2]
        if position != None and value != None:
            list[position] = value
            position = None
            value = None
    
    groupList = []
    numGroupFormed = 0
    for group in list:
        if list[group] == "true":
            numGroupFormed += 1
            groupList.append(",".join(group.split("b")[1:]));
              
    outputGroupingFile.write(str(numGroupFormed) + " groups formed:\n")
    for group in groupList:
        outputGroupingFile.write(group + "\n")
        
    outputGroupingFile.close()

formulateZ3Code()
z3ExecuablePath ='./z3/bin/z3.exe'
#process = Popen([z3ExecuablePath, outputFormulaFileName], stdout=PIPE, stderr=PIPE)
#z3Result, stderr = process.communicate()
#print z3Result
#executeZ3Code(z3Result)
#process.terminate()