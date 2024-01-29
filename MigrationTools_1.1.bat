@echo off

color B
title Menu Principal

mkdir "C:\Chrome"
mkdir "C:\Edge"
mkdir "C:\Signature_Outlook"
mkdir "C:\Template_Outlook"
mkdir "C:\Fond_Ecran"

:menu
cls
echo.
echo =================================================
echo                MAIN MENU (v1.1)           
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              	
echo   Choose options : 
echo.
echo        1 - Copy favourites
echo        2 - Outlook
echo        3 - Background copy
echo        4 - All
echo.
echo ================================================= 
set /p choix=Enter your choice :

if "%choix%"=="1" goto favcopy
if "%choix%"=="2" goto signacopy
if "%choix%"=="3" goto fond
if "%choix%"=="4" goto all
goto menu

:signacopy
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo   Select your copy : 
echo
echo        1 - Copy of signature
echo        2 - Copy Templates 
echo.
echo =================================================
set /p choix2=Enter your choice :

if "%choix2%"=="1" goto signa
if "%choix2%"=="2" goto Temp
goto signacopy

:signa
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Signatures" "C:\Fav_User\Signature_Outlook" /e /h
echo.
echo =================================================
echo Success copy           
echo =================================================
pause>nul
goto menu

:Temp
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Templates" "C:\Fav_User\Template_Outlook" /e /h
echo.
echo =================================================
echo Success copy           
echo =================================================
pause>nul
goto menu


:fond
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper" "C:\Fav_User\Fond_Ecran"
ren "C:\Fav_User\Fond_Ecran\TranscodedWallpaper" "TranscodedWallpaper.jpg"
echo.
echo =================================================
echo Success copy           
echo =================================================
pause>nul
goto menu

:favcopy
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo   Select your copy : 

echo        1 - Google Chrome 
echo        2 - Microsoft Edge
echo.
echo =================================================
set /p choix1=Enter your choice :

if "%choix1%"=="1" goto chromecopy
if "%choix1%"=="2" goto edgecopy
goto favcopy

:chromecopy
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" "C:\Fav_User\Chrome"
echo.
echo =================================================
echo Success copy           
echo =================================================
pause>nul
goto menu

:edgecopy
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks" "C:\Fav_User\Edge"
echo.
echo =================================================
echo Success copy           
echo =================================================
pause>nul
goto menu

:all
call :signa11
call :Temp11
call :fond11
call :chromecopy11
call :edgecopy11
echo.
echo ===============================
echo Success copy
echo ===============================
pause>nul
goto menu

:chromecopy11
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Bookmarks" "C:\Fav_User\Chrome\" /i /y
echo.
echo =================================================
echo Success copy           
echo =================================================

:edgecopy11
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks" "C:\Fav_User\Edge\" /i /y
echo.
echo =================================================
echo Success copy           
echo =================================================


:signa11
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Signatures" "C:\Fav_User\Signature_Outlook\" /e /h /i /y
echo.
echo =================================================
echo Success copy           
echo =================================================

:Temp11
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Templates" "C:\Fav_User\Template_Outlook\" /e /h /i /y
echo.
echo =================================================
echo Success copy           
echo =================================================

:fond11
cls
echo =================================================
echo    ___     _  _                  
echo   ^| _ \   ^| ^|^| ^|  __ _    _ _    
echo   ^|   /    \_, ^| / _` ^|  ^| ' \   
echo   ^|_^|_\   _^|__/  \__,_^|  ^|_^|^|_^|  
echo _^|"""""|_| """"|_|"""""^|_^|"""""| 
echo "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
echo.                                              
echo Copying...        
echo =================================================
xcopy "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper" "C:\Fav_User\Fond_Ecran\" /i /y
ren "C:\Fav_User\Fond_Ecran\TranscodedWallpaper" "TranscodedWallpaper.jpg"
echo.
echo =================================================
echo Success copy           
echo =================================================
