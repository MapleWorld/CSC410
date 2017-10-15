import os
import sys
import time
import subprocess
from subprocess import Popen, PIPE

if len(sys.argv) < 2:
    sys.exit('Usage: %s <problem size>' % sys.argv[0])
    
# Output file
outputFormulaFileName = "hidato-formula.smt2"
outputFormulaFile = open(outputFormulaFileName, 'w')

map = dict()
inputs = []

neighbors = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
]

inputFile = open(sys.argv[1], 'r')

for line in inputFile.readlines():
    inputs.append(line.replace("\n","").split(" "))

rows = len(inputs);
cols = len(inputs[0]);
    
def buildVarName(row, col):
    return "m" + str(row) + str(col)
    
# Declare variables
def declareVar():
    outputFormulaFile.write(";; Declaring variables\n")
    for row in range(0, rows):
        for col in range(0, cols):
            if (inputs[row][col] == "*"):
                continue
            map[buildVarName(row, col)] = True;
            outputFormulaFile.write("(declare-const " + buildVarName(row, col) + " Int)\n")
            if (inputs[row][col] != "-"):
                outputFormulaFile.write("(assert (= " + buildVarName(row, col) + " " + inputs[row][col] + "))\n")
                
            
# Ensures all values are greater than 0
def allGreaterThan0():
    outputFormulaFile.write(";; Ensures all cell are greater than 0\n")
    str = "(assert (and "
    for row in range(0, rows):
        for col in range(0, cols):
            if (inputs[row][col] == "*"):
                continue
            str += "(> " + buildVarName(row, col) + " 0) "
    str += "))\n"
    outputFormulaFile.write(str)

# Ensure there exist some value bigger & smaller than current value by one in the neihborhoods
def checkAllNeighbors():
    outputFormulaFile.write(";; Ensure there exist some value bigger/smaller than current value by one in the neihborhoods\n")
    for row in range(0, rows):
        for col in range(0, cols):
            if (inputs[row][col] == "*"):
                continue
            checkNeighbors(row, col)

# Ensure there exist some value bigger & smaller than current value by one in the neihborhoods
def checkNeighbors(x, y):
    strPlus = "(assert (or "
    strMinus = "(assert (or "
    strBiggest = "(and "
    strSmallest = "(and "
    
    for coordinate in neighbors:
        newX = x + coordinate[0]
        newY = y + coordinate[1]
        if (newX >= 0 and newX < rows and newY >= 0 and newY < cols):
            if (inputs[newX][newY] != "*"):
                current = buildVarName(x,y)
                neighbor = buildVarName(newX,newY)
                strPlus += "(and (<= " + neighbor + " (+ " + current + " 1)) (>= " + neighbor + " (+ " + current + " 1)))"
                strMinus += "(and (<= " + neighbor + " (- " + current + " 1)) (>= " + neighbor + " (- " + current + " 1)))"
                if (inputs[x][y] != "-"):
                    # Ensures that the number could be the smallest or the biggest value in the matrix
                    strBiggest += "(> " + current + " " + neighbor + ")"
                    strSmallest += "(< " + current + " " + neighbor + ")"
        
    strBiggest += ")"
    strSmallest += ")"
    
    if strBiggest == "(and )":
        strBiggest =""
       
    if strSmallest == "(and )":
        strSmallest =""
       
    if strPlus != "(assert (or ":
        strPlus +=  strBiggest + "))"
        outputFormulaFile.write(strPlus + "\n")
    
    if strMinus != "(assert (or ":
        strMinus += strSmallest + "))"
        outputFormulaFile.write(strMinus + "\n")

# Ensures that there is no duplicate value
def noDuplicate():
    outputFormulaFile.write(";; Ensures that there is no duplicate values\n")
    track = dict()
    for row in range(0, rows):
        for col in range(0, cols):
            if (inputs[row][col] == "*"):
                continue
            isEmpty = True
            str = "(assert (and "
            for name in map:
                if (name != buildVarName(row, col) and not track.has_key(name)):
                    str += "(not (= " + buildVarName(row, col) + " " + name  + "))"
                    isEmpty = False
            str += "))\n";
            if (isEmpty == False):
                outputFormulaFile.write(str)
            track[buildVarName(row, col)] = True

def formulateZ3Code():
    declareVar()
    allGreaterThan0()
    checkAllNeighbors()
    noDuplicate()
    outputFormulaFile.write("(check-sat)\n")
    outputFormulaFile.write("(get-model)\n")
    outputFormulaFile.close()

def executeZ3Code(z3Result):
    # Execute the z3 code and fetch the result
    list = dict()
    position = None
    value = None
    outputMatrixFileName = "hidato-output.txt"
    outputMatrixFile = open(outputMatrixFileName, 'w')
    z3ResultLines = z3Result.split("\n")
    
    # Check if there is no solution
    if "unsat" in z3ResultLines[0]:
        outputMatrixFile.write("NO SOLUTION")
        return

    # Parse the output in matrix form
    for line in z3ResultLines:
        if "(define-fun" in line:
            position = line.split("(define-fun ")[1].split(" () Int")[0]
        elif ")" in line:
            value = line.split(")")[0].strip()
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
        outputMatrixFile.write(line + "\n")

    outputMatrixFile.close()

formulateZ3Code()
#z3ExecuablePath = './z3/bin/z3.exe'
z3ExecuablePath = '/u/csc410h/fall/pub/z3/bin/z3'
start_time = time.time()
process = Popen([z3ExecuablePath, outputFormulaFileName], stdout=PIPE, stderr=PIPE)
z3Result, stderr = process.communicate()
#print("--- %s seconds ---" % (time.time() - start_time))
#print z3Result
executeZ3Code(z3Result)

















