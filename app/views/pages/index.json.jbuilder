json.array!(@pages) do |page|
  json.extract! page, :id, :name, :order
  json.url page_url(page, format: :json)
end
