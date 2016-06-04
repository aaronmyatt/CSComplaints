json.array!(@complaints) do |complaint|
  json.extract! complaint, :id
  json.url complaint_url(complaint, format: :json)
end
