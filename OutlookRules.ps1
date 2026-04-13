<#
Author: Manamius
Description: Grab a list of Inbox Rules associated with users in a 365 tenant. Will need to connect to Exchange Online to run
#>

$mailboxes = (get-mailbox -resultsize unlimited).UserPrincipalName

foreach ($mailbox in $mailboxes)
{
Get-InboxRule -Mailbox $mailbox | Select-Object MailboxOwnerID,Name,Description,Enabled,RedirectTo, MoveToFolder,ForwardTo | Export-CSV C:\temp\OutlookRules.csv -NoTypeInformation -Append
}
