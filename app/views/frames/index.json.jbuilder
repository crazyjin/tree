json.array!(@frames) do |frame|
  json.extract! frame, :id, :name, :order
  json.url frame_url(frame, format: :json)
end
