$path = '.\16669\'
#$htmlfiles = Get-ChildItem $path | Where-Object {$_.Extension -eq ".html"}
$htmlfiles = Get-ChildItem $path | Sort-Object Name
Write-Host "Writing out files."
$pagelist = '.\pagelist.txt'
$list = ""
ForEach ($file in $htmlfiles)
{
	Write-Host $file.Name.Replace($file.Extension, "")
	 $list += $file.Name.Replace($file.Extension,"")
	 $list += ","
}

Add-Content $pagelist $list