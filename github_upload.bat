@echo off
chcp 65001 >nul
title GitHub Yükleme Aracı
color 0A

echo.
echo ╔══════════════════════════════════════════╗
echo ║        GitHub Yükleme Aracı  v1.0        ║
echo ╚══════════════════════════════════════════╝
echo.

:: Klasör yolunu al
set /p "PROJE_YOLU=Proje klasörünün tam yolunu girin: "

if "%PROJE_YOLU%"=="" (
    echo [HATA] Klasör yolu boş bırakılamaz!
    pause & exit /b 1
)

if not exist "%PROJE_YOLU%" (
    echo [HATA] Klasör bulunamadı: %PROJE_YOLU%
    pause & exit /b 1
)

:: GitHub repo linkini al
set /p "REPO_URL=GitHub repo URL girin (https://github.com/kullanici/repo): "

if "%REPO_URL%"=="" (
    echo [HATA] Repo URL boş bırakılamaz!
    pause & exit /b 1
)

:: Commit mesajı al
set /p "COMMIT_MSG=Commit mesajı (boş = 'Initial commit'): "
if "%COMMIT_MSG%"=="" set "COMMIT_MSG=Initial commit"

echo.
cd /d "%PROJE_YOLU%"

:: .git varsa sil, temiz başla
if exist ".git" (
    echo [BİLGİ] Mevcut git deposu sıfırlanıyor...
    rmdir /s /q ".git"
)

echo [1/5] Git deposu başlatılıyor...
git init
if %errorlevel% neq 0 ( echo [HATA] git init başarısız! & pause & exit /b 1 )

echo [2/5] Remote ekleniyor...
git remote add origin %REPO_URL%
if %errorlevel% neq 0 ( echo [HATA] Remote eklenemedi! & pause & exit /b 1 )

echo [3/5] Dosyalar ekleniyor...
git add .

echo [4/5] Commit oluşturuluyor...
git commit -m "%COMMIT_MSG%"
if %errorlevel% neq 0 ( echo [HATA] Commit başarısız! & pause & exit /b 1 )

echo [5/5] GitHub'a gönderiliyor...
git branch -M main
git push -u origin main

echo.
if %errorlevel%==0 (
    echo ╔══════════════════════════════════════════╗
    echo ║   ✓  Yükleme başarıyla tamamlandı!       ║
    echo ╚══════════════════════════════════════════╝
) else (
    echo [HATA] Push başarısız.
    echo - Repo var mı ve boş mu kontrol edin.
    echo - GitHub kimlik bilgileriniz tanımlı mı kontrol edin.
)

echo.
pause