module Cart
  def add_cart(params)
    request("#{base_url}/cart/add", :post, params)
  end
end
