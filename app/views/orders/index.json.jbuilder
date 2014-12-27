json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :user_id, :total_price
  json.url order_url(order, format: :json)
end
