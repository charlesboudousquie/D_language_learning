set PATH=.\bin;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE;C:\Program Files (x86)\Windows Kits\10\bin;C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.16.27023\bin\HostX86\x86;%PATH%
"C:\Program Files (x86)\VisualD\pipedmd.exe" -gdcmode -deps "x64\Debug GDC\visual_d_test.dep" gdc -mconsole -m64 -g -fno-inline-functions -fdebug -fXf="x64\Debug GDC\visual_d_test.json" -o "x64\Debug GDC\visual_d_test.exe_cv" "x64/Debug GDC/c_plus_plus_file.obj" visual_d_test.d
if %errorlevel% neq 0 goto reportError
if not exist "x64\Debug GDC\visual_d_test.exe_cv" (echo "x64\Debug GDC\visual_d_test.exe_cv" not created! && goto reportError)
echo Converting debug information...
"C:\Program Files (x86)\VisualD\cv2pdb\cv2pdb.exe" "x64\Debug GDC\visual_d_test.exe_cv" "x64\Debug GDC\visual_d_test.exe" "x64\Debug GDC\visual_d_test.pdb"
if %errorlevel% neq 0 goto reportError
if not exist "x64\Debug GDC\visual_d_test.exe" (echo "x64\Debug GDC\visual_d_test.exe" not created! && goto reportError)

goto noError

:reportError
echo Building x64\Debug GDC\visual_d_test.exe failed!

:noError
