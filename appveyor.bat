setlocal

echo %PATH%
pip install wheel
cd %REPO_DIR%\python
git checkout %BUILD_COMMIT%
sed -i 's/\[\'-Wno-write-strings\',/\[\]/g' setup.py
sed -i '/Wno-invalid-offsetof/d' setup.py
sed -i '/Wno-sign-compare/d' setup.py
cat setup.py
dir %MINGW%
set path
gcc
%MINGW%\gcc
python setup.py bdist_wheel --cpp_implementation --compile_static_extension
