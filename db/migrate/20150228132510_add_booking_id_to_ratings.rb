class AddBookingIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :booking_id, :integer
  end
end
