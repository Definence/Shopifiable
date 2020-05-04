import { setCartCounter } from '../common/cart'

document.addEventListener('turbolinks:load', () => {
  setCartCounter()
})
