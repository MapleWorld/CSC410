file = open("C:\Users\Lonel\Desktop\CSC410\A2\hidato-output.txt", "r") 

list = dict()
position = None
value = None

for line in file:
    if "(define-fun" in line:
        position = line[14:17]
    if "    " in line:
        value = line[4:len(line) - 2]
    if position != None and value != None:
        list[position] = value
        position = None
        value = None
    
for row in range(0, 7):
    for col in range(0, 7):
        str1 = "m" + str(row) + str(col)
        if list.has_key(str1):
            print list[str1],
        else:
            print "**",
            
    print ""