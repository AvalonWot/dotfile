$source = Split-Path -Path $PROFILE -Parent
if (Test-Path $source)
{
    Write-Host "Backup old powershell config directory"
    (Get-Item $source).MoveTo("${source}.bak")
}
$target = Get-Item .
New-Item -ItemType Junction -Path $source -Target $target
