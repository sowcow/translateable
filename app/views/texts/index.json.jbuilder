json.array!(@texts) do |text|
  json.extract! text, :title, :body, :ancestry
  json.url text_url(text, format: :json)
end
