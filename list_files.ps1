$files = Get-ChildItem -Path $PWD -Recurse -File | Where-Object { 
    $_.FullName -notmatch "node_modules" -and 
    $_.FullName -notmatch "\\.git" -and 
    $_.FullName -notmatch "\\.output" -and 
    $_.FullName -notmatch "dist" -and
    $_.FullName -notmatch "the-insight" -and
    $_.FullName -notmatch "my-website" -and
    $_.FullName -notmatch "suncity" -and
    $_.FullName -notmatch "curatedgems" -and
    $_.Name -ne "repo.zip" -and
    $_.Name -ne "download_repo.ps1" -and
    $_.Name -ne "create_repo.ps1" -and
    $_.Name -ne "list_files.ps1" -and
    $_.Name -ne "create_project.ps1" -and
    $_.Name -ne "run_migration.ps1"
}
$files | ForEach-Object { 
    $relative = $_.FullName.Substring($PWD.Length + 1)
    [PSCustomObject]@{
        Path = $relative
        FullPath = $_.FullName
    }
} | ConvertTo-Json
