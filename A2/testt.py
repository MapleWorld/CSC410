import itertools

def buildVarName(a, b):
    return "b" + str(a) + "b" + str(b) 
# There can't be duplicate between groups
numOfStudent = 5
map = {1: [2,3,4], 2:[1,3, 5], 3:[2,1], 4:[1], 5: [2]}
dup = dict()
for currStudent in range(0, numOfStudent):
    dupStudent = []
    for c in range(0, numOfStudent): 
        if ((currStudent != c) and currStudent + 1 in map[c+1]):
            dupStudent.append(c+1)
    dupVar = []
    for c in map[currStudent + 1]:
        dupVar.append(buildVarName(currStudent+1, c))
    for c in dupStudent:
        dupVar.append(buildVarName(c, currStudent+1))
        
    dup[currStudent] = itertools.combinations(dupVar,2)

    for c in dup[currStudent]:
        line = "(assert (not (and " + c[0] + " " + c[1] + ")))"
        print(line + "\n")
        line = ""   