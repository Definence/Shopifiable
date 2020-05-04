document.addEventListener('turbolinks:load', () => {
  const cartContainer = document.getElementById('cart-items')

  if (cartContainer) {
    const cartItems = JSON.parse(localStorage.getItem('cart') || '[]')
    cartItems.forEach((cartItem) => {
      const tr = document.createElement('tr')
      const tdImg = document.createElement('td')
      const tdTitle = document.createElement('td')
      const tdQuantity = document.createElement('td')
      const tdPrice = document.createElement('td')
      const { image, quantity, price, title } = cartItem
      const rowCalls = [tdImg, tdTitle, tdQuantity, tdPrice]

      cartContainer.appendChild(tr)
      rowCalls.forEach(e => tr.appendChild(e))
      tdImg.innerHTML = `<span><img class='cart-item-image' src=${image} /><span>`
      tdTitle.innerHTML = `<span>${title}<span>`
      tdQuantity.innerHTML = quantity
      tdPrice.innerHTML = `$${price * quantity}`
    })
  }
})
