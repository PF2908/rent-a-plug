const soundOnGrid = () => {
 const audio = new Audio('https://www.soundjay.com/buttons/sounds/beep-027.mp3')
const grid = document.querySelector('.text-decoration-none')
console.log(grid)
grid.addEventListener('click', (e) => {
  console.log(e)
  audio.play()
})
}

export {soundOnGrid}
