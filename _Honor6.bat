@echo off
chcp 866 > nul
Set "M_BASE=HONOR 6"
set "COD_NM=H60"
Set "M_SUP=by inside!out"
if "%~1" neq "" (call :%~1)
exit

REM ------------------------------------------------ kernel --------------------------------------------------

:C_KRNL
cls
color %CB%%CST%
adb kill-server>>nul
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo     Выберите кастомное ядро (boot.img) для вашего Honor 6:
echo.
echo     *: boot имя файла, описание
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' goto KRNL_1
REM if '%input%'=='2' goto KRNL_2
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto C_KRNL

:KRNL_1
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                           Прошивка имя файлаимя файлаимя файла
echo.
echo                      *** Подключите Honor 6 в режиме отладки USB ***
echo.
echo.
echo =========================================================================================
echo ***                                Пожалуйста ждите                                   ***
echo =========================================================================================
echo.
Timeout /t 5
if exist .\RES\KIW\имя файла.img (
adb kill-server>>NUL
adb reboot bootloader
fastboot devices
fastboot flash %f_rcvr% .\RES\KIW\имя файла.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                                 Загрузка имя файлаимя файла
echo.
echo                       *** Подключите Honor 6 в режиме отладки USB ***
echo.
echo.
echo =========================================================================================
echo ***                                Пожалуйста ждите                                   ***
echo =========================================================================================
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/KIW/kимя файла.zip "http://hwmt.ru/bases/KIW/boot/имя файла.zip"
7z x ./RES/KIW/имя файла.zip -o./RES/KIW/
del .\RES\KIW\имя файла.zip
goto KRNL_1
)
goto C_KRNL

:KRNL_2
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                           Прошивка имя файлаимя файлаимя файла
echo.
echo                      *** Подключите Honor 6 в режиме отладки USB ***
echo.
echo.
echo =========================================================================================
echo ***                                Пожалуйста ждите                                   ***
echo =========================================================================================
echo.
Timeout /t 5
if exist .\RES\KIW\имя файла.img (
adb kill-server>>NUL
adb reboot bootloader
fastboot devices
fastboot flash %f_rcvr% .\RES\KIW\имя файла.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                                Загрузка имя файлаимя файла
echo.
echo                      *** Подключите Honor 6 в режиме отладки USB ***
echo.
echo.
echo =========================================================================================
echo ***                                Пожалуйста ждите                                   ***
echo =========================================================================================
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/KIW/kимя файла.zip "http://hwmt.ru/bases/KIW/boot/имя файла.zip"
7z x ./RES/KIW/имя файла.zip -o./RES/KIW/
del .\RES\KIW\имя файла.zip
goto KRNL_2
)
goto C_KRNL


:S_KRNL
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                             Меню восстановления сток ядра (boot.img)
echo.
echo  Выберете модель вашего устройства:
echo.
echo     *: H60-L04 
echo     *: H60-L01
echo     *: H60-L02
echo     *: H60-L11
echo     *: H60-L12
echo.
echo.
echox.exe -c %CB%%CWT% "   S: Отправить образ от своей модели"   
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' goto SB_L04
REM if '%input%'=='2' goto SB_L01
REM if '%input%'=='3' goto SB_L02
REM if '%input%'=='4' goto SB_L11
REM if '%input%'=='5' goto SB_L12
if /I '%input%'=='S' goto SEND_IMG_SB
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto S_KRNL

:SB_L04
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo ***                                      H60-L04                                      ***
echo =========================================================================================
echo.
echo                        Меню выбора сток ядра для восстановления
echo.
echo    1: Установить стоковое boot EMUI3.1
echo    2: Установить стоковое boot EMUI4.0
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set EMUI=EMUI3.1& set CMOD=L04& goto SB_L04_EMUI31
if '%input%'=='2' set EMUI=EMUI4.0& set CMOD=L04& goto SB_L04_EMUI40
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto SB_L04


:SB_L04_EMUI31
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     %CMOD% %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток ядра %EMUI% для восстановления
echo.
echo    *: Установить стоковое ядро B
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите "Enter"                     ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' set CBLD=B130& set LNK="http://hwmt.ru/bases/KIW/s_boot/L21/SB_KIW-L21_B130.zip"& goto SB_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto SB_L04_EMUI31


:SB_L04_EMUI40
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                      %CMOD% %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери %EMUI% для восстановления
echo.
echo    *: Установить стоковое ядро B
echo    *: Установить стоковое ядро B
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' set CBLD=B330& set LNK="http://hwmt.ru/bases/KIW/s_boot/L21/SB_KIW-L21_B330.zip"& goto SB_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto SB_L04_EMUI40

:SB_DO
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     H60-%CMOD% %EMUI%                             
echo =========================================================================================
echo.
echo                              Прошивка Сток boot %CMOD%-%CBLD%                  
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
if exist .\RES\H60\%CMOD%\SB_H60-%CMOD%_%CBLD%.img (
adb kill-server>>nul
echo Прошивка файла SB_H60-%CMOD%_%CBLD%.img ... 
adb reboot bootloader 
fastboot devices
fastboot flash boot .\RES\H60\%CMOD%\SB_H60-%CMOD%_%CBLD%.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
echo.
echo =========================================================================================
echo                                     H60-%CMOD% %EMUI%                              
echo =========================================================================================
echo.
echo                             Загрузка Сток boot %CMOD%-%CBLD%                       
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/H60/%CMOD%/SB_H60-%CMOD%_%CBLD%.zip %LNK%
7z t ./RES/H60/%CMOD%/SB_H60-%CMOD%_%CBLD%.zip >>nul
if %errorlevel% NEQ 0 goto SR_DO
7z x ./RES/H60/%CMOD%/SB_H60-%CMOD%_%CBLD%.zip -o./RES/H60/%CMOD%/
del .\RES\H60\%CMOD%\SB_H60-%CMOD%_%CBLD%.zip
goto SB_DO
)
echo =========================================================================================
echo ***                Установка завершена, нажмите пробел для продолжения                ***
echo =========================================================================================
pause >nul
call Huawei_Multi-Tool.bat :MAINMENU

