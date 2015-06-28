json.array!(@features) do |feature|
  json.extract! feature, :id, :name, :order
  json.url feature_url(feature, format: :json)
end
