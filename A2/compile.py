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

st = os.stat('hidato')
os.chmod('hidato', stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

st = os.stat('groupinga')
os.chmod('groupinga', stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

st = os.stat('groupingb')
os.chmod('groupingb', stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

#chmod u+x hidato