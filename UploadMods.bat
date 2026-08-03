@echo off

echo [1/4] Actualizando hashes de Packwiz...
packwiz refresh

echo.
echo [2/4] Guardando cambios locales...
git add .

git diff --cached --quiet
if errorlevel 1 (
    echo Creando commit...
    git commit -m "Actualizacion automatica de mods"
) else (
    echo No hay cambios nuevos.
)

echo.
echo [3/4] Sincronizando con GitHub...
git pull origin main
if errorlevel 1 (
    echo.
    echo [ERROR] Hubo un problema al descargar de GitHub.
    pause
    exit /b
)

echo.
echo [4/4] Subiendo todo a GitHub...
git push origin main
if errorlevel 1 (
    echo.
    echo [ERROR] No se pudieron subir los cambios a GitHub.
    pause
    exit /b
)

echo.
echo ¡Listo! Modpack sincronizado correctamente.
pause