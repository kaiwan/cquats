**CQuATS - C Quality Assurance ToolSet project**

CQuATS is a management system that aims to collect heterogeneous code safety and security analysers/tools (primarily for 'C' code), bringing them together into a coherent, easy-to-use system. You can also think of it as an *"automation-UI"* kind of tool.

It's primarily targeted at 'C' developers on Linux, with C++ code being supported too, to some extent. Essentially, CQuATS allows a developer to easily setup code analysis, etc tools to run over his/her code-base and/or  binaries.
Categories it covers:
 - Static Analysers
 - Dynamic Analysers   
 - Profilers   
 - Security

An easy to use menu system (based on Kconfig) makes it very easy for a developer to setup the system and have it run all tests / profiling / etc.  When done, a detailed log contains all results.

**Some Details**

CQuATS integrates a set of diverse tools into a coherent whole.
The particular tools that currently integrate into the framework are
documented [in a Google sheet](http://bit.ly/CQuATS) [1]. *Please do refer to this sheet for details on which tools exactly are covered, and the current status.*

**Using CQuATS in 3 Simple Steps**

 - Step 1

Invoke the 'menuconfig' script, which is essentially a thin wrapper over
the 'make menuconfig' to configure and setup the CQuATS run.
(FYI, the run produces the required configuration info in an ASCII text file here: *kbuild/.config* ).

- Step  2
Invoke the 'run_cquats' script. The actual work is carried out here. 
An *'Execution Matrix'* - the tasks to be carried out (CSV) - are displayed:
An example run:

     ...
    Execution Matrix
    +-----------------------------------------------------------------------------------------+
    Space,   Type,    Suite,   ToolName,          Description,  Run-Command    +
    +-----------------------------------------------------------------------------------------+
     1. user-land, static,-na-    ,coccinelle,Coccinelle static analyser,V=1 /home/kaiwan/cquats/cquats_fc26/tools/static/coccinelle/coccichk /home/kaiwan/scratchpad/source_trees/bash-4.4
     2. user-land,dynamic,valgrind,memcheck  ,Valgrind memcheck dynamic analyser,valgrind --tool=memcheck --trace-children=yes --time-stamp=yes --errors-for-leak-kinds=definite ps -a
     3. user-land,dynamic profiling,Perf    ,perf      ,Perf dynamic CPU profiler,/home/kaiwan/cquats/cquats_fc26/.scratch_cquats/.cquats.perf.sh 
     4. user-land, static,-na-    ,flawfinder,Flawfinder security static analyser,flawfinder --context --minlevel=2 --falsepositive /home/kaiwan/scratchpad/source_trees/bash-4.4
    +-----------------------------------------------------------------------------------------+
     [...]

- The run_cquats script now parses and "runs" the commands as specified via the
'execution matrix', one by one.

- Step 3.
All output (as well as stderr) is auto-redirected to a log file (which is
*./log_cquats.txt* by default); it contains all message with timestamps, etc as far as possible. Examine the log file (log_cquats.txt) carefully.
Also, for some cases (like perf), there might be reports generated; you will find them under the '*reports*' folder.


Ref:
[1] http://bit.ly/CQuATS


> Written with [StackEdit](https://stackedit.io/).
