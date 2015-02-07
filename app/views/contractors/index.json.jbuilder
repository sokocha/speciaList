json.array!(@contractors) do |contractor|
  json.extract! contractor, :id, :wage, :certified, :user_id, :category_id
  json.url contractor_url(contractor, format: :json)
end
