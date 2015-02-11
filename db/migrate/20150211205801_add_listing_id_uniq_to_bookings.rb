class AddListingIdUniqToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :listing_id, :integer
    add_index :bookings, :listing_id, unique: true
  end
end
