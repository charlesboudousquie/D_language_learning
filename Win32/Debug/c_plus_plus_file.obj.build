set PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\bin\HostX86\x86;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE;C:\Program Files (x86)\Windows Kits\10\bin;C:\D\dmd2\windows\bin;%PATH%
set DMD_LIB=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\lib\x86;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x86;C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\um\x86
set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\
set VCTOOLSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30037\
set VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\
set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\10\
set WindowsSdkVersion=10.0.19041.0
set UniversalCRTSdkDir=C:\Program Files (x86)\Windows Kits\10\
set UCRTVersion=10.0.19041.0
pushd .
call "%VCINSTALLDIR%\Auxiliary\Build\vcvarsall.bat" x86
popd
cl -c -FoWin32\Debug\c_plus_plus_file.obj -Z7 c_plus_plus_file.cpp
:reportError
if %errorlevel% neq 0 echo Building Win32\Debug\c_plus_plus_file.obj failed!
