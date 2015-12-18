$CSV = Import-Csv "C:\OEBs.csv" -Header "Title_ID","EAN"
$CSV.Where({$PSItem.Title_ID -eq '60'}).EAN
# foreach($row in $CSV)
   # {
  
   # $field1 = $row.Title_ID
  
   # $field2 = $row.EAN
  
   
  
   # Echo "$field1, $field2"
  
   # }