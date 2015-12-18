
$links = "<html><body><h1>Table of Contents</h1><p style='text-indent:0pt'>" 
Set-Content C:\temp\OEBConversion\16669.html ""

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