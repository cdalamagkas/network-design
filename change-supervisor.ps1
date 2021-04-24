$obj = Get-ChildItem lab*
$i=0
#$newname = Read-Host -Prompt 'Input new author name in Greek: '

$newname = 'Χρήστος Δαλαμάγκας'

$obj | ForEach-Object {
    $folder=$_.Name
	(Get-Content .\$folder\$folder.tex) -replace "(\\SetAuthor\{).*(\})$", "\SetAuthor{$newname}" | Set-Content .\$folder\$folder.tex

}

pause