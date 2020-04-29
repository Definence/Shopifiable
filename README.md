# Important

# Ruby version - 2.6.3

# System dependencies
```
no dependencies
```

# Configuration
### Required keys:
```
shopify_api_key
shopify_api_secret
```

# Database creation
```ruby
rails db:create db:migrate
```

# How to run the test suite
```
no test avaialble
```

# Deployment instructions
```
fill me
```

### To activate shop session
```ruby
session = ShopifyAPI::Session.new(domain: 'shopifiable-app.myshopify.com', token: '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', api_version: "2020-04")
ShopifyAPI::Base.activate_session(session)
include ShopifyAPI
shop = ShopifyAPI::Shop.current
```
### To debug RestClient requests
```ruby
RestClient.log = 'stdout'
```
