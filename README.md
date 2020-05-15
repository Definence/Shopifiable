## Live DEMO can be found [here](https://shopifiable-public.herokuapp.com/)

## Ruby version
`2.6.3`

## System dependencies
`no system dependencies required`

## Configuration

#### Copy `master.key` into `config/master.key` from [here](https://docs.google.com/document/d/1qD1ejg1F_cTQwi9fshLuP9G9PHqF2wu0b7ycCxEdfB0/edit)

#### Required keys:
```
shopify_api_key
shopify_api_secret
```

## Database creation
```ruby
rails db:create db:migrate
```

<!-- # How to run the test suite
```
no test avaialble
``` -->

## Deployment instructions

Master branch gets automaticaly deployed after each push.
Hovever you can deploy it manually by adding remote and push it to heroku

```
git remote add heroku https://git.heroku.com/shopifiable.git
git push heroku master
heroku open
```

#### To debug RestClient requests
```ruby
RestClient.log = 'stdout'
```

#### GraphQl dump
```
rake shopify_api:graphql:dump ACCESS_TOKEN=shpat_****** SHOP_DOMAIN=shopifiable-app API_VERSION=2020-04
```
