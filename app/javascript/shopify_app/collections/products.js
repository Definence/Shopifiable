// import { setCartCounter } from '../common/cart'

document.addEventListener('turbolinks:load', () => {
  const form = document.getElementById('cart-form')

  if (form) {
    const selectNode = document.getElementById('line_item_variant_id')
    const options = document.querySelectorAll('.variants-option')
    const priceNode = document.getElementById('price')
    const defaultOption = document.querySelector('.variants-option')
    const currency = defaultOption.getAttribute('currency')
    let price = defaultOption.getAttribute('price')

    priceNode.innerHTML = `${currency} ${price}`

    selectNode.addEventListener('change', (e) => {
      const selectedOpt = document.querySelector(`[value="${e.target.value}"]`)
      price = selectedOpt.getAttribute('price')
      priceNode.innerHTML = `${currency} ${price}`
    })

  //   const quantityInput = document.getElementById('quantity')
  //   quantityInput.defaultValue = 1

  //   form.addEventListener('submit', (e) => { // TODO remove localstorage
  //     e.preventDefault()
  //     const quantity = parseInt(quantityInput.value)
  //     const variantId = parseInt(document.getElementById('size').value)
  //     const price = document.getElementById('item_price').value
  //     const image = document.getElementById('item_image').value
  //     const title = document.getElementById('item_title').value

  //     // const cart = JSON.parse(localStorage.getItem('cart') || '[]')
  //     // const currentItem = cart.find((i) => i.variantId === variantId)

  //     // if (currentItem) {
  //     //   const index = cart.indexOf(currentItem)
  //     //   cart[index] = { ...currentItem, quantity: currentItem.quantity + quantity }
  //     // } else {
  //     //   cart.push({ quantity, variantId, image, price, title })
  //     // }

  //     // localStorage.setItem('cart', JSON.stringify(cart))
  //     // setCartCounter()
  //   })
  }
})
