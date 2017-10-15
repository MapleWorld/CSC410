import os
import stat
import py_compile
import subprocess

# explicitly compile this module
py_compile.compile("hidato.py")
py_compile.compile("groupinga.py")
py_compile.compile("groupingb.py")

os.rename("hidato.pyc", "hidato")
os.rename("groupinga.pyc", "groupinga")
os.rename("groupingb.pyc", "groupingb")

#chmod u+x hidato