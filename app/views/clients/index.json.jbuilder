json.array!(@clients) do |client|
  json.extract! client, 
  json.url client_url(client, format: :json)
end
