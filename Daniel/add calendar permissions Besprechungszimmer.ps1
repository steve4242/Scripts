Add-MailboxFolderPermission -Identity sa14besprechungszimmer1.og:\Kalender -User beyepe -AccessRights Author
Add-MailboxFolderPermission -Identity sa14besprechungszimmer2.oggross:\Kalender -User beyepe -AccessRights Author
Add-MailboxFolderPermission -Identity sa14besprechungszimmer2.ogklein:\Kalender -User beyepe -AccessRights Author
Add-MailboxFolderPermission -Identity sa14besprechungszimmer3.og:\Kalender -User beyepe -AccessRights Author

Set-CalendarProcessing -Identity sa14besprechungszimmer1.og -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false
Set-CalendarProcessing -Identity sa14besprechungszimmer2.oggross -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false
Set-CalendarProcessing -Identity sa14besprechungszimmer2.ogklein -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false
Set-CalendarProcessing -Identity sa14besprechungszimmer3.og -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false