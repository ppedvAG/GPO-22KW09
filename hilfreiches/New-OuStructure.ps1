[cmdletBinding()]
param(

[Parameter(Mandatory=$true)]
[string[]]$Namen
)

foreach ($Name in $Namen)
{
New-ADOrganizationalUnit -Name:"$Name" -Path:"OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=$Name,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
New-ADOrganizationalUnit -Name:"Computer" -Path:"OU=$Name,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=Computer,OU=$Name,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
New-ADOrganizationalUnit -Name:"Benutzer" -Path:"OU=$Name,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=Benutzer,OU=$Name,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
New-ADGroup -GroupCategory:"Security" -GroupScope:"Global" -Name:"GL-$Name" -Path:"OU=$Name,OU=Struktur,DC=ppedv,DC=test" -SamAccountName:"GL-$Name" -Server:"Server1.ppedv.test"
}