// Fetch from local JSON file
const DATA_URL = 'data.json';

function slugify(title) {
  return title
    .toLowerCase()
    // Replace French ligatures and accented characters
    .replace(/œ/g, 'oe')
    .replace(/æ/g, 'ae')
    .replace(/ø/g, 'o')
    .replace(/[àáâãäåā]/g, 'a')
    .replace(/[çćč]/g, 'c')
    .replace(/[èéêëēėę]/g, 'e')
    .replace(/[îïíīįì]/g, 'i')
    .replace(/[ñń]/g, 'n')
    .replace(/[ôöòóœøōõ]/g, 'o')
    .replace(/[ßśš]/g, 's')
    .replace(/[ûüùúū]/g, 'u')
    .replace(/[ÿ]/g, 'y')
    .replace(/[žźż]/g, 'z')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '')
    .replace(/-+/g, '-');
}

function renderProjects(projects) {
  const grid = document.querySelector('.grid');
  if (!grid) return;
  grid.innerHTML = '';
  projects.forEach(record => {
    const fields = record.fields || record;
    const title = fields['title'] || '';
    const type = fields['type'] || '';
    const description = fields['description'] || '';
    const ytbUrl = fields['ytb-url'] || '';
    let gifUrl = '';
    if (fields['gif'] && Array.isArray(fields['gif']) && fields['gif'][0] && fields['gif'][0].url) {
      gifUrl = fields['gif'][0].url;
    }
    const projectPage = `projects/${slugify(title)}.html`;
    grid.innerHTML += `
      <a href="${projectPage}" class="relative group aspect-w-16 aspect-h-9 bg-blue-600 overflow-hidden cursor-pointer h-full block">
        ${gifUrl ? `<img src="${gifUrl}" alt="${title}" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-105" />` : ''}
        <div class="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-90 opacity-0 group-hover:opacity-100 transition-opacity duration-700 text-center p-4">
          <span class="text-white text-xl font-normal mb-2 font-absans">${title}</span>
          <span class="text-white text-sm uppercase tracking-widest mb-2 font-absans opacity-50">${type}</span>
        </div>
      </a>
    `;
  });
}

function fetchProjects() {
  fetch(DATA_URL)
    .then(response => response.json())
    .then(data => {
      renderProjects(data.records);
    })
    .catch(error => {
      console.error('Error fetching projects:', error);
    });
}

document.addEventListener('DOMContentLoaded', fetchProjects); 