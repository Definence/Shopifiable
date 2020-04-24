const hidePromoBar = () => {
  const promoBar = document.getElementById('promo-bar')
  promoBar.style.cssText = 'display: none;'
}

document.addEventListener('DOMContentLoaded', () => {
  const isPromoClosed = localStorage.getItem('isPromoClosed')
  const closeButton = document.getElementById('close-promo')

  if (isPromoClosed) hidePromoBar()

  closeButton.addEventListener('click', () => {
    localStorage.setItem('isPromoClosed', true)
    hidePromoBar()
  })
})
