json.array!(@discount_infos) do |discount_info|
  json.extract! discount_info, :id, :amount, :discount, :active
  json.url discount_info_url(discount_info, format: :json)
end