:SEND_IMG_SB
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                       Отправить стоковое ядро от своего аппарата
echo.
echo    Как это сделать?
echo.           
echo    Вам потребуется:
echo    1. Приложение Huawei UPDATE Extractor(HUE). Cкачивается и открывается.
echo    2. Файл UPDATE.APP из вашей прошивки (даже OTA) 
echo.
echo    Необходимо извлечь boot.img переименовать в SB_MT7-МММ_B***.img, где МММ - ваша модель
echo    и *** - номер билда прошивки  
echo    Выложить его в теме разработки по шаблону который создаст вам программа                
echo.
echo                                       H: Открыть HUE
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='H' Echo Подготавливаю...
if /I '%input%'=='X' goto EXIT
cls
if not exist ".\HUE\HuaweiUpdateExtractor.exe" wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./HUE/HuaweiUpdateExtractor_0.9.9.3.zip http://hwmt.ru/oth/APP/HuaweiUpdateExtractor_0.9.9.3.zip& 7z x ./HUE/HuaweiUpdateExtractor_0.9.9.3.zip -o.\HUE\& del .\HUE\HuaweiUpdateExtractor_0.9.9.3.zip
mshta vbscript:Execute("Set x=CreateObject(""WScript.Shell"").CreateShortcut(""%CD%\HUE.lnk""):x.TargetPath=""%CD%\HUE\HuaweiUpdateExtractor.exe"":x.Arguments="""":x.WindowStyle=""1"":x.WorkingDirectory=""%CD%\HUE"":x.Save():Close()")& start /wait HUE.lnk
echo =========================================================================================
echo ***                    Продолжить, я сохранил файл recovery.img                       ***
echo =========================================================================================
pause >nul)
:SEND_IMG_SB_M
cls
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                       Отправить стоковое ядро от своего аппарата
echo.
echo  Выберете модель вашего устройства:
echo.
echo     1: H60-L04 
echo     2: H60-L01
echo     3: H60-L02
echo     4: H60-L11
echo     5: H60-L12
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if '%input%'=='1' set S_MOD=H60-L04& goto SEND_IMG_SB_B
if '%input%'=='2' set S_MOD=H60-L01& goto SEND_IMG_SB_B
if '%input%'=='3' set S_MOD=H60-L02& goto SEND_IMG_SB_B
if '%input%'=='4' set S_MOD=H60-L11& goto SEND_IMG_SB_B
if '%input%'=='5' set S_MOD=H60-L12& goto SEND_IMG_SB_B
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto SEND_IMG_SB_M
:SEND_IMG_SB_B
cls
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                   Отправить стоковое рекавери от своего %S_MOD%
echo.
echo  Выберете номер билда вашего устройства:
echo.
echo  Посмотреть его можно в меню "О телефоне" Он имеет вид - %S_MOD%B***
echo.
echo =========================================================================================
echo Напишите номер билда после %S_MOD% и нажмите ENTER
echo =========================================================================================
set /p S_BLD=""
echo =========================================================================================
echo ***                    Нажите пробел и скопируйте текст с экрана                      ***
echo =========================================================================================
pause >nul
cls
echo.
echo =========================================================================================
echo.
echo                  Шаблон отправки стокового рекавери от %S_MOD%%S_BLD%
echo.
echo      ******************************начало шаблона***********************************
echo.
echo       Стоковое рекавери от %S_MOD%%S_BLD% для добавления в Multi-Tool
echo       Прошу добавить в утилиту.               
echo.
echo      ******************************конец шаблона***********************************
echo.
echo =========================================================================================
echo ***                         Я скопировал, хочу отправить                              ***
echo =========================================================================================
pause >nul
start http://goo.gl/otrH8R
pause
call Huawei_Multi-Tool.bat :MAINMENU


REM -----------------------------------------------------------recovery-------------------------------------------


:PRT_SEL
set F_rcvr=recovery
set a_rcvr=recovery
set W_rcvr=RECOVERY

:TWRP_MENU
cls
color %CB%%CST%
adb kill-server>>nul
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo     Выберите кастомное рекавери для вашего Honor 6:
echo.
echo     1: Установить кастомное рекавери для EMUI 2.3-3.0
echo     2: Установить кастомное рекавери для EMUI 3.1
echo     3: Установить кастомное рекавери для EMUI 4.0
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set EMUI=EMUI3.0& set CMOD=H60& goto TWRP_EMUI30
if '%input%'=='2' set EMUI=EMUI3.1& set CMOD=H60& goto TWRP_EMUI31
if '%input%'=='3' set EMUI=EMUI4.0& set CMOD=H60& goto TWRP_EMUI40
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto TWRP_MENU


:TWRP_EMUI30
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                  Honor 6 %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери EMUI2.3-3.0 для восстановления
echo.
echo    1: Установить TWRP 2.8.6.0
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите "Enter"                     ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set TWRP_FILE=H60-TWRP_2.8.6.0& set LNK="http://hwmt.ru/bases/H60/twrp/H60-TWRP_2.8.6.0.zip"& goto TWRP_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto L09_EMUI31

:TWRP_EMUI31
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                  Honor 6 %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери EMUI3.1 для восстановления
echo.
echo    1: Установить TWRP 2.8.7.0 (brant43)
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите "Enter"                     ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set TWRP_FILE=TWRP_2.8.7.0_OTG_Lollipop_Standart& set LNK="http://hwmt.ru/bases/H60/twrp/TWRP_2.8.7.0_OTG_Lollipop_Standart.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto TWRP_EMUI31

:TWRP_EMUI40
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                  Honor 6 %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери EMUI4.0  для восстановления
echo.
echo    1: Установить TWRP 2.8.7.0 V5 (mejor)
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set TWRP_FILE=TWRP_2.8.7.0_EN_EMUI_4.0_v5_Material_Design& set LNK="http://hwmt.ru/bases/H60/twrp/TWRP_2.8.7.0_EN_EMUI_4.0_v5_Material_Design.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto TWRP_EMUI40

:TWRP_DO
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     H60 %EMUI%                             
echo =========================================================================================
echo.
echo Прошивка кастомного Recovery %TWRP_FILE% ...
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
if exist .\RES\H60\%TWRP_FILE%.img (
adb kill-server>>nul
echo Прошивка файла %TWRP_FILE%.img ... 
adb reboot bootloader 
fastboot devices
fastboot flash recovery .\RES\H60\%TWRP_FILE%.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
echo.
echo =========================================================================================
echo                                     MT7-%CMOD% %EMUI%                              
echo =========================================================================================
echo.
echo Загрузка кастомного Recovery %TWRP_FILE% ...                    
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/H60/%TWRP_FILE%.zip %LNK%
7z t ./RES/H60/%TWRP_FILE%.zip >>nul
if %errorlevel% NEQ 0 goto TWRP_DO
7z x ./RES/H60/%TWRP_FILE%.zip -o./RES/H60/
del .\RES\H60\%TWRP_FILE%.zip
goto TWRP_DO
)
echo =========================================================================================
echo ***                Установка завершена, нажмите пробел для продолжения                ***
echo =========================================================================================
pause >nul
goto ROOT_QUESTION


:ROOT_QUESTION
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                                  Установка TWRP выполнена
echo. 
echo                                 Хотите сразу получить ROOT?                             
echo.                                                      
echo                               Смартфон загрузится в рекавери  
echo.
echo =========================================================================================
echo ***                     Выберите "Y" или "N" и нажмите "Enter"                        ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='Y' ( SET rway=0
goto ROOTMENU )
if /I '%input%'=='N' call Huawei_Multi-Tool.bat :MAINMENU
goto ROOT_QUESTION

 
:S_RCVR
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                             Меню восстановления сток рекавери
echo.
echo  Выберете модель вашего устройства:
echo.
echo     *: H60-L04 
echo     *: H60-L01
echo     *: H60-L02
echo     *: H60-L11
echo     *: H60-L12
echo.
echo.
echox.exe -c %CB%%CWT% "   S: Отправить образ от своей модели"   
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' goto L09
REM if /I '%input%'=='S' goto SEND_IMG
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto S_RCVR


:SEND_IMG
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                       Отправить стоковое рекавери от своего аппарата
echo.
echo    Как это сделать?
echo.           
echo    Вам потребуется:
echo    1. Приложение Huawei UPDATE Extractor(HUE). Cкачивается и открывается.
echo    2. Файл UPDATE.APP из вашей прошивки (даже OTA) 
echo.
echo    Необходимо извлечь recovery.img переименовать в SR_МММ_B***.img, где МММ - ваша модель
echo    и *** - номер билда прошивки  
echo    Выложить его в теме разработки по шаблону который создаст вам программа                
echo.
echo                                       H: Открыть HUE
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='H' Echo Подготавливаю...
if /I '%input%'=='X' goto EXIT
cls
if not exist ".\HUE\HuaweiUpdateExtractor.exe" wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./HUE/HuaweiUpdateExtractor_0.9.9.3.zip http://hwmt.ru/oth/APP/HuaweiUpdateExtractor_0.9.9.3.zip& 7z x ./HUE/HuaweiUpdateExtractor_0.9.9.3.zip -o.\HUE\& del .\HUE\HuaweiUpdateExtractor_0.9.9.3.zip
mshta vbscript:Execute("Set x=CreateObject(""WScript.Shell"").CreateShortcut(""%CD%\HUE.lnk""):x.TargetPath=""%CD%\HUE\HuaweiUpdateExtractor.exe"":x.Arguments="""":x.WindowStyle=""1"":x.WorkingDirectory=""%CD%\HUE"":x.Save():Close()")& start /wait HUE.lnk
echo =========================================================================================
echo ***                    Продолжить, я сохранил файл recovery.img                       ***
echo =========================================================================================
pause >nul)
:SEND_IMG_M
cls
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                       Отправить стоковое рекавери от своего аппарата
echo.
echo  Выберете модель вашего устройства:
echo.
echo     1: H60-L04 
echo     2: H60-L01
echo     3: H60-L02
echo     4: H60-L11
echo     5: H60-L12
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if '%input%'=='1' set S_MOD=H60-L04& goto SEND_IMG_B
if '%input%'=='2' set S_MOD=H60-L01& goto SEND_IMG_B
if '%input%'=='3' set S_MOD=H60-L02& goto SEND_IMG_B
if '%input%'=='4' set S_MOD=H60-L11& goto SEND_IMG_B
if '%input%'=='5' set S_MOD=H60-L12& goto SEND_IMG_B
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto SEND_IMG_M
:SEND_IMG_B
cls
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                   Отправить стоковое рекавери от своего %S_MOD%
echo.
echo  Выберете номер билда вашего устройства:
echo.
echo  Посмотреть его можно в меню "О телефоне" Он имеет вид - %S_MOD%B***
echo.
echo =========================================================================================
echo Напишите номер билда после %S_MOD% и нажмите ENTER
echo =========================================================================================
set /p S_BLD=""
echo =========================================================================================
echo ***                    Нажите пробел и скопируйте текст с экрана                      ***
echo =========================================================================================
pause >nul
cls
echo.
echo =========================================================================================
echo.
echo                  Шаблон отправки стокового рекавери от %S_MOD%%S_BLD%
echo.
echo      ******************************начало шаблона***********************************
echo.
echo       Стоковое рекавери от %S_MOD%%S_BLD% для добавления в Multi-Tool Honor 6
echo       Прошу добавить в утилиту.               
echo.
echo      ******************************конец шаблона***********************************
echo.
echo =========================================================================================
echo ***                         Я скопировал, хочу отправить                              ***
echo =========================================================================================
pause >nul
start http://goo.gl/otrH8R
pause
goto MAINMENU

