$image = Get-ChildItem C:\temp\OEBConvert\16669 *cover* -File -Recurse | Where {$_.extension -eq ".jpg"}
$path = $image.FullName
$shell = New-Object -COMObject Shell.Application
$folder = Split-Path $path
$file = Split-Path $path -Leaf
$shellfolder = $shell.Namespace($folder)
$shellfile = $shellfolder.ParseName($file)
<# @(162,164) | Where-Object { $shellfolder.GetDetailsOf($shellfile, $_) } |
Foreach-Object { '{0} = {1}'  -f
$shellfolder.GetDetailsOf($null, $_), 
$( $shellfolder.GetDetailsOf($shellfile, $_) -replace '[a-zA-Z]+','' ).Trim()} #>

$imageDetail = [System.Drawing.Image]::FromFile($image.FullName)

<# [string]$imgWidth = $($shellfolder.GetDetailsOf($shellfile, 162)  -replace '[a-zA-Z]+','' ).trim()
[string]$imgHeight = $($shellfolder.GetDetailsOf($shellfile, 164)  -replace '[a-zA-Z]+','' ).trim() #>

<# [int]$intWidth = [convert]::ToInt32($imgWidth, 3)
[int]$intHeight = [convert]::ToInt32($imgHeight, 3)
[decimal]$proportion = $intWidth / $intHeight #>
$proportion = $imageDetail.Width / $imageDetail.Height
echo "Width is $($imageDetail.Width)"
echo "Height is $($imageDetail.Height)" 
echo "Proportion $proportion"

<# 0..287 | Where-Object { $shellfolder.GetDetailsOf($shellfile, $_) } | 
Foreach-Object { 
'{0} = {1} = {2}' -f $_, 
$shellfolder.GetDetailsOf($null, $_), 
$shellfolder.GetDetailsOf($shellfile, $_) 
} #>

#0..287 | Foreach-Object { '{0} = {1}' -f $_, $shellfolder.GetDetailsOf($null, $_) }
