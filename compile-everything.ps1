$obj = Get-ChildItem lab*
$i=0
md -Force FINAL | Out-Null

$obj | ForEach-Object {
    $folder=$_.Name
    Write-Progress -Activity "Compiling source .tex files and moving pdfs" -Status "current file: $folder" -PercentComplete ($i/$obj.Length*100)
    & "xelatex" -synctex=1 -quiet -interaction=nonstopmode -shell-escape -output-directory="$folder" ./"$folder/$folder"
    $i++
    Copy-Item ./"$folder/$folder".pdf .\FINAL\
    Write-Progress -Activity "Compiling source .tex files and moving pdfs" -Status "current file: $folder" -PercentComplete ($i/$obj.Length*100)
}