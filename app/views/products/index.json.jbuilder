json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :user_id, :discountable, :active
  json.url product_url(product, format: :json)
end
