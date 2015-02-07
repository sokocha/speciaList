json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :budget, :description, :image, :status, :client_id, :category_id
  json.url listing_url(listing, format: :json)
end
