# PowerShell script to add email to all project pages

$projectFiles = @(
    "projects/coeo-design-kamado-4.html",
    "projects/couleur-rugby-world-cup-au-coeur-des-supporters.html",
    "projects/dji-alex-jackson-video-youtube-sponsorisee-dji-mini-3.html",
    "projects/food-drinks-photoshoot.html",
    "projects/hermes-concours-visual-merchandiser.html",
    "projects/photoset-siargao.html",
    "projects/shorts-social-media-edit.html",
    "projects/trail-adventure-motos-dans-les-bardenas.html",
    "projects/amity-teaser-drop-tee-shirt.html"
)

$oldFooter1 = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p>&copy; 2025 Killian JF. Tous droits réservés.</p>
    </div>
  </footer>
</body>
</html>
'@

$newFooter1 = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p class="mb-2">killian.jaffrelot@gmail.com</p>
      <p>&copy; 2025 Killian JF. Tous droits réservés.</p>
    </div>
  </footer>
</body>
</html>
'@

$oldFooter2 = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p>&copy; 2024 Killian. All rights reserved.</p>
    </div>
  </footer>
</body>
</html>
'@

$newFooter2 = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p class="mb-2">killian.jaffrelot@gmail.com</p>
      <p>&copy; 2024 Killian. All rights reserved.</p>
    </div>
  </footer>
</body>
</html>
'@

foreach ($file in $projectFiles) {
    if (Test-Path $file) {
        Write-Host "Updating $file..."
        $content = Get-Content $file -Raw
        $content = $content -replace [regex]::Escape($oldFooter1), $newFooter1
        $content = $content -replace [regex]::Escape($oldFooter2), $newFooter2
        Set-Content $file $content -Encoding UTF8
        Write-Host "Updated $file successfully!"
    } else {
        Write-Host "File $file not found!"
    }
}

Write-Host "All project pages updated with email!" 