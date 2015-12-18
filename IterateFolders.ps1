	$CSV = Import-Csv "C:\OEBs.csv" -Header "Title_ID","EAN"
    Get-ChildItem T:\ | Where {$_.PSIsContainer} | 
    Foreach {
			echo "$_"
			$parent = $_
			Get-ChildItem T:\\$parent | Where {$_.PSIsContainer} | 
				Foreach {
					$Folder = $_
					echo "   $Folder"
					if ($CSV.Where({$PSItem.Title_ID -eq $Folder }).Title_ID -eq $Folder) {echo "Not Null $($CSV.Where({$PSItem.Title_ID -eq $Folder }).Title_ID)"; $NotNull++;}else{echo "Null $($CSV.Where({$PSItem.Title_ID -eq $Folder }).Title_ID)"; $IsNull++}
				}
			 }
	ECHO "Not Null: " $NotNull
	ECHO "Null: " $IsNull