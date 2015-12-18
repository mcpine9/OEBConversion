$path = '.\16669\book.xml'

$xmldata = New-Object XML
$xmldata.Load("c:\temp\OEBConversion\16669\book.xml")
$list = $xmldata.SelectNodes('Book/Page')
$pagelist = '.\pagelist.txt'
$csv = ""
ForEach ($item in $list)
{
	 $csv += $item.GetAttribute("id")
	 $csv += ","
}

Add-Content $pagelist $csv