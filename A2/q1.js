/*
*  *  7  6  -  *  *
*  *  5  -  -  *  *
31 -  -  4  -  -  18
-  33 2  12 15 19 -
29 28 1  14 -  -  -
*  *  -  24 22 *  *
*  *  25 -  -  *  *

*  *  7  6  9  *  *
*  *  5  8  10 *  *
31 32 3  4  11 16 18
30 33 2  12 15 19 17
29 28 1  14 13 21 20
*  *  27 24 22 *  *
*  *  25 26 23 *  *

*  *  1  2 
*  *  3  - 
8  -  -  4 

*  *  1  2 
*  *  3  5 
8  7  6  4 
*/
var input = [
    ["*","*","7","6","-","*","*"],
    ["*","*","5","-","-","*","*"],
    ["31","-","-","4","-","-","18"],
    ["-","33","2","12","15","19","-"],
    ["29","28","1","14","-","-","-"],
    ["*","*","-","24","22","*","*"],
    ["*","*","25","-","-","*","*"]
]

var test_input = [
    ["*","*","1","2"], 
    ["*","*","3","-"], 
    ["8","-","-","4"]
];

var test_input2 = [
    ["*","*","1","-","-","*","*"],
    ["*","*","-","-","-","*","*"],
    ["*","*","-","-","-","*","*"],
    ["*","*","-","-","-","*","*"],
    ["*","17","-","-","-","-","*"]
]

var map = [];
var neighbors = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
];

// Declare variables
function declareVar(input) {
    var rows = input.length;
    var cols = input[0].length;
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

function varName(row, col) {
    return "m" + row + col;
}

// Ensures all values are greater than 0
function allGreaterThan0(input) {
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

function checkAllNeighbors(input) {
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

// Ensure there exist some value bigger/smaller than current value by one in the neihborhoods
function checkNeighbors(input, x, y) {
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

// Ensures that there is no duplicate value
function noDuplicate(input) {
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

function parse(input) {
    declareVar(input);
    allGreaterThan0(input);
    checkAllNeighbors(input);
    noDuplicate(input);
    console.log("(check-sat)");
    console.log("(get-model)");
}


parse(input);


/*
delete
m42 smallest
m31 largest

(< m52 m42)
(= (m42 (+ m52 1)))
(> m30 m31)
(= (m31 (- m30 1)))
(> m21 m31)
(= (m31 (- m21 1)))
(= (m31 (- m22 1)))
(> m22 m31)
*/