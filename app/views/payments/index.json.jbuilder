json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :references, :references, :provider
  json.url payment_url(payment, format: :json)
end
