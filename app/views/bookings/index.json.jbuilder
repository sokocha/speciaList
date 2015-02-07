json.array!(@bookings) do |booking|
  json.extract! booking, :id, :listing_id, :offer_id, :status
  json.url booking_url(booking, format: :json)
end
