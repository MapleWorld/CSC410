
## Compile, and run tests
## Script should work for most Linux/OSX/MacOS systems

## compiling test cases
javac -d test test/*/Test.java ;

## compile the code. Your code should compile with this command exactly
mkdir -p class
if javac -cp soot.jar -d class ./src/csc410/hw3/*.java; then

    cd ./class
	## run test cases
	if java -cp ../soot.jar:. csc410.hw3.RunDataFlowAnalysis case2.Test > /dev/null; then
		echo "[>] Your Upward Exposed Uses:"; cat exposed-uses.txt; 
		echo "[*] Expected Upward Exposed Uses:"; cat test/case2/expected-uses.txt;
	else
		echo "[!] Runtime Error";
	fi;
else
	echo "[!] Compilation Error";
fi;





## javac -d test test/*/Test.java ;
## javac -cp soot.jar -d class ./src/*.java
## java -cp ../soot.jar:. RunDataFlowAnalysis case2.Test





## This doesn't work
## java -cp soot.jar:class RunDataFlowAnalysis case2.Test

## This works
## java -cp ../soot.jar:. RunDataFlowAnalysis case2.Test