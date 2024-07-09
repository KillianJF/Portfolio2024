var nav_section = document.getElementById("my_nav_section");
var open_btn = document.getElementById("open-btn");
var close_btn = document.getElementById("close-btn");



open_btn.onclick = openNav;
close_btn.onclick = closeNav;

function openNav() {
    nav_section.classList.add("active");
}

function closeNav() {
    nav_section.classList.remove("active");
}