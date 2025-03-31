REM
REM Cleanup script to remove intermediate and generated files
REM

REM Root directories
rmdir /S /Q .vs
rmdir /S /Q Binaries
rmdir /S /Q Build
rmdir /S /Q Intermediate
rmdir /S /Q Saved
rmdir /S /Q DerivedDataCache

REM Plugin folders
for /D %%P in (Plugins\*) do (
    rmdir /S /Q "%%P\Binaries"
    rmdir /S /Q "%%P\Intermediate"
)

REM Delete file types recursively
for /R %%F in (*.slo *.lo *.o *.obj *.gch *.pch *.so *.dylib *.dll *.mod *.lai *.la *.a *.lib *.exe *.out *.app *.ipa *.xcodeproj *.xcworkspace *.sln *.suo *.opensdf *.sdf *.VC.db *.VC.opendb) do (
    del /F /Q "%%F"
)

REM Delete precompiled assets
for /R SourceArt %%F in (*.png *.tga) do (
    del /F /Q "%%F"
)

REM Delete map built data
for /R %%F in (*_BuiltData.uasset) do (
    del /F /Q "%%F"
)
