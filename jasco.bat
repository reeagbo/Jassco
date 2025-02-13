cd python
python main.py ..\%1 ..\output.asm
cd ..
.\pasmo\pasmo.exe --tap output.asm %2
"c:\Program Files (x86)\Fuse\fuse.exe" %2



