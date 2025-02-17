cd python
python main.py ..\%1 ..\%2
cd ..
.\pasmo\pasmo.exe --tap %2 output.tap
"c:\Program Files (x86)\Fuse\fuse.exe" output.tap



