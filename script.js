function changeTitleColor() {
  let title = document.querySelector('h1');
  title.style.color = 'blue';
}

document.querySelector('button').addEventListener('click', changeTitleColor);
