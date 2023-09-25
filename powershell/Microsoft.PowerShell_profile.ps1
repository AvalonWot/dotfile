if ($null -eq (Get-Module -Name PSReadLine))
{
    Write-Output "Installing PSReadLine Module..."
    Install-Module PSReadLine
}

$PSReadLineOptions = @{
    EditMode = "Emacs"
    HistoryNoDuplicates = $true
    HistorySearchCursorMovesToEnd = $true
    # InlinePrediction的默认颜色在windows terminal的透明背景和亚克力效果下, 很难看清
    Colors = @{ InlinePrediction = '#2e7004'}
    # 更改历史记录显示模式为ListView, InlineView不好用
    PredictionViewStyle = "ListView"
}
Set-PSReadLineOption @PSReadLineOptions

Set-PSReadLineKeyHandler -Key Ctrl+y -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+p -Function Paste
Set-PSReadLineKeyHandler -Key Ctrl+c -Function CancelLine

Set-Alias -Name ll -Value dir
