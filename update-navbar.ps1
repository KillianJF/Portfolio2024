# PowerShell script to update all project pages with responsive navbar

$projectFiles = @(
    "projects/clubmed-seminaire-djerba-2024.html",
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

$oldNavbar = @'
  <!-- Navigation -->
  <nav class="bg-black text-white px-6 md:px-12 lg:px-24 py-[5rem]">
    <div class="max-w-7xl mx-auto flex justify-between items-center relative">
      <!-- Left Menu -->
      <div class="flex space-x-6 md:space-x-12">
        <a href="../index.html" class="font-normal tracking-widest font-absans text-white no-underline">FILMS</a>
        <a href="../about.html" class="font-normal tracking-widest font-absans text-white opacity-50 hover:opacity-100 transition no-underline">WHO I AM</a>
      </div>
      <!-- Center Logo -->
      <div class="absolute left-1/2 transform -translate-x-1/2 flex flex-col items-center">
        <img src="../images/Icons/Killian JF logo.png" alt="Killian JF" class="h-12 md:h-16">
        <span class="text-white text-xs md:text-sm tracking-widest mt-4">Filmmaker • Tourism // Sport // Hôtel // Events</span>
      </div>
      <!-- Right Menu -->
      <div>
        <!-- <a href="#" class="text-white opacity-60 hover:opacity-100 transition" aria-label="Instagram">
          <img src="../images/Icons/mdi_instagram.png" alt="Instagram" class="w-6 h-6">
        </a> -->
      </div>
    </div>
  </nav>
'@

$newNavbar = @'
  <!-- Navigation -->
  <nav class="bg-black text-white px-6 md:px-12 lg:px-24 py-8 md:py-[5rem]">
    <div class="max-w-7xl mx-auto flex justify-between items-center relative">
      <!-- Left Menu - Hidden on mobile -->
      <div class="hidden md:flex space-x-6 md:space-x-12">
        <a href="../index.html" class="font-normal tracking-widest font-absans text-white no-underline">FILMS</a>
        <a href="../about.html" class="font-normal tracking-widest font-absans text-white opacity-50 hover:opacity-100 transition no-underline">WHO I AM</a>
      </div>

      <!-- Center Logo -->
      <div class="flex flex-col items-center w-full md:w-auto md:absolute md:left-1/2 md:transform md:-translate-x-1/2">
        <img src="../images/Icons/Killian JF logo.png" alt="Killian JF" class="h-10 md:h-12 lg:h-16">
        <span class="text-white text-xs md:text-sm lg:text-base tracking-widest mt-2 md:mt-4 font-normal text-center">Filmmaker • Tourism // Sport // Hôtel // Events</span>
      </div>

      <!-- Burger Menu Button - Visible on mobile -->
      <button id="burger-menu" class="md:hidden flex flex-col space-y-1 p-2" aria-label="Toggle menu">
        <span class="w-6 h-0.5 bg-white transition-all duration-300"></span>
        <span class="w-6 h-0.5 bg-white transition-all duration-300"></span>
        <span class="w-6 h-0.5 bg-white transition-all duration-300"></span>
      </button>

      <!-- Right Menu - Hidden on mobile -->
      <div class="hidden md:block">
        <!-- <a href="#" class="text-white opacity-60 hover:opacity-100 transition" aria-label="Instagram">
          <img src="../images/Icons/mdi_instagram.png" alt="Instagram" class="w-6 h-6">
        </a> -->
      </div>
    </div>

    <!-- Close Button - Fixed position outside overlay -->
    <button id="close-menu" class="md:hidden fixed top-8 right-8 text-white text-2xl z-50 opacity-0 pointer-events-none transition-opacity duration-300" aria-label="Close menu">
      <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
    </button>

    <!-- Mobile Menu Overlay -->
    <div id="mobile-menu" class="md:hidden fixed inset-0 bg-black bg-opacity-95 z-40 transform translate-x-full transition-transform duration-300 ease-in-out">
      <div class="flex flex-col items-center justify-between h-full">
        <!-- Mobile Menu Items - Centered -->
        <div class="flex flex-col items-center space-y-8 mt-32">
          <a href="../index.html" class="font-normal tracking-widest font-absans text-white text-2xl no-underline hover:opacity-75 transition">FILMS</a>
          <a href="../about.html" class="font-normal tracking-widest font-absans text-white text-2xl opacity-75 hover:opacity-100 transition no-underline">WHO I AM</a>
        </div>
        
        <!-- Mobile Logo - Bottom -->
        <div class="flex flex-col items-center mb-8">
          <img src="../images/Icons/Killian JF logo.png" alt="Killian JF" class="h-10 mb-2">
          <span class="text-white text-xs tracking-widest font-normal text-center">Filmmaker • Tourism // Sport // Hôtel // Events</span>
        </div>
      </div>
    </div>
  </nav>
'@

$oldFooter = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p>&copy; 2025 Killian JF. Tous droits réservés.</p>
    </div>
  </footer>
</body>
</html>
'@

$newFooter = @'
  <!-- Footer -->
  <footer class="bg-black text-white py-8 mt-8">
    <div class="container mx-auto px-4 text-center">
      <p>&copy; 2025 Killian JF. Tous droits réservés.</p>
    </div>
  </footer>

  <!-- Custom JavaScript -->
  <script src="../js/main.js"></script>
</body>
</html>
'@

foreach ($file in $projectFiles) {
    if (Test-Path $file) {
        Write-Host "Updating $file..."
        $content = Get-Content $file -Raw
        $content = $content -replace [regex]::Escape($oldNavbar), $newNavbar
        $content = $content -replace [regex]::Escape($oldFooter), $newFooter
        Set-Content $file $content -Encoding UTF8
        Write-Host "Updated $file successfully!"
    } else {
        Write-Host "File $file not found!"
    }
}

Write-Host "All project pages updated with responsive navbar!" 