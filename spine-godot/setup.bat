rmdir godot /s /q
git clone --depth 1 https://github.com/godotengine/godot.git -b 3.4.4-stable
xcopy /E /I .idea godot\.idea
copy custom.py godot
rmdir spine_godot\spine-cpp /s /q
xcopy /E /I ..\spine-cpp\spine-cpp spine_godot\spine-cpp
cd godot & git apply ../livepp.patch & scons target=debug custom_modules=..\spine_godot vsproj=yes livepp=%LIVEPP% --jobs=16 & cd ..
