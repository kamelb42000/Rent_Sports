//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../builds
var logo = document.querySelector('.Sourcelogo');
var menu = document.querySelector('.menu');

logo.addEventListener('click', function(){
    menu.classList.toggle('showmenu')
});
