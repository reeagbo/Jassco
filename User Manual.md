# Overview
The python folder contains all the python code needed to produce the z80 assembly output. The idea is to keep things as simple as possible. Note that JASSCO only produces the assembly code. If you want to produce any sort of image, you need to take the assembly code to a compiler and produce it separately.

A this point, two different compilation method are supported:
    1) Eclipse environment: you can set up a python environment, the output will be produced to a file (output.asm) and to the console. From there you can take the code to your ZX Spectrum compiler/emulator of choice. Nothing is automated.
    2) Regular editor and compiler: A batch file (below) runs the python compliler, compiles the z80 assembly output and runs the image in Fuse.

I´ll use the "hello, world!" example to go through all the steps.

## 1) Eclipse environment

Preparation (only need to do it once): The first thing you need to do is installing Eclipse and configuring the environment. There is a zillion places where this is explained. I was a newbie myself and used this one:
https://www.rose-hulman.edu/class/csse/resources/Eclipse/eclipse-python-configuration.htm
The main task is to make sure that Eclipse will find Python. If you are familiar with Eclipse and Python this is probably done.
    
- Open (at least) 'input.js' and 'main.py' in Eclipse.
- Place your JavaScript code in the 'input.js' file. In our case, that would be:

        include ("io.asc")
        console.log ("hello, world")

  Note: the reason to have 'include ("io.asc")' is to add basic I/O support. Otherwise, console.log call will fail.
- Select 'main.py' tab and click Play to run the code. This will look into the 'input.js' file, generate the assembly code and (1) print it in the console, (2) save it to 'output.asm'.
    The output code should look like:

        ; Generated with ASsembly COmpiler, JASSCO v0. Boria Labs 2025.
        ; Directives -------------------------------------------------
        str_max equ 32          ; maximum string length
        org 25000               ; initial code address

        sta_cod jp mai_cod              ; jumps to main code

        ; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
        stn_000 defb 12, 0, "hello, world"        ; (Literal) string
        (...and it goes on...)

- If something goes wrong (variables not declared, unknown instructions or syntax, etc...), an error will be produced at the beginning of the compilation output. 
    (to be improved) Error check is kind of weak, so it may still compile and not run properly.
- (to be improved) From here, you are free to do whatever you like with the code. In the future, I´ll probably add steps to run it automatically. 
    Any compiler like Pasmo shall do. In my case, I´ve worked so long with ZXspin, that I'll copy/paste the code to the editor and run it from there.
- As you can see in the output code, assembly is loaded starting at address 25000, therefore, inorder to run your code, you need to type in the emulator:
        RANDOMIZE USR 25000
- If everything is right, you´ll see the "hello, world!" message in the screen. You are set to start writing your JavaScript for ZX Spectrum!!!


## 2) Regular editor and compiler

We´ll be working with Notepad++ and Command Line (where it reads Notepad++, it could be any text editor). Concepts are identical as with Eclipse, but steps are executed differently.
- Preparation (only need to do it once):
  - Folder: You'll need a dedicated folder for JASSCO, anywhere. For the example, I´ll use \\MyDocuments\jassco. From here and on \\MyDocuments is whatever that forder is named in your computer, followed by \jassco. In my case: C:\Users\myself\Document.
  - Python: 
    - make sure Python is installed in your computer and runs from any directory.
    - create a folder under jassco where all the jassco code will be living. In our example: \\MyDocuments\jassco\python
    - get the files in the latest python folder in github and place them in \\MyDocuments\jassco folder. Until a naming convention is defined, latest date is the latest version.
  - Pasmo: 
    - create a folder under \\MyDocuments\jassco. In this example: \\MyDocuments\jassco\pasmo. 
    - install Pasmo in this folder.
    - Fuse: install Fuse in your PC. Let's use the default path (c:\Program Files (x86)\Fuse\fuse.exe).

    With this, we should be set to go.

    - With the editor, place your JavaScript code in 'input.js' (folder C:\Users\Alex\Documents\jassco). For the "hello, world!" example:

        include ("io.asc")
        console.log ("hello, world!")

        Note: the reason to have 'include ("io.asc")' is to add basic I/O support. Otherwise, console.log call will fail.

    - The steps needed to create andrun your image are. Don´t worry: we´ll see below how it's done:
        - run python providing the right arguments. Main python program 'main.py' will be executed. 
        Python will look into the 'input.js' file, generate the assembly code and (1) print it in the console, (2) save it to 'output.asm'.
        If something goes wrong (variables not declared, unknown instructions or syntax, etc...), an error will be produced at the beginning of the compilation output. 
        (to be improved) Error check is kind of weak, so it may still generate the assembly and not compile properly.
        - compile the 'output.asm' file and produce some image that an emulator can run (i.e. .tap).
        - run the image produced in the emulator.

        To complete all these steps, I´m using a simple batch file to run all the steps above (you can find it in the root directory in github). 
        In order to run it, you need to open the command prompt and move to the jassco folder (folder \\MyDocuments\jassco).

            cd python
            python main.py ..\%1 ..\%2
            cd ..
            .\pasmo\pasmo.exe --tap %2 output.tap
            "c:\Program Files (x86)\Fuse\fuse.exe" output.tap

    - Steps to compile and run the code:
        - Open the Command prompt in Windows.
        - Move to the jassco folder:
            cd \\MyDocuments\jassco (not literal)
        - run the batch file with the required parameters. The syntax is: jassco.bat input_file output_file. Both files could be anything, but for our example we will use:
            jassco input.js output.asm

        - The output code should look like, botth in the output file and the console:

            ; Generated with ASsembly COmpiler, JASSCO v0. Boria Labs 2025.
            ; Directives -------------------------------------------------
            str_max equ 32          ; maximum string length
            org 25000               ; initial code address
    
            sta_cod jp mai_cod      ; jumps to main code
    
            ; Variable declarations --------------------------------------
            sta_ck2 defw 24500      ; auxiliary stack address
            stn_000 defb 12, 0, "hello, world"        ; (Literal) string
            (and it goes on...)

        - A .tap file is automatically generated, FUSE is started and the image loaded.
        - As you can see in the output code, assembly is loaded starting at address 25000. Therefore, in order to run your code, you need to type in the emulator:
            RANDOMIZE USR 25000
        - If everything is right, you´ll see the "hello, world!" message in the screen. You are set to start writing your JavaScript for ZX Spectrum!!!

## Other platforms

    I have no idea how to make this work in Linux or Mac, but I believe the steps would be the same.


# Files
(note that .asc stands for assemply libraries that can be included in the general code)

* config.py      general configuration files, mostly stuffed with global variables
* graph.asc      assembly library for ZX Spectrum graphics
* input.js       input file with source javaScript code
* io.asc         assembly library for ZX Spectrum I/O
* main.py        >>> main python program. the one you need to run
* math.asc       assembly library for math
* output.asm     output file containing result of compilation
* testplan.js    test plan with main features, used for non-regression tests
* translator.py  >>> here is the meat. all the translation process is done here.
* utils.py       other routines used by main.py and translator.py
