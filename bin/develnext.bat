@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  DevelNext startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with Windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and DEVELNEXT_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\DevelNext.jar;%APP_HOME%\lib\jphp-core-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\develnext-launcher-0.9.2.jar;%APP_HOME%\lib\develnext-designer-0.9.2.jar;%APP_HOME%\lib\jphp-gui-richtext-ext-1.0.jar;%APP_HOME%\lib\jphp-app-framework-0.9.2.jar;%APP_HOME%\lib\jphp-desktop-ext-0.9.2.jar;%APP_HOME%\lib\jphp-systemtray-ext-0.9.2.jar;%APP_HOME%\lib\jphp-parser-0.9.2.jar;%APP_HOME%\lib\jphp-zip-ext-0.9.0-SNAPSHOT.jar;%APP_HOME%\lib\develnext-doc-1.0.jar;%APP_HOME%\lib\develnext-store-1.0.jar;%APP_HOME%\lib\develnext-java-platform-1.0.jar;%APP_HOME%\lib\develnext-js-platform-1.0.jar;%APP_HOME%\lib\dn-php-sdk-0.9.2.jar;%APP_HOME%\lib\dn-zend-php-sdk-0.9.2.jar;%APP_HOME%\lib\jphp-xml-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-json-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-zend-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-sql-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-debugger-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-runtime-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\asm-all-5.2.jar;%APP_HOME%\lib\jphp-gui-ext-0.9.2.jar;%APP_HOME%\lib\develnext-lexer-1.0.jar;%APP_HOME%\lib\richtextfx-0.8.1.jar;%APP_HOME%\lib\zt-zip-1.11.jar;%APP_HOME%\lib\dn-httpclient-bundle.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\HikariCP-java6-2.3.7.jar;%APP