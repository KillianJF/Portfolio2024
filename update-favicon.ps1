# Script to update favicon references in all project files
$projectFiles = Get-ChildItem -Path "projects" -Filter "*.html" -Recurse

foreach ($file in $projectFiles) {
    Write-Host "Updating favicon in $($file.Name)..."
    
    $content = Get-Content $file.FullName -Raw
    
    # Replace favicon references
    $content = $content -replace '<link rel="icon" type="image/svg\+xml" href="../favicon-round\.svg">', '<link rel="icon" type="image/png" href="../images/Icons/favicon.png">'
    $content = $content -replace '<link rel="icon" type="image/jpeg" href="../images/Icons/Favicon\.jpg">', ''
    $content = $content -replace '<link rel="apple-touch-icon" href="../images/Icons/Favicon\.jpg">', '<link rel="apple-touch-icon" href="../images/Icons/favicon.png">'
    
    # Write back to file
    Set-Content $file.FullName $content -NoNewline
}

Write-Host "Favicon update completed for all project files!" 