REM ************************************** L04 *************************************

:L04
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo ***                                      H60-L04                                      ***
echo =========================================================================================
echo.
echo                        Меню выбора сток рекавери для восстановления
echo.
echo    1: Установить стоковое Recovery EMUI3.0
echo    2: Установить стоковое Recovery EMUI3.1
echo    3: Установить стоковое Recovery EMUI4.0
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' set EMUI=EMUI3.0& set CMOD=L04& goto L04_EMUI31
if '%input%'=='2' set EMUI=EMUI3.1& set CMOD=L04& goto L04_EMUI31
if '%input%'=='3' set EMUI=EMUI4.1& set CMOD=L04& goto L04_EMUI40
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto L09


:L04_EMUI30
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     %CMOD% %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери %EMUI% для восстановления
echo.
echo    *: Установить стоковое Recovery B***
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите "Enter"                     ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' set CBLD=B130& set LNK="https://www.cubbyusercontent.com/pl/"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto L04_EMUI30



:L04_EMUI31
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     %CMOD% %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери %EMUI% для восстановления
echo.
echo    *: Установить стоковое Recovery B***
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите "Enter"                     ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' set CBLD=B130& set LNK="https://www.cubbyusercontent.com/pl/"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto L09_EMUI31


:L04_EMUI40
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                      %CMOD% %EMUI%
echo =========================================================================================
echo.
echo                    Меню выбора сток рекавери %EMUI% для восстановления
echo.
echo    *: Установить стоковое Recovery B***
echo.
echo.
echo    M: Обратно в Главное меню                     B: В меню выбора моделей
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
REM if '%input%'=='1' set CBLD=B330& set LNK="http://hwmt.ru/bases/MT7/s_rcvr/L09/SR_MT7-L09_B330.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto S_RCVR
if /I '%input%'=='X' goto EXIT
goto L09_EMUI40


:SR_DO
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo                                     H60-%CMOD% %EMUI%                             
echo =========================================================================================
echo.
echo                           Прошивка Сток Recovery %CMOD%-%CBLD%                  
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
if exist .\RES\H60\SR_H60-%CMOD%_%CBLD%.img (
adb kill-server>>nul
echo Прошивка файла SR_H60-%CMOD%_%CBLD%.img ... 
adb reboot bootloader 
fastboot devices
fastboot flash recovery .\RES\H60\SR_H60-%CMOD%_%CBLD%.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
echo.
echo =========================================================================================
echo                                     H60-%CMOD% %EMUI%                              
echo =========================================================================================
echo.
echo                           Загрузка Сток Recovery %CMOD%-%CBLD%                       
echo.
echo =========================================================================================
echo ***                                  Пожалуйста ждите                                 ***
echo =========================================================================================
echo.
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/H60/SR_H60-%CMOD%_%CBLD%.zip %LNK%
7z t ./RES/H60/SR_H60-%CMOD%_%CBLD%.zip >>nul
if %errorlevel% NEQ 0 goto SR_DO
7z x ./RES/H60/SR_H60-%CMOD%_%CBLD%.zip -o./RES/H60/
del .\RES\H60\SR_H60-%CMOD%_%CBLD%.zip
goto SR_DO
)
echo =========================================================================================
echo ***                Установка завершена, нажмите пробел для продолжения                ***
echo =========================================================================================
pause >nul
goto Huawei_Multi-Tool.bat :MAINMENU

:S_RCVR2
cls
echo ВРЕМЕННО НЕ ДОСТУПНО
pause
call Huawei_Multi-Tool.bat :MAINMENU
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echo                             Меню восстановления сток eRECOVERY
echo.
echo    %L-ST-Sel_model_ur_dev%
echo.
echo     *: PLK-L01                             
echo     *: PLK-AL10                           
echo     *: PLK-UL00
echo     *: PLK-CL00 (присылайте сток рекавери)
echo     *: PLK-TL01H 
echo     *: PLK-TL00 (присылайте сток рекавери)
echo.
echo.
echo    S: %L-ST-Send_us_img_fr_ur_model% (recovery2.img) 
echo    M: %L-ST-back_t_MM%
echo    X: %L-ST-Clse_utlt%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-chse_nmb_or_ltr_n_prss_entr%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
set /p input=%L-ST-u_chois%:
REM if '%input%'=='1' set "CMOD=L01" & goto SR2_L01
if /I '%input%'=='S' set "SEND_IM_NAME=SR2" & set "SEND_IM_SP=recovery2" & call Huawei_Multi-Tool.bat :SEND_IMG
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto S_RCVR2

