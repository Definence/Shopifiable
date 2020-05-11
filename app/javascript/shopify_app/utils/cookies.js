export default {
  set: function(key, value, days) {
    if (key) {
      let expires = ''
      if (days) {
        const date = new Date()
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000))
        expires = `expires=${date.toGMTString()};`
      }


      if (this.get(key)) this.delete(key)

      let cookie = `${key}=${value}`
      if (expires) cookie = `${cookie}; ${expires}`
      document.cookie = cookie
      return document.cookie
    }

    return false
  },
  get: function(key) {
    if (key) {
      const cookies = this.list()
      const cookie = cookies.find((c) => c.key === key)
      return cookie ? cookie.value : undefined
    }

    return false
  },
  list: function() {
    if (document.cookie === '') return []

    const cookies = document.cookie.split('; ').map((c) => {
      const [key, value] = c.split('=')
      return ({ key, value })
    })

    return cookies
  },
  delete: function(key) {
    const days = -1
    const date = new Date()

    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000))

    const expires = `expires=${date.toGMTString()}; path=/;`
    const cookie = `${key}=; ${expires}`

    document.cookie = cookie
    return document.cookie
  }
}
