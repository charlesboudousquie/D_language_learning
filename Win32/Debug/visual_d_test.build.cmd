set PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\bin\HostX86\x86;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE;C:\Program Files (x86)\Windows Kits\10\bin;C:\D\dmd2\windows\bin;%PATH%
set DMD_LIB=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\lib\x86;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x86;C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\um\x86
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\
set VCTOOLSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\
set VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\
set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\10\
set WindowsSdkVersion=10.0.19041.0
set UniversalCRTSdkDir=C:\Program Files (x86)\Windows Kits\10\
set UCRTVersion=10.0.19041.0
"C:\Program Files (x86)\VisualD\pipedmd.exe" -deps Win32\Debug\visual_d_test.dep dmd -debug -m32mscoff -g -gf -X -Xf"Win32\Debug\visual_d_test.json" -c -of"Win32\Debug\visual_d_test.obj" Win32\Debug\c_plus_plus_file.obj visual_d_test.d
if %errorlevel% neq 0 goto reportError

set LIB=C:\D\dmd2\windows\bin\..\lib32mscoff
echo. > C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
echo Win32\Debug\c_plus_plus_file.obj  >> C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
echo "Win32\Debug\visual_d_test.obj" /OUT:"Win32\Debug\visual_d_test.exe" user32.lib  >> C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
echo kernel32.lib  >> C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
echo legacy_stdio_definitions.lib /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\lib\x86" /LIBPATH:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x86" /LIBPATH:"C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\um\x86" /DEBUG /PDB:"Win32\Debug\visual_d_test.pdb" /INCREMENTAL:NO /NOLOGO /NODEFAULTLIB:libcmt libcmtd.lib /SUBSYSTEM:CONSOLE >> C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
"C:\Program Files (x86)\VisualD\mb2utf16.exe" C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp

"C:\Program Files (x86)\VisualD\pipedmd.exe" -msmode -deps Win32\Debug\visual_d_test.lnkdep "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\bin\HostX86\x86\link.exe" @C:\Users\Charles\Desktop\d_learning\D_language_learning\Win32\Debug\visual_d_test.link.rsp
if %errorlevel% neq 0 goto reportError
if not exist "Win32\Debug\visual_d_test.exe" (echo "Win32\Debug\visual_d_test.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Win32\Debug\visual_d_test.exe failed!

:noError
