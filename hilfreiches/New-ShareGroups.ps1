[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[string]$ShareName
)

New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:"DL-$Sharename-R" -Path:"OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -SamAccountName:"DL-$Sharename-R" -Server:"Server1.ppedv.test"
New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:"DL-$Sharename-W" -Path:"OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -SamAccountName:"DL-$Sharename-W" -Server:"Server1.ppedv.test"
New-ADGroup -GroupCategory:"Security" -GroupScope:"DomainLocal" -Name:"DL-$Sharename-F" -Path:"OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -SamAccountName:"DL-$Sharename-F" -Server:"Server1.ppedv.test"
Add-ADPrincipalGroupMembership -Identity:"CN=DL-$Sharename-W,OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -MemberOf:"CN=DL-$Sharename-R,OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -Server:"Server1.ppedv.test"
Set-ADGroup -Add:@{'Member'="CN=DL-$Sharename-F,OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test"} -Identity:"CN=DL-$Sharename-W,OU=Berechtigungsgruppen,OU=Infrastruktur,OU=Struktur,DC=ppedv,DC=test" -Server:"Server1.ppedv.test"
