Import-CSV "H:\Scripts\Append_CSV\Namen.csv" |
    ForEach-Object {
      $samAccountname = ""
      $samAccountname = $_."SamID"
      $department = (get-aduser $samaccountname -Properties department).department
      [pscustomobject]@{
            department=$department 
            SamID=$samAccountname 
        }
    } |
    select SamID,department |
    Export-CSV H:\Scripts\Append_CSV\new_names.csv -Append -NoTypeInformation