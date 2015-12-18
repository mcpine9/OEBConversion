$TitlesPath = "U:\TEMPOEB"

Get-ChildItem $TitlesPath | Where {$_.PSIsContainer} |
	FOREACH {
		IF (!(Test-Path 	$($TitlesPath + '\' + $_.Name + '\Book.xml'))) {
			ECHO "Removing $($TitlesPath + '\' + $_.Name)"
			Remove-Item -Recurse -Force $($TitlesPath + '\' + $_.Name)
		}
	}