:SR2_L01
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "PLK-L01" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-ST-Restr_st_rcvr_menu%
echo.
echo    1: %L-ST-To_inst_st% %L-rcvr% EMUI3.1
echo    2: %L-ST-To_inst_st% %L-rcvr% EMUI4.0
echo    3: %L-ST-To_inst_st% %L-rcvr% EMUI4.0.1
echo.
echo.
echo    P: %L-ST-Back_prev_men%
echo    M: %L-ST-back_t_MM%  
echo    X: %L-ST-Clse_utlt%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-chse_nmb_or_ltr_n_prss_entr%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
set /p input=%L-ST-u_chois%:
if '%input%'=='1' set EMUI=EMUI3.1& goto SR2_L01_EMUI31
if '%input%'=='2' set EMUI=EMUI4.0& goto SR2_L01_EMUI40
if '%input%'=='3' set EMUI=EMUI4.0.1& goto SR2_L01_EMUI401
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='P' goto S_RCVR2
if /I '%input%'=='X' goto EXIT
goto SR2_L01


:SR2_L01_EMUI31
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%COD_NM%-%CMOD% %EMUI%" & echox.exe -c %CB%%CST% "***"          
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-ST-Restr_st_rcvr_menu% %EMUI%
echo.
echo    1: %L-ST-To_inst_st% %L-rcvr% B100_WEU/UK
echo.
echo.
echo    P: %L-ST-Back_prev_men%
echo    M: %L-ST-back_t_MM%
echo    X: %L-ST-Clse_utlt%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-chse_nmb_or_ltr_n_prss_entr%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
set /p input=%L-ST-u_chois%:
if '%input%'=='1' set CBLD=B100& set LNK="http://hwmt.ru/bases/PLK/s_rcvr/L01/SR_L01_B100.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='P' goto S_RCVR2
if /I '%input%'=='X' goto EXIT
goto SR2_L01_EMUI31


:SR2_L01_EMUI40
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%COD_NM%-%CMOD% %EMUI%" & echox.exe -c %CB%%CST% "***"          
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-ST-Restr_st_rcvr_menu% %EMUI%
echo.
echo    1: %L-ST-To_inst_st% %L-rcvr% B311_RU BETA
echo.
echo.
echo    P: %L-ST-Back_prev_men%
echo    M: %L-ST-back_t_MM%
echo    X: %L-ST-Clse_utlt%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-chse_nmb_or_ltr_n_prss_entr%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
set /p input=%L-ST-u_chois%:
if '%input%'=='1' set CBLD=B311& set LNK="http://hwmt.ru/bases/PLK/s_rcvr/L01/SR_L01_B311.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='P' goto S_RCVR2
if /I '%input%'=='X' goto EXIT
goto SR2_L01_EMUI40

:SR2_L01_EMUI401
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%COD_NM%-%CMOD% %EMUI%" & echox.exe -c %CB%%CST% "***"          
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-ST-Restr_st_rcvr_menu% %EMUI%
echo.
echo    1: %L-ST-To_inst_st% %L-rcvr% B380
echo.
echo.
echo    P: %L-ST-Back_prev_men%
echo    M: %L-ST-back_t_MM%
echo    X: %L-ST-Clse_utlt%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-chse_nmb_or_ltr_n_prss_entr%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
set /p input=%L-ST-u_chois%:
if '%input%'=='1' set CBLD=B380& set LNK="http://hwmt.ru/bases/PLK/s_rcvr/L01/SR_L01_B380.zip"& goto SR_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='P' goto S_RCVR2
if /I '%input%'=='X' goto EXIT
goto SR_L01_EMUI401


::Stock recovery2 ONE DO
:SR2_DO
cls
color %CB%%CST%
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%COD_NM%-%CMOD% %EMUI%" & echox.exe -c %CB%%CST% "***"          
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-SH-Flshng% %L-stock% Recovery %CMOD%-%CBLD%                  
echo.
echox.exe -c %CB%%CWT% -w 89 -e  "%L-ST-Conn_ur_dev_in_debg_mod%"
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-Pls_wait%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
if exist .\RES\%COD_NM%\SR_%COD_NM%-%CMOD%_%CBLD%.img (
adb kill-server>>nul
adb reboot bootloader 
fastboot devices
fastboot flash recovery2 .\RES\%COD_NM%\SR_%COD_NM%-%CMOD%_%CBLD%.img
fastboot reboot
adb wait-for-device
) ELSE (
cls
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%COD_NM%-%CMOD% %EMUI%" & echox.exe -c %CB%%CST% "***"          
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
echox.exe -c %CB%%CST% -w 89 -e  "%L-SH-Dwnldng% %L-stock% Recovery %CMOD%-%CBLD%                       
echo.
echox.exe -c %CB%%CWT% -w 89 -e  "%L-ST-Conn_ur_dev_in_debg_mod%"
echo.
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-Pls_wait%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
echo.
wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./RES/%COD_NM%/SR2_%COD_NM%-%CMOD%_%CBLD%.zip %LNK%
7z t ./RES/%COD_NM%/SR2_%COD_NM%-%CMOD%_%CBLD%.zip >>nul
if %errorlevel% NEQ 0 goto SR2_DO
7z x ./RES/%COD_NM%/SR_%COD_NM%-%CMOD%_%CBLD%.zip -o./RES/%COD_NM%/
del .\RES\%COD_NM%\SR_%COD_NM%-%CMOD%_%CBLD%.zip
goto SR2_DO
)
echox.exe -c %CB%%CWT% "========================================================================================="
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%L-ST-Instn_complt_press_space_to% %L-continue%" & echox.exe -c %CB%%CST% "***"
echox.exe -c %CB%%CWT% "========================================================================================="
pause >nul
call Huawei_Multi-Tool.bat :MAINMENU

rem -------------------------------------------------------------------- ROOT -------------------------------------------------------------- 

:ROOTLINK
cls
setlocal
if not exist ".\SU\SuperSU2.46.zip" wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./SU/SuperSU2.46.zip "http://hwmt.ru/bases/H60/su/UPDATE-SuperSU-v2.46.zip"
7z t ./SU/SuperSU2.46.zip
if %errorlevel% NEQ 0 (
if exist ".\SU\SuperSU2.46.zip" del /SU/SuperSU2.46.zip
goto ROOTLINK )

:SUPERSU270
if not exist ".\SU\SuperSU2.70.zip" wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./SU/SuperSU2.70.zip "http://hwmt.ru/bases/H60/su/SuperSU_v2.70_Pro.zip"
7z t ./SU/SuperSU2.70.zip
if %errorlevel% NEQ 0 (
if exist ".\SU\SuperSU2.70.zip" del /SU/SuperSU2.70.zip
goto SUPERSU270 )


