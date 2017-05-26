
:: Check python version and required package: 
:: python --version 
:: conda config --add channels conda-forge
:: conda config --add channels willyd
:: conda update conda -y
:: conda install --yes cmake ninja numpy scipy protobuf==3.1.0 six scikit-image pyyaml pydotplus graphviz

set PATH=%PATH%;C:\Program Files\Git\bin
set CMAKE_BIN_PATH="C:\Program Files (x86)\CMake\bin"
call %CMAKE_BIN_PATH%\cmake.exe -G "Visual Studio 12 Win64" ..\ -DCMAKE_BUILD_TYPE=Release -DBLAS=Open -DBUILD_SHARED_LIBS:BOOL=0 -DBUILD_python:BOOL=1 -DBUILD_python_layer:BOOL=1 -DCUDNN_ROOT="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0" -DCUDA_ARCH_NAME:STRING=Maxwell
if ERRORLEVEL 1 (
  echo ERROR: Configure failed
  exit /b 1
)
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
devenv Caffe.sln