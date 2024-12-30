@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem  develnext startup script for Windows
@rem ##########################################################################

@rem Set local scope for the variables with Windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Set default JVM options and define paths
set DEFAULT_JVM_OPTS=
set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Determine the path to java.exe
if defined JAVA_HOME (
    set JAVA_HOME=%JAVA_HOME:"=%
    set JAVA_EXE=%JAVA_HOME%/bin/java.exe
    if exist "%JAVA_EXE%" goto init
    echo.
    echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
    echo.
    echo Please set the JAVA_HOME variable in your environment to match the
    echo location of your Java installation.
    goto fail
)

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
goto fail

:init
@rem Slurp command line arguments based on Windows variant
if "%OS%" == "Windows_NT" (
    if "%@eval[2+2]" == "4" goto 4NT_args
    set CMD_LINE_ARGS=%*
) else (
    set CMD_LINE_ARGS=%*
)

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

@rem Setup the classpath
set CLASSPATH=%APP_HOME%\lib\DevelNext.jar;%APP_HOME%\lib\jphp-core-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\develnext-launcher-0.9.2.jar;%APP_HOME%\lib\develnext-designer-0.9.2.jar;%APP_HOME%\lib\jphp-gui-richtext-ext-1.0.jar;%APP_HOME%\lib\jphp-app-framework-0.9.2.jar;%APP_HOME%\lib\jphp-desktop-ext-0.9.2.jar;%APP_HOME%\lib\jphp-systemtray-ext-0.9.2.jar;%APP_HOME%\lib\jphp-parser-0.9.2.jar;%APP_HOME%\lib\jphp-zip-ext-0.9.0-SNAPSHOT.jar;%APP_HOME%\lib\develnext-doc-1.0.jar;%APP_HOME%\lib\develnext-store-1.0.jar;%APP_HOME%\lib\develnext-java-platform-1.0.jar;%APP_HOME%\lib\develnext-js-platform-1.0.jar;%APP_HOME%\lib\dn-php-sdk-0.9.2.jar;%APP_HOME%\lib\dn-zend-php-sdk-0.9.2.jar;%APP_HOME%\lib\jphp-xml-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-json-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-zend-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-sql-ext-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-debugger-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\jphp-runtime-0.9.2-SNAPSHOT.jar;%APP_HOME%\lib\asm-all-5.2.jar;%APP_HOME%\lib\jphp-gui-ext-0.9.2.jar;%APP_HOME%\lib\develnext-lexer-1.0.jar;%APP_HOME%\lib\richtextfx-0.8.1.jar;%APP_HOME%\lib\zt-zip-1.11.jar;%APP_HOME%\lib\dn-httpclient-bundle.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\HikariCP-java6-2.3.7.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\antlr4-runtime-4.5.3.jar;%APP_HOME%\lib\reactfx-2.0-M5.jar;%APP_HOME%\lib\undofx-1.3.1.jar;%APP_HOME%\lib\flowless-0.6.jar;%APP_HOME%\lib\wellbehavedfx-0.3.jar;%APP_HOME%\lib\javassist-3.19.0-GA.jar;%APP_HOME%\lib\slf4j-api-1.7.10.jar

@rem Execute DevelNext
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %DEVELNEXT_OPTS% -classpath "%CLASSPATH%" php.runtime.launcher.Launcher %CMD_LINE_ARGS%

:end
if "%ERRORLEVEL%" == "0" goto mainEnd

:fail
if not "" == "%DEVELNEXT_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%" == "Windows_NT" endlocal