cls
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo         *************************************************************************
echo         **                     ! ! !  В Н И М А Н И Е  ! ! !                   **
echo         **                                                                     **
echo         **            ДЛЯ УСТАНОВКИ ROOT НЕОБХОДИМО КАСТОМНОЕ РЕКАВЕРИ         **
echo         *************************************************************************
echo.
echo    Выбор версии, которую необходимо установить.
echo.
echo    1: SuperSU-2.64 (EMUI 2.3-3.1)
echo    2: SuperSU-2.70 PRO (EMUI4.0)
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if '%input%'=='1' set SuperSu=SuperSU-2.64& goto ROOT_SPS
if '%input%'=='2' set SuperSu=SuperSU-2.70-pro& goto ROOT_SPS 
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
:ROOT_SPS
cls
color %CB%%CWT%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo         *************************************************************************
echo         **                     ! ! !  В Н И М А Н И Е  ! ! !                   **
echo         **                                                                     **
echo         **            ДЛЯ УСТАНОВКИ ROOT НЕОБХОДИМО КАСТОМНОЕ РЕКАВЕРИ         **
echo         *************************************************************************
echo.
echo    Выбор способа установки SuperSU
echo.
echo    1: Ручная установка после копирования zip и загрузки в TWRP
echo    2: Полуавтоматическая установка SideLoad после включения ее в TWRP
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if '%input%'=='1' (set S_SPS=mnl
goto ROOT-DEF )
if '%input%'=='2' (set S_SPS=sdld
goto ROOT-DEF )
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto ROOT_SPS

:ROOT-DEF
if %S_SPS%==mnl ( goto :ROOTPUSH_MNL )
goto ROOTPUSH_SDLD 

:ROOTPUSH_SDLD
cls
adb kill-server>>NUL
adb devices
echo =========================================================================================
echo ***                              Перезагрузка в TWRP                                  ***
echo =========================================================================================
adb reboot recovery
Timeout /t 5 >nul
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                           ВАШ СМАРТФОН ПЕРЕЗАГРУЗИЛСЯ В TWRP
echo              ЕСЛИ ЭТОГО НЕ ПРОИЗОШЛО, ОТКЛЮЧИТЕ ЕГО И ЗАЙДИТЕ САМОСТОЯТЕЛЬНО                     
echo.
echo         *************************************************************************
echo.
echo                              В рекавери необходимо выбрать:                     
echo              Advanced * ADB Sideload * Сдвитуть вправо ползунок для активации        
echo.
echo =========================================================================================
echo ***           Нажмите пробел после выполнения указанного для начала установки         ***
echo =========================================================================================
echo.
pause >nul
echo.
adb sideload ./SU/%SuperSu%.zip
cls
echo =========================================================================================
echo ***            В TWRP нажмите REBOOT SYSTEM после выполнения установки                ***
echo =========================================================================================
echo.
adb wait-for-device
echo.
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                       Хотите вернуть стоковое Recovery?
echo.
echo.
echo =========================================================================================
echo ***                     Выберите "Y" или "N" и нажмите "Enter"                        ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='Y' goto S_RCVR
if /I '%input%'=='N' call Huawei_Multi-Tool.bat :MAINMENU
call Huawei_Multi-Tool.bat :MAINMENU

:ROOTPUSH_MNL
cls
adb kill-server>>NUL
adb devices>>NUL
echo =========================================================================================
echo Копирование %SuperSu%.zip на внутренний накопитель ...
echo =========================================================================================
adb push .\SU\%SuperSu%.zip /storage/emulated/0/%SuperSu%.zip
Timeout /t 5 >nul
echo =========================================================================================
echo ***                               Перезагрузка в TWRP                                 ***
echo =========================================================================================
adb reboot recovery
Timeout /t 5 >nul
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                           ВАШ СМАРТФОН ПЕРЕЗАГРУЗИЛСЯ В TWRP
echo              ЕСЛИ ЭТОГО НЕ ПРОИЗОШЛО, ОТКЛЮЧИТЕ ЕГО И ЗАЙДИТЕ САМОСТОЯТЕЛЬНО                     
echo.
echo         *************************************************************************
echo.
echo                              В рекавери необходимо выбрать:                     
echo              Установить * Выбрать Internal storage * %SuperSu%.zip       
echo.
echo         *************************************************************************
echo             ЕСЛИ TWRP ПРЕДЛОЖИТ УСТАНОВИТЬ SuperSU, НАЖМИТЕ *do NOT inatаll*!    
echo         *************************************************************************
echo.
echo                     Нажмите REBOOT SYSTEM после выполнения установки              
echo.
echo =========================================================================================
echo ***                          Нажмите пробел для продолжения                           ***
echo =========================================================================================
echo.
pause >nul
echo.
adb kill-server>>NUL
echo.
adb devices>>NUL
adb wait-for-device
cls
echo =========================================================================================
echo ***                Удалить %SuperSu%.zip с внутреннего накопителя?              ***
echo =========================================================================================
echo.
set /p input=Y-да, N-нет:
if /I '%input%'=='N' goto MAINMENU
echo.
echo =========================================================================================
echo Удаление %SuperSu%.zip с внутреннего накопителя...
echo =========================================================================================
adb shell rm -r /storage/emulated/0/%SuperSu%.zip
Timeout /t 2 >nul
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.
echo                            Хотите вернуть стоковое Recovery?
echo.
echo.
echo =========================================================================================
echo ***                     Выберите "Y" или "N" и нажмите "Enter"                        ***
echo =========================================================================================
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='Y' goto S_RCVR
if /I '%input%'=='N' call Huawei_Multi-Tool.bat :MAINMENU
call Huawei_Multi-Tool.bat :MAINMENU

rem ---------------------------------------------------------------------- debr ------------------------------------------------------------------

:DEBRAND_MENU
echo ВРЕМЕННО НЕ ДОСТУПНО
pause
call Huawei_Multi-Tool.bat :MAINMENU
cls
color %CB%%CWT%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo         *************************************************************************
echo         **                   ! ! !  В Н И М А Н И Е  ! ! !                     **
echo         **                                                                     **
echo         **            ДЕЙСТВИЯ ТРЕБУЮТ ДОСТУПА К СИСТЕМНЫМ ФАЙЛАМ              **
echo         **                                                                     **
echo         ** Разрешите ADB отладку и дайте ROOT права для "ADB shell" в меню 0-3 **
echo         *************************************************************************
echo.
echo.
echo    1: Сохранить или Восстановить OEMINFO
echo    2: Смена модели/локализации (Тестирование!)
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
if exist ".\oeminfo.zip" del oeminfo.zip
if exist ".\oeminfo" del oeminfo
set /p input=Введите ваш выбор:
if /I '%input%'=='1' goto DEBRAND_BAK
if /I '%input%'=='2' goto DEBRAND_CONF
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto DEBRAND_MENU

:DEBRAND_BAK
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo                Меню сохранения/восстановления файла локализации
echo.
echo    1: Сохранить свой OEMINFO
echo    2: Восстановить свой OEMINFO
echo.
echo.
echo    M: Обратно в Главное меню             B: Обратно в меню смены локализации
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
if not exist ".\Backup" mkdir .\Backup
echo.
set /p input=Введите ваш выбор:
if /I '%input%'=='1' goto DEBRAND_BACKUP
if /I '%input%'=='2' goto DEBRAND_RESTORE
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto DEBRAND_MENU
if /I '%input%'=='X' goto EXIT
goto DEBRAND_BAK

