json.array!(@payments) do |payment|
  json.extract! payment, :id, :order_id, :amount, :method, :user_id
  json.url payment_url(payment, format: :json)
end
