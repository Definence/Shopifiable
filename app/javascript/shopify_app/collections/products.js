import { setCartCounter } from '../common/cart'

document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('cart-form')

  if (form) {
    const quantityInput = document.getElementById('quantity')
    quantityInput.defaultValue = 1

    form.addEventListener('submit', (e) => {
      e.preventDefault()
      const quantity = parseInt(quantityInput.value)
      const variantId = parseInt(document.getElementById('size').value)
      const price = document.getElementById('item_price').value
      const image = document.getElementById('item_image').value
      const title = document.getElementById('item_title').value

      const cart = JSON.parse(localStorage.getItem('cart') || '[]')
      const currentItem = cart.find((i) => i.variantId === variantId)

      if (currentItem) {
        const index = cart.indexOf(currentItem)
        cart[index] = { ...currentItem, quantity: currentItem.quantity + quantity }
      } else {
        cart.push({ quantity, variantId, image, price, title })
      }

      localStorage.setItem('cart', JSON.stringify(cart))
      const submitBtn = document.getElementById('add-to-cart')

      setCartCounter()
      submitBtn.setAttribute('disabled', true)
    })
  }
})
