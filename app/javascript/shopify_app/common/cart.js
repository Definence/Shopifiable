export const setCartCounter = () => {
  const cartLink = document.getElementById('cart-link')
  const cartitems = localStorage.getItem('cart')

  if (cartitems) {
    const parsedItems = JSON.parse(cartitems)
    let cartItemsQuantity = 0

    parsedItems.forEach(({ quantity }) => { cartItemsQuantity = cartItemsQuantity + quantity })
    if (cartItemsQuantity > 0) cartLink.textContent = `Cart (${cartItemsQuantity})`
  }
}
