# Scriptlet war für OnPrem Server verfügbar. Ist mittlerweile Obsolet
Get-Mailbox -ResultSize Unlimited | Where-Object {$_.emailaddresses -like "*umlauft.at*"}