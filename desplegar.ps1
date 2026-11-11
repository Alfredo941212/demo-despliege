$archivoOrigen  = Join-Path $PSScriptRoot 'origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'pruebas\index.php'


& php -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis. No se publicó el cambio." -ForegroundColor Red
    exit 1
}


Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas." -ForegroundColor Green


