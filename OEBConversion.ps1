$path = Read-Host -Prompt 'Input path to titles: '
$oem_files = Get-ChildItem $path | Where-Object {$_.Extension -eq ".asp"}
ForEach ($file in $oem_files) 
{
	$filenew = $file.Name
	$filenew = $filenew.replace("asp","html")
	Rename-Item $path$file $filenew
}
Function DeleteLineFromFile ($Path, $LineNumber){
    $Content = Get-Content -Path $Path
    $Content -replace [regex]::Escape($Content[$LineNumber-1]) | 
		Set-Content -Path $Path
}

$files = Get-ChildItem "$path*" -Include *.html

ForEach($file in $files)
{
	11..1 | % {DeleteLineFromFile -Path $file -LineNumber $_}
	$content = Get-Content $file -ReadCount 0
	Set-Content $file -Value ($content | Select-Object -First ($content.count-1))
	(gc $file) | ? {$_.trim() -ne "" } | set-content $file
}


$links = "<html><body><h1>Table of Contents</h1><p style='text-indent:0pt'>" 
Set-Content '$path.html' ""

$xmldata = New-Object XML
$xmldata.Load("c:\temp\OEBConversion\16669\book.xml")
$list = $xmldata.SelectNodes('Book/Page')
ForEach ($item in $list)
{
	 $links += "<a href='{0}.html'>{0}.html</a><br/>" -f $item.GetAttribute("id")
}
$links += "</p></body></html>"
#Write-Host $links
$links.trim() | Add-Content C:\temp\OEBConversion\16669.html