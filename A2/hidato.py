import os
import sys

if len(sys.argv) < 2:
    sys.exit('Usage: %s <problem size>' % sys.argv[0])
    
# Output file
filename = '%s_queens_SAT.smt2' % sys.argv[1]
f = open(filename, 'w')

var map = [];
neighbors = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
];

# Declare variables
def declareVar(input):
    rows = input.length;
    cols = input[0].length;
    for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
            if (input[row][col] === "*") {
                continue;
            }
            map[varName(row, col)] = true;
            console.log("(declare-const " + varName(row, col) + " Int)");

            if (input[row][col] !== "-") {
                console.log("(assert (= " + varName(row, col) + " " + input[row][col] + "))");
            }
        }
    }
}

def varName(row, col):
    return "m" + row + col;
}

# Ensures all values are greater than 0
def allGreaterThan0(input):
    var str = "(assert (and ";
    var rows = input.length;
    var cols = input[0].length;
    for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
            if (input[row][col] === "*") {
                continue;
            }
            str += "(> " + varName(row, col) + " 0) ";
        } 
    }
    str += "))";
    console.log(str);
}

def checkAllNeighbors(input):
    var rows = input.length;
    var cols = input[0].length;
    for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
            if (input[row][col] === "*") {
                continue;
            }
            checkNeighbors(input, row, col);
        } 
    }
}

# Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
def checkNeighbors(input, x, y):
    if (input[x][y] !== "-") {
        return;
    }
    var strPlus = "(assert (or ";
    var strMinus = "(assert (or ";
    var rows = input.length;
    var cols = input[0].length;
    for (var i in neighbors) {
        var newX = x + neighbors[i][0];
        var newY = y + neighbors[i][1];
        if (newX >= 0 && newX < rows && newY >= 0 && newY < cols) {
            if (input[newX][newY] !== "*") {
                var current = varName(x,y);
                var neighbor = varName(newX,newY);
                strPlus += "(and (<= " + neighbor + " (+ " + current + " 1)) (>= " + neighbor + " (+ " + current + " 1)))"; 
                strMinus += "(and (<= " + neighbor + " (- " + current + " 1)) (>= " + neighbor + " (- " + current + " 1)))"; 
            } 
        }
    }
    strPlus +="))";
    strMinus +="))";
    console.log(strPlus);
    console.log(strMinus);
}

# Ensures that there is no duplicate value
def noDuplicate(input):
    var rows = input.length;
    var cols = input[0].length;
    var track = [];
    for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
            if (input[row][col] === "*") {
                continue;
            }
            var isEmpty = true;
            var str = "(assert (and ";
            for (var name in map) {
                if (name !== varName(row, col) && track[name] === undefined) {
                    str += "(not (= " + varName(row, col) + " " + name  + "))";
                    isEmpty = false;
                }
            }
            str += "))";
            if (isEmpty === false) {
                console.log(str);
            }
            track[varName(row, col)] = true;
        }
    }
}

def parse(input):
    declareVar(input);
    allGreaterThan0(input);
    checkAllNeighbors(input);
    noDuplicate(input);
    console.log("(check-sat)");
    console.log("(get-model)");
}

parse(input);

