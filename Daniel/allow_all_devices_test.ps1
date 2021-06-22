#Stage 2 - Load CSV file and add ActiveSyncEntries.

 

Function FileName($initialDirectory){

##----------------------------------------------------------------------------------------------------           

##  Function: FileName           

##  Purpose: This function opens up an Open file window for selection - useful for script mobility.

##----------------------------------------------------------------------------------------------------                           

 

 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |

Out-Null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog

$OpenFileDialog.initialDirectory = $initialDirectory

$OpenFileDialog.filter = "CSV Files (*.csv)| *.csv"

$OpenFileDialog.ShowDialog() | Out-Null

$OpenFileDialog.filename

#END Function FileName

}

 

#Import the CSV file and set the deviceID column to a variable.

FileName -initialDirectory c:\ | import-csv | ForEach-Object {

 

$identity = $_.Identity

$Did = $_.DeviceID

 

#Add the device to the Allowed Device IDs for that user

Set-CASMailbox $identity –ActiveSyncAllowedDeviceIDs @{Add=$Did}

 

}