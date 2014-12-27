json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :membership, :user_id
  json.url customer_url(customer, format: :json)
end