:DEBRAND_BACKUP
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo ***                               Сохранение OEMINFO                                  ***
echo ***                                                                                   ***
echo ***            Разблокируйте свой Honor 6, разрешите ADB отладку с вашего ПК          ***
echo ***                 Дайте ROOT права ADB SHELL, если еще не делали этого              ***
echo ***                                                                                   ***
echo.
echo =========================================================================================
echo ***                                 Пожалуйста ждите                                  ***
echo =========================================================================================
echo.
adb kill-server>>nul
adb devices
adb shell su -c "dd if=/dev/block/platform/hi_mci.0/by-name/oeminfo of=/storage/emulated/0/oeminfo" 
adb pull /storage/emulated/0/oeminfo .\Backup\oeminfo
if not exist .\Backup\oeminfo goto Errbugreport
7z a .\Backup\oeminfo.zip .\Backup\oeminfo
if exist ".\Backup\oeminfo" del .\Backup\oeminfo
pause
adb shell rm -r /storage/emulated/0/oeminfo
call Huawei_Multi-Tool.bat :MAINMENU

:DEBRAND_RESTORE
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo ***                               Восстановление OEMINFO                              ***
echo.
echo =========================================================================================
echo ***                                 Пожалуйста ждите                                  ***
echo =========================================================================================
echo.
if exist ".\Backup\oeminfo.zip" 7z x .\Backup\oeminfo.zip -o.\Backup
if exist .\Backup\oeminfo (
adb kill-server>>NUL
adb devices
adb push .\Backup\oeminfo /storage/emulated/0/oeminfo
adb shell su -c "dd if=/storage/emulated/0/oeminfo of=/dev/block/platform/hi_mci.0/by-name/oeminfo"
pause
adb shell rm -r /storage/emulated/0/oeminfo
if exist ".\Backup\oeminfo" del .\Backup\oeminfo
) ELSE (
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo =========================================================================================
echo ***                              Файл Backup не найден!                               ***
echo =========================================================================================
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
goto DEBRAND_BACK
)
echo.
echo =========================================================================================
echo ***          Ваша благодарность и поддержка - стимул для развития проекта             ***
echo =========================================================================================
Timeout /t 5 >nul
call Huawei_Multi-Tool.bat :MAINMENU

:DEBRAND_CONF
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echox.exe -c %CB%%CWT% "                              ! ! !  В Н И М А Н И Е  ! ! !"
echo.
echox.exe -c %CB%%CWT% "                 *** Смена модели возможна только на версии Android 5.Х ***"
echo.
echox.exe -c %CB%%CWT% "                 ***Функция предоставлена в тестовом режиме***"
echo.
echo =========================================================================================
echo ***                        Подтвердите прочтение и нажмите "Enter"                    ***
echo =========================================================================================
set /p input=Я прочитал - Y, вернуться обратно - N:
if /I '%input%'=='Y' goto DEBRAND_SM
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
goto DEBRAND_CONF


:DEBRAND_SM
wget --quiet --no-check-certificate -O ./D_HELPER.bat "http://hwmt.ru/bases/MT7/D_HELPER.bat"
if exist "oeminfo.img" del oeminfo.img
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo    Выберите локализацию для смены модели с MT7-L01 RU на:
echo.
echo    1: MT7-L01 ЕВРОПА HW/EU                  *: MT7-UL00 channel/cn
echo    *: MT7-AL10 КИТАЙ ALL/CN                 7: Возврат на MT7-L01 RU
echo    *: MT7-CL00 Китай ***
echo    *: MT7-TL00 Китай ***
echo    *: MT7-TL01H Китай cmccchannel/cn
echo.
echox.exe -c %CB%%CWT% "                 *** Смена модели возможна только на версии Android 5.Х ***"
echo.
echo    M: Обратно в Главное меню             B: Обратно в меню смены локализации
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if /I '%input%'=='1' set "buffer_text=hw/eu"& set "FWID=MT7-L01C432B331"& SET "MODEL=L09"& goto DEBRAND_CHK_DO
if /I '%input%'=='7' set "buffer_text=hw/ru"& set "FWID=MT7-L01C10B328"& SET "MODEL=L09"& goto DEBRAND_CHK_DO
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='B' goto DEBRAND_MENU
if /I '%input%'=='X' goto EXIT
goto DEBRAND_SM

:DEBRAND_CHK_DO
if not exist "oeminfo.exe" ( wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate -O ./oeminfo.zip "http://forum.xda-developers.com/attachment.php?attachmentid=3611509&d=1452890445"
7z x ./oeminfo.zip -o.\
del oeminfo.zip )
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo              Смена модели на %MODEL%, локализации на hw/meafnaf  %buffer_text% 
echo.
echo                              Необходимо иметь ROOT права!
echo          Для смены локализации и модели необходимо подключить телефон в режиме 
echo            отладки USB, дать разрешение ПК на подключение к вашему Honor 6
echo                           и предоставить ROOT права ADB SHELL.
echo.    
echo            Утилита скопирует необходимые файлы в память телефона, далее в папку
echo           утилиты. Далее откроется приложения для смены локализации, необходимо
echo                 вставить из буфера локализацию и нажать кнопку сохранить
echo               Все дейстивия также будут описаны в процессе работы утилиты
echo          Внимательно следите за сообщениями утилиты, любая ошибка - сбой смены
echo.
echo.
echo                                      N: Продолжить 
echo.
echo    R: Получить ROOT                                  0: Проверить подключение
echo    M: Обратно в Главное меню                         X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if /I '%input%'=='R' goto ROOTMENU
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='0' call Huawei_Multi-Tool.bat :FIRST_CH
if /I '%input%'=='X' goto EXIT
if /I '%input%'=='N' goto DEBRAND_DO
goto DEBRAND_CHK_DO

