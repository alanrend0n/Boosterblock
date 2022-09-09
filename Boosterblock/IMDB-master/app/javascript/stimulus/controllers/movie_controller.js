import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
  }

  searchByTitle(e) {
    fetch(`/posts.json?type=title&query=${e.target.value}`)
      .then(response => response.json())
      .then(data => {
        document.querySelectorAll(".movie-card").forEach(e => e.style.display = 'none')
        data.forEach(i => {
          document.querySelector(`.movie-card[data-movie-id='${i}']`).style.display = 'block'
        })
      })
  }

  searchByGenre(e) {
    fetch(`/posts.json?type=genre&query=${e.target.innerText}`)
      .then(response => response.json())
      .then(data => {
        document.querySelectorAll(".movie-card").forEach(e => e.style.display = 'none')
        data.forEach(i => {
          document.querySelector(`.movie-card[data-movie-id='${i}']`).style.display = 'block'
        })
      })
  }

  displayDetails(e) {
    const currentCard = e.currentTarget.querySelector('.movie-card-details')
    const detailsContainer = document.querySelector('.movie-details-container')
    detailsContainer.classList.remove('hidden')
    const displayedCard = detailsContainer.querySelector('.movie-card-details')
    if (displayedCard) {
      displayedCard.remove()
    }
    detailsContainer.insertAdjacentHTML('beforeend', currentCard.outerHTML)
    const movieImage = detailsContainer.querySelector('.movie-background-image')
    const cardImage = currentCard.parentElement.querySelector('.movie-thumbnail')
    movieImage.style.backgroundImage = `url('${cardImage.src}')`
  }

}
