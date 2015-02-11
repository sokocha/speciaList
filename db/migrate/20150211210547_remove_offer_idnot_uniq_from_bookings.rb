class RemoveOfferIdnotUniqFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :offer_id, :integer
  end
end
