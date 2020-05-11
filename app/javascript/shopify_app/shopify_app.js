document.addEventListener('DOMContentLoaded', () => {
  var bridgeNode = document.getElementById('shopify-app-init')

  if (bridgeNode) {
    const data = bridgeNode.dataset
    var AppBridge = window['app-bridge']
    var createApp = AppBridge.default
    window.app = createApp({
      apiKey: data.apiKey,
      shopOrigin: data.shopOrigin,
    })

    var actions = AppBridge.actions
    var TitleBar = actions.TitleBar
    TitleBar.create(app, {
      title: data.page,
    })
  }
})
