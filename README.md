# Эмуляция флешки для КриптоПро CSP

Если под рукой нет флешки или нужно пробрасывать ее на удаленный сервер, а вам надо установить ЭЦП (есть закрытый ключ (файлики .key))

---
## Как пользоваться:

Создаем в блокноте файл, называем его как душе угодно, расширение ставим **.bat** и вставляем туда содержимое из файла subst.bat или ниже:

```
@echo off

:menu
cls
echo 1. Montirovat disk
echo 2. Udalit smontirovannii disk
set /p choice=Viberite punkt (1 ili 2): 

if "%choice%"=="1" (
    call :mountDisk
) else if "%choice%"=="2" (
    call :unmountDisk
) else (
    echo Nekorrektnii vibor. Pojaluista viberite 1 ili 2.
    pause
    goto menu
)

exit /b

:mountDisk
set /p diskName=Vvedite nazvanie diska (bukva bez dvoetochiya):
set /p directory=Vvedite put k direktorii, kotoruyu nujno montirovat (naprimer C:/SCP):

subst %diskName%: %directory%
echo Disk uspeshno sozdan i montirovan!
pause
goto :eof

:unmountDisk
set /p diskName=Vvedite nazvanie smontirovannogo diska kotorii udalit (bukva bez dvoetochiya): 

subst %diskName%: /d
echo Smontirovannii disk uspeshno udalen!
pause
goto :eof
```

---
### Немного о скрипте:

Диск создается с помощью **subst**

Скрипт отображает меню с двумя пунктами: "Монтировать диск" (пункт 1) и "Удалить смонтированный диск" (пункт 2).

Затем он выполняет соответствующее действие в зависимости от выбора пользователя.

Если выбран пункт 1, пользователю будет предложено ввести название диска (например, "**X**") и путь к директории для монтирования например **C:/SCP**.

Если выбран пункт 2, пользователь будет предложено ввести название смонтированного диска (например, "**X**").

Если введен некорректный выбор, скрипт выведет сообщение о некорректном выборе и вернется к меню.

---

#### Или сделать ручками через CMD:

1. Открываем CMD с помощью клавиш **WIN+R**

2. Смонтировать диск:

`subst A: C:\SCP`

3. Удалить смонтированный диск:

`subst A: /d`
