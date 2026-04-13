

$mailboxes = (get-mailbox -resultsize unlimited).UserPrincipalName

foreach ($mailbox in $mailboxes)
{
Get-InboxRule -Mailbox $mailbox | Select-Object MailboxOwnerID,Name,Description,Enabled,RedirectTo, MoveToFolder,ForwardTo | Export-CSV C:\temp\OutlookRules.csv -NoTypeInformation -Append
}