:DEBRAND_DO
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo ***                              СМЕНА ЛОКАЛИЗАЦИИ .....                              ***
echo.
echo ***                    Подключите Honor 6 в режиме отладки USB                        ***
echo.
echo =========================================================================================
echo ***                          Нажмите пробел для продолжения                           ***
echo =========================================================================================
echo.
pause >nul
adb kill-server>>nul
adb start-server>>nul
adb devices
echo.
echo =========================================================================================
echo ***                     Копирование oeminfo в память телефона                         ***
echo =========================================================================================
echo.
adb shell su -c "dd if=/dev/block/platform/hi_mci.0/by-name/oeminfo of=/storage/emulated/0/oeminfo.img"
echo =========================================================================================
echo ***                          Копирование oeminfo на ПК                                ***
echo =========================================================================================
echo.
adb pull /storage/emulated/0/oeminfo.img oeminfo.img
if not exist oeminfo.img goto Errbugreport
echo =========================================================================================
echo ***                        Создание бэкапа вашего oeminfo                             ***
echo =========================================================================================
echo.
copy /b oeminfo.img oeminfo.bak
<nul set /p "x=%buffer_text%" | clip
echo =========================================================================================
echo ***                  Удаление файла oeminfo.img из памяти телефона                    ***
echo =========================================================================================
echo.
echo =========================================================================================
echo ***                         Запуск приложения oeminfo.exe                             ***
echo ***            Нажмите Ctr+V в окне приложения oeminfo.exe и нажмите Apply            ***
echo =========================================================================================
oeminfo.exe
echo.
echo =========================================================================================
echo ***        Копирование измененного oeminfo.img и custom.bin в память телефона         ***
echo =========================================================================================
echo %buffer_text%>./RES/%MODEL%/custom.bin
adb push oeminfo.img /storage/emulated/0/oeminfo.img
adb push ./RES/%MODEL%/custom.bin /storage/emulated/0/custom.bin
adb shell su -c mount -o remount,rw -t ext4 /dev/block/platform/hi_mci.0/by-name/system /system
adb shell su -c cp /storage/emulated/0/custom.bin /data/
adb shell su -c chmod 777 /data/custom.bin
echo.
echo =========================================================================================
echo ***                          Запись oeminfo.img в dev/block/                          ***
echo =========================================================================================
echo.
adb shell su -c "dd if=/storage/emulated/0/oeminfo.img of=/dev/block/platform/hi_mci.0/by-name/oeminfo"
adb shell su -c chmod 777 /dev/block/platform/hi_mci.0/by-name/oeminfo
echo.
adb shell rm -r /storage/emulated/0/oeminfo.img
adb kill-server>>nul
del /Q oeminfo.img
echo.
echo =========================================================================================
echo ***                         Смена модели в файле build.prop....                       ***
echo =========================================================================================
echo.
adb shell su -c cp /system/build.prop /storage/emulated/0/
adb pull /storage/emulated/0/build.prop build.prop
set verfile=build.prop
set tmpfile=build.new
set seek=ro.build.display.id=
if exist %tmpfile% del /q %tmpfile%
for /f "delims=" %%a in (%verfile%) do (
  (echo %%a)|>nul find /i "%seek%"&&((echo %seek%%FWID%)>>%tmpfile%)
  (echo %%a)|>nul find /i "%seek%"||(echo %%a)>>%tmpfile%
)
copy /y %tmpfile% %verfile% >nul
del /f /q %tmpfile% >nul
adb push build.prop /storage/emulated/0/build.prop
adb shell su -c cp /storage/emulated/0/build.prop /system/
adb shell su -c chmod 644 /system/build.prop
adb shell rm -r /storage/emulated/0/build.prop
echo.
echo =========================================================================================
echo ***                    Смена модели в файле build.prop завершена                      ***
echo =========================================================================================
echo.
echo =========================================================================================
echo ***      Скопируйте файл update.app от новой прошивки на SD карту в папку DLOAD       ***
echo =========================================================================================
echo.
echo =========================================================================================
echo ***                          Нажмите пробел для продолжения                           ***
echo =========================================================================================
echo.
pause >nul
echo.
echo =========================================================================================
echo ***      Удалите полностью ROOT в настройках приложения SuperSU (не обязательно)      ***
echo =========================================================================================
echo.
echo =========================================================================================
echo ***                          Нажмите пробел для продолжения                           ***
echo =========================================================================================
echo.
pause >nul
echo.
echo =========================================================================================
echo ***        Прошивка сток рекавери для вашей модели /текущая прошивка и модель/        ***
echo =========================================================================================
echo.
echo =========================================================================================
echo ***        Откроется меню выбора сток рекавери, нужно выбрать сток рекавери от        ***
echo ***                  прошивки, которая была до выполненных операций.                  ***
echo ***                                                                                   ***
echo ***                  Дальнейшая инструкция откроется в другом окне                    ***
echo =========================================================================================
echo ***            Нажмите пробел для перехода в меню восстановления рекавери             ***
echo =========================================================================================
echo.
pause >nul
start D_HELPER.bat
Timeout /t 3 >nul
echo.
echo =========================================================================================
echo ***          Ваша благодарность и поддержка - стимул для развития проекта             ***
echo =========================================================================================
Timeout /t 5 >nul
goto S_RCVR


REM ----------------------------------------------------------------------------------extra ----------------------------------------------------------


:FUNC_UNLOCK
echo ВРЕМЕННО НЕ ДОСТУПНО
pause
call Huawei_Multi-Tool.bat :MAINMENU

cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.                   Включить скрытые возможности прошивки EMUI 3.1-4.0
echo. 
echox.exe -c %CB%%CWT% "   Подключите Honor 6 к ПК в режиме отладки USB"
echo.
echo    1: Кнопка скрыть наэкранные клавиши в навбаре
echo    2: Отображение скорости сети
echo    3: Режим перевернутого экрана в ручном режиме (180')
echo    4: Отображение меню шрифтов в меню Экран
echo    5: Отображение типа сети в статусбаре всегда (перезагрузка)
echo.
echo    S: Самостоятельно ввести значение
echo    L: Посмотреть все значения (откроется файл s_s_list.txt)
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
cls
echo =========================================================================================
echox.exe -c %CB%%CWT% "                 Подключите Honor 6 к ПК в режиме отладки USB"
echo =========================================================================================
@adb wait-for-device
if '%input%'=='1' set P_NAME=hide_virtual_key& set P_VAL=1& goto FUNC_UNLOCK_PRE
if '%input%'=='2' set P_NAME=show_network_speed_enabled& set P_VAL=1& goto FUNC_UNLOCK_PRE
if '%input%'=='3' set P_NAME=user_rotation& set P_VAL=2& goto FUNC_UNLOCK_PRE 
if '%input%'=='4' set P_NAME=hw_hide_font_style& set P_VAL=false& goto FUNC_UNLOCK_PRE
REM if '%input%'=='6' set P_NAME=hw_networkmode_gstyle& set P_VAL=true& set RI=Y& goto FUNC_UNLOCK_PRE
if '%input%'=='5' set P_NAME=isShowNetworkType& set P_VAL=1& set RI=Y& goto FUNC_UNLOCK_PRE
REM if '%input%'=='8' set P_NAME=battery_percent_switch_in& set P_VAL=1& goto FUNC_UNLOCK_PRE
if /I '%input%'=='S' ( set /p P_NAME=Ведите имя настройки: 
set /p P_VAL=Введите значение настройки: 
set /p RI=Нужна перезагрузка? Y-да / ENTER-нет 
goto FUNC_UNLOCK_PRE)
if /I '%input%'=='L' adb shell settings list system > s_s_list.txt& start s_s_list.txt
if /I '%input%'=='S' goto FUNC_UNLOCK_M
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' goto EXIT
goto FUNC_UNLOCK
:FUNC_UNLOCK_PRE
For /F "Delims=" %%I In ('adb shell settings get system %P_NAME%') Do Set VAL=%%~I
echo Текущее значение параметра %P_NAME% = %VAL%. Поменять значение?
set /p input=Y-да / N-нет:
if /I '%input%'=='Y' goto FUNC_UNLOCK_DO
goto FUNC_UNLOCK 
:FUNC_UNLOCK_DO
echo Меняю значение параметра на %P_VAL%
adb shell settings put system %P_NAME% %P_VAL%
For /F "Delims=" %%I In ('adb shell settings get system %P_NAME%') Do Set VAL=%%~I
echo Значение параметра %P_NAME% после смены = %VAL%
if /I '%RI%'=='Y' ( echo Происходит перезагрузка вашего Honor 6 для применения настроек.
Timeout /t 10
set RI=""
adb reboot
goto FUNC_UNLOCK )
Timeout /t 10& goto FUNC_UNLOCK

:INSTBOOTANIM
cls
color %CB%%CST%
echo.
echo =========================================================================================
echox.exe -n -c %CB%%CST% "***" & echox.exe -n -c %CB%%CST% -w 83 -e "%M_BASE% %M_SUP%" & echox.exe -c %CB%%CST% "***"
echo =========================================================================================
echo.
echo.               Установка BOOTANIMATION.ZIP для HONOR 6
echo. 
echox.exe -c %CB%%CWT% "   Выберите нужную бутанимацию:"
echo.
echo    1: 3DNebula                   18: Huawei_HONOR_Pro
echo    2: Android_in_Clock_Hell      19: LG_G_Watch
echo    3: Android_L_v2               20: Lollipop
echo    4: BiosBoot_Note_2            21: MegaQuake
echo    5: Candyroms                  22: MetroAndroid_1
echo    6: ColorAtom                  23: MiracleAnimation
echo    7: ColorCountdown             24: MIUI_V6
echo    8: Custom_Android             25: Rain
echo    9: Cyanogenmod_12.1           26: RotationSprings
echo   10: DBZ                        27: Shockwaves
echo   11: DeathStar                  28: Sony_xperia
echo   12: DiscoPeter                 29: Sparkorb
echo   13: Dive                       30: Spiral
echo   14: Droid_Atom                 31: Starting_Windows
echo   15: Fira                       32: Watercolor_Romance
echo   16: Heart                      33: Win8
echo   17: HUAWEI                     34: WinPhoneStartup
echo.
echo    P: Предпросмотр бутанимации
echo    B: Восстановление стоковой бутанимации
echo.
echo.
echo    M: Обратно в Главное меню
echo    X: Зарыть утилиту
echo.
echo =========================================================================================
echo ***                    Выберите цифру или букву и нажмите  "Enter"                    ***
echo =========================================================================================
set /p input=Введите ваш выбор:
if /I '%input%'=='1' set "BTA=3dNebula"& goto BOOTANIMINST
if /I '%input%'=='2' set "BTA=Android_in_Clock_Hell"& goto BOOTANIMINST 
if /I '%input%'=='3' set "BTA=Android_L_v2"& goto BOOTANIMINST 
if /I '%input%'=='4' set "BTA=BiosBoot_Note_2"& goto BOOTANIMINST 
if /I '%input%'=='5' set "BTA=Candyroms"& goto BOOTANIMINST 
if /I '%input%'=='6' set "BTA=ColorAtom"& goto BOOTANIMINST
if /I '%input%'=='7' set "BTA=ColorCountdown"& goto BOOTANIMINST
if /I '%input%'=='8' set "BTA=Custom_Android"& goto BOOTANIMINST 
if /I '%input%'=='9' set "BTA=Cyanogenmod_12_1"& goto BOOTANIMINST 
if /I '%input%'=='10' set "BTA=DBZ"& goto BOOTANIMINST 
if /I '%input%'=='11' set "BTA=DeathStar"& goto BOOTANIMINST 
if /I '%input%'=='12' set "BTA=DiscoPeter"& goto BOOTANIMINST
if /I '%input%'=='13' set "BTA=Dive"& goto BOOTANIMINST 
if /I '%input%'=='14' set "BTA=Droid_Atom"& goto BOOTANIMINST 
if /I '%input%'=='15' set "BTA=Fira"& goto BOOTANIMINST
if /I '%input%'=='16' set "BTA=Heart"& goto BOOTANIMINST 
if /I '%input%'=='17' set "BTA=HUAWEI"& goto BOOTANIMINST 
if /I '%input%'=='18' set "BTA=Huawei_HONOR_Pro"& goto BOOTANIMINST
if /I '%input%'=='19' set "BTA=LG_G_Watch"& goto BOOTANIMINST 
if /I '%input%'=='20' set "BTA=Lollipop"& goto BOOTANIMINST 
if /I '%input%'=='21' set "BTA=MegaQuake"& goto BOOTANIMINST
if /I '%input%'=='22' set "BTA=MetroAndroid_1"& goto BOOTANIMINST 
if /I '%input%'=='23' set "BTA=MiracleAnimation"& goto BOOTANIMINST
if /I '%input%'=='24' set "BTA=MIUI_V6"& goto BOOTANIMINST 
if /I '%input%'=='25' set "BTA=Rain"& goto BOOTANIMINST
if /I '%input%'=='26' set "BTA=RotationSprings"& goto BOOTANIMINST 
if /I '%input%'=='27' set "BTA=Shockwaves"& goto BOOTANIMINST
if /I '%input%'=='28' set "BTA=Sony_xperia"& goto BOOTANIMINST
if /I '%input%'=='29' set "BTA=Sparkorb"& goto BOOTANIMINST 
if /I '%input%'=='30' set "BTA=Spiral"& goto BOOTANIMINST
if /I '%input%'=='31' set "BTA=Starting_Windows"& goto BOOTANIMINST
if /I '%input%'=='32' set "BTA=Watercolor_Romance"& goto BOOTANIMINST
if /I '%input%'=='33' set "BTA=Win8"& goto BOOTANIMINST
if /I '%input%'=='34' set "BTA=WinPhoneStartup"& goto BOOTANIMINST
if /I '%input%'=='P' START http://hwmt.ru/oth/img/preview.html
if /I '%input%'=='B' set "BTA=Honor6"& goto BOOTANIMINST
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU
if /I '%input%'=='X' call Huawei_Multi-Tool.bat :EXIT
goto INSTBOOTANIM

:BOOTANIMINST
cls
color %CB%%CST%
echo.
echo =========================================================================================
echo ***                            Скачивание БутАнимации .....                           ***
echo =========================================================================================
echo.
if exist ".\USER\BOOTANIMATION\%BTA%.zip" goto BOOTANIMINST1
wget --quiet --no-check-certificate -O ./USER/BOOTANIMATION/%BTA%.zip http://hwmt.ru/oth/BOOTANIMATION/%BTA%.zip
del .\USER\BOOTANIMATION\bootanimation.zip >nul
copy .\USER\BOOTANIMATION\%BTA%.zip .\USER\BOOTANIMATION\bootanimation.zip >nul
:BOOTANIMINST1
Timeout /t 2 >nul
CLS
echo =========================================================================================
echo ***                            Установка БутАнимации .....                            ***
echo =========================================================================================
echo.
adb kill-server>>nul
adb start-server>>nul
adb devices
adb shell su -c mount -o remount,rw -t ext4 /dev/block/platform/hi_mci.0/by-name/cust /cust
adb push .\USER\BOOTANIMATION\bootanimation.zip /storage/emulated/0/bootanimation.zip
adb shell su -c cp /storage/emulated/0/bootanimation.zip /cust/preinstalled/public/media
adb shell su -c chmod 644 /cust/preinstalled/public/media/bootanimation.zip
adb shell rm /storage/emulated/0/bootanimation.zip
adb kill-server>>nul
echo.
echo =========================================================================================
echo ***                           Смена БутАнимации завершена                             ***
echo =========================================================================================
echo.
Timeout /t 2 >nul
goto INSTBOOTANIM

:DUMPSYSTEM
cls
echo ВРЕМЕННО НЕ ДОСТУПНО
pause
call Huawei_Multi-Tool.bat :MAINMENU

:DOWNLOADALL
cls
echo ВРЕМЕННО НЕ ДОСТУПНО
pause
call Huawei_Multi-Tool.bat :MAINMENU

:ERR
cls
echo =========================================================================================
echo ***                      Неверный ввод, возврат в главное меню                        ***
echo =========================================================================================
Timeout /t 5
if /I '%input%'=='M' call Huawei_Multi-Tool.bat :MAINMENU

:EXIT
adb kill-server>>nul
echo.
echo =========================================================================================
echo ***          Ваша благодарность и поддержка - стимул для развития проекта             ***
echo =========================================================================================
Timeout /t 5 >nul
exit