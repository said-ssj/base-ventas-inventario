@echo off
setlocal
pushd "%~dp0"
if not exist "target\base-ventas-inventario-admin.jar" (
 echo Primero compila el backend con mvnw.cmd package -Dbackend.artifact-name=base-ventas-inventario-admin.
 popd
 exit /b 1
)
java -jar "target\base-ventas-inventario-admin.jar" --spring.profiles.active=local,db,bootstrap-admin --server.address=127.0.0.1 --server.port=0
set "adminExitCode=%ERRORLEVEL%"
popd
exit /b %adminExitCode%
