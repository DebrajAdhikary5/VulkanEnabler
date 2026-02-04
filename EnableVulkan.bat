@echo off
setlocal EnableDelayedExpansion
title EnableVulkan Ultimate
mode con: cols=65 lines=40

:: ==================================================
::               PROJECT INFO
:: ==================================================
:: AUTHOR: [Debraj Adhikary]
:: GITHUB: [https://github.com/DebrajAdhikary5/VulkanEnabler]
:: DESCRIPTION: A tool to force global Vulkan rendering on Android.
:: ==================================================

:: --- COLORS & CONFIG ---
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "ESC=%%b"
)
set "CYAN=%ESC%[96m"
set "RED=%ESC%[91m"
set "GREEN=%ESC%[92m"
set "YELLOW=%ESC%[93m"
set "RESET=%ESC%[0m"

:MAIN_MENU
cls

:: --- ADB CHECK ---
set "ADB_STATUS=%RED%Disconnected%RESET%"
adb get-state >nul 2>&1
if not errorlevel 1 (
    set "ADB_STATUS=%GREEN%Connected%RESET%"
)

:: --- UI HEADER ---
echo.
echo %CYAN%  = ----------------------------------------------------------- = %RESET%
echo.
echo %CYAN%      Vulkan Enforcer for Android (Ultimate)%RESET%
echo %CYAN%      By DebrajAdhikary5 %RESET%
echo.
echo      Device status: !ADB_STATUS!
echo      Update availability: %CYAN%Local Version%RESET%
echo.
echo %CYAN%  = ----------------------------------------------------------- = %RESET%
echo.
echo      EnableVulkan is standing by and awaiting your command.
echo      What's next?
echo.
echo %CYAN%      Core Features%RESET%
echo      Switch graphics API to:
echo           [1] Vulkan (SkiaVK)
echo           [2] OpenGL (Default)
echo.
echo      [3] Force-Stop All User Apps (Apply Changes)
echo.
echo %CYAN%      Diagnostics%RESET%
echo      [4] Check Live Status (Vulkan vs OpenGL)
echo.
echo %CYAN%      System%RESET%
echo      [5] Refresh Menu / Scan Device
echo      [X] Exit
echo.
echo %CYAN%  = ----------------------------------------------------------- = %RESET%
echo.
echo      Enter your choice:

:: --- INPUT HANDLER ---
choice /c 12345X /n /m "      "

if %ERRORLEVEL%==1 goto VULKAN_SUBMENU
if %ERRORLEVEL%==2 goto OPENGL_ACTION
if %ERRORLEVEL%==3 goto FORCE_STOP_ACTION
if %ERRORLEVEL%==4 goto CHECK_STATUS
if %ERRORLEVEL%==5 goto MAIN_MENU
if %ERRORLEVEL%==6 exit

:: ==================================================
::       SUB-MENU: VULKAN SELECTION
:: ==================================================
:VULKAN_SUBMENU
cls
echo.
echo %CYAN%  = ----------------------------------------------------------- = %RESET%
echo.
echo      Select Vulkan Execution Mode:
echo.
echo      [1] Normal (RECOMMENDED)
echo          - Sets 'skiavk' renderer
echo          - Soft-restarts SystemUI to apply instantly
echo.
echo      [B] Back to Main Menu
echo.
echo %CYAN%  = ----------------------------------------------------------- = %RESET%
echo.
choice /c 1B /n /m "      Select option: "

if %ERRORLEVEL%==1 goto APPLY_VULKAN
if %ERRORLEVEL%==2 goto MAIN_MENU

:: ==================================================
::       ACTION: APPLY VULKAN
:: ==================================================
:APPLY_VULKAN
cls
echo.
echo %CYAN%  [1/3] Setting Property to 'skiavk'...%RESET%
adb shell setprop debug.hwui.renderer skiavk
echo   Done.
echo.
echo %CYAN%  [2/3] Attempting Soft Restart (SystemUI)...%RESET%
echo   (Screen may flash black. This is normal.)
adb shell "stop; start" >nul 2>&1
adb shell "pkill -f com.android.systemui" >nul 2>&1
echo   Done.
echo.
echo %CYAN%  [3/3] Verifying...%RESET%
for /f "delims=" %%i in ('adb shell getprop debug.hwui.renderer') do set CHECK=%%i
echo.
if "%CHECK%"=="skiavk" (
    echo   SUCCESS! Renderer is set to: %GREEN%!CHECK!%RESET%
    echo   Please allow your phone 10-15 seconds to reload the UI.
) else (
    echo   %RED%ERROR: Could not set property.%RESET%
)
echo.
pause
goto MAIN_MENU

:: ==================================================
::       ACTION: APPLY OPENGL
:: ==================================================
:OPENGL_ACTION
cls
echo.
echo %CYAN%  Restoring OpenGL defaults...%RESET%
adb shell setprop debug.hwui.renderer opengl
adb shell "stop; start" >nul 2>&1
echo   Done.
pause
goto MAIN_MENU

:: ==================================================
::       ACTION: FORCE STOP APPS
:: ==================================================
:FORCE_STOP_ACTION
cls
echo.
echo %CYAN%  Stopping all user apps...%RESET%
echo   This ensures they reload with the new graphics settings.
echo.
adb shell "for a in $(pm list packages -3 | cut -f2 -d:); do am force-stop $a; done"
echo.
echo   %GREEN%Done!%RESET% You can now open your apps.
pause
goto MAIN_MENU

:: ==================================================
::       ACTION: CHECK STATUS (NEW)
:: ==================================================
:CHECK_STATUS
cls
echo.
echo %CYAN%  Checking Graphics Pipeline Status...%RESET%
echo   (If blank, open an app on your phone first)
echo.
echo   %YELLOW%Searching for active render pipelines:%RESET%
echo   ----------------------------------------
adb shell dumpsys gfxinfo | findstr /I "pipeline"
echo   ----------------------------------------
echo.
echo   %CYAN%Legend:%RESET%
echo   Pipeline=Skia (Vulkan) = %GREEN%ACTIVE%RESET%
echo   Pipeline=Skia (OpenGL) = %RED%INACTIVE%RESET%
echo.
pause
goto MAIN_MENU