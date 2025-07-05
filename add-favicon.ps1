# PowerShell script to add favicon to all project pages

$projectFiles = @(
    "projects/sandy-bay-beach-resort.html",
    "projects/samasana-villas-sunset-drone.html",
    "projects/shorts-social-media-edit.html",
    "projects/food-drinks-photoshoot.html",
    "projects/clubmed-seminaire-djerba-2024.html",
    "projects/coeo-design-kamado-4.html",
    "projects/hermes-concours-visual-merchandiser.html",
    "projects/trail-adventure-motos-dans-les-bardenas.html",
    "projects/amity-teaser-drop-tee-shirt.html",
    "projects/dji-alex-jackson-video-youtube-sponsorisee-dji-mini-3.html",
    "projects/couleur-rugby-world-cup-au-coeur-des-supporters.html"
)

$faviconCode = @'
    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="../images/Icons/Killian JF logo.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../images/Icons/Killian JF logo.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../images/Icons/Killian JF logo.png">
    <link rel="manifest" href="../site.webmanifest">
    <meta name="theme-color" content="#000000">
'@

foreach ($file in $projectFiles) {
    if (Test-Path $file) {
        Write-Host "Adding favicon to $file..."
        $content = Get-Content $file -Raw
        
        # Add favicon after the title tag
        $content = $content -replace '(<title>.*?</title>)', "`$1`n$faviconCode"
        
        Set-Content $file $content -Encoding UTF8
        Write-Host "Added favicon to $file successfully!"
    } else {
        Write-Host "File $file not found!"
    }
}

Write-Host "All project pages updated with favicon!" 