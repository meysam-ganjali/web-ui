var plus = document.getElementById('plus');

 function plusToggle() {
    plus.classList.toggle('plus--active');
}

plus.addEventListener('click', plusToggle);