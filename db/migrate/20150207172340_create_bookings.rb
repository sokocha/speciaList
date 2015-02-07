class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :listing_id
      t.integer :offer_id
      t.string :status, :default => "active"

      t.timestamps
    end
  end
end
