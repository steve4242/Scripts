Get-MailBox -ResultSize Unlimited | where {$_.ResourceType -eq "Room"} | Set-MailboxCalendarConfiguration -WorkingHoursStartTime 06:00:00 -WorkingHoursEndTime 22:00:00
Get-MailBox -ResultSize Unlimited | where {$_.ResourceType -eq "Room"} | Set-MailboxCalendarConfiguration -WorkDays Weekdays,Saturday
Get-MailBox -ResultSize Unlimited | where {$_.ResourceType -eq "Room"} | Set-MailboxCalendarConfiguration -WorkingHoursTimeZone "W. Europe Standard Time"
Get-MailBox -ResultSize Unlimited | where {$_.ResourceType -eq "Room"}  | Get-MailboxCalendarConfiguration

Set-MailboxCalendarConfiguration -Identity smwflip1@salesianer.com -WorkingHoursTimeZone "W. Europe Standard Time"
Get-MailboxCalendarConfiguration -Identity EN_BZ_Gross@salesianer.com
