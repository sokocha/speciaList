class AddOfferIdUniqToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :offer_id, :integer
    add_index :bookings, :offer_id, unique: true
  end
end
