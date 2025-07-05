// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu functionality
    const burgerMenu = document.getElementById('burger-menu');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMenu = document.getElementById('close-menu');
    const burgerLines = burgerMenu.querySelectorAll('span');

    // Toggle mobile menu
    function toggleMobileMenu() {
        const isOpen = mobileMenu.classList.contains('translate-x-0');
        
        if (isOpen) {
            // Close menu
            mobileMenu.classList.remove('translate-x-0');
            mobileMenu.classList.add('translate-x-full');
            document.body.style.overflow = 'auto';
            
            // Hide close button
            closeMenu.classList.add('opacity-0', 'pointer-events-none');
            
            // Reset burger animation
            burgerLines[0].classList.remove('rotate-45', 'translate-y-1.5');
            burgerLines[1].classList.remove('opacity-0');
            burgerLines[2].classList.remove('-rotate-45', '-translate-y-1.5');
        } else {
            // Open menu
            mobileMenu.classList.remove('translate-x-full');
            mobileMenu.classList.add('translate-x-0');
            document.body.style.overflow = 'hidden';
            
            // Show close button
            closeMenu.classList.remove('opacity-0', 'pointer-events-none');
            
            // Animate burger to X
            burgerLines[0].classList.add('rotate-45', 'translate-y-1.5');
            burgerLines[1].classList.add('opacity-0');
            burgerLines[2].classList.add('-rotate-45', '-translate-y-1.5');
        }
    }

    // Event listeners for mobile menu
    burgerMenu.addEventListener('click', toggleMobileMenu);
    closeMenu.addEventListener('click', toggleMobileMenu);

    // Close menu when clicking on menu items
    const mobileMenuItems = mobileMenu.querySelectorAll('a');
    mobileMenuItems.forEach(item => {
        item.addEventListener('click', () => {
            toggleMobileMenu();
        });
    });

    // Close menu when clicking outside
    mobileMenu.addEventListener('click', (e) => {
        if (e.target === mobileMenu) {
            toggleMobileMenu();
        }
    });

    // Close menu on window resize (if screen becomes larger)
    window.addEventListener('resize', () => {
        if (window.innerWidth >= 768 && mobileMenu.classList.contains('translate-x-0')) {
            toggleMobileMenu();
        }
    });

    // Add fade-in animation to elements
    const fadeElements = document.querySelectorAll('.animate-fade-in');
    fadeElements.forEach(element => {
        element.style.opacity = '0';
        setTimeout(() => {
            element.style.opacity = '1';
        }, 100);
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Add hover scale effect to portfolio items
    const portfolioItems = document.querySelectorAll('.portfolio-item');
    portfolioItems.forEach(item => {
        item.classList.add('hover-scale');
    });
}); 