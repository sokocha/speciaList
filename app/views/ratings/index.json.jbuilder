json.array!(@ratings) do |rating|
  json.extract! rating, :id, :professionalism_rating, :quality_rating
  json.url rating_url(rating, format: :json)
end
