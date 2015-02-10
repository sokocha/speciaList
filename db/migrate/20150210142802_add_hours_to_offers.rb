class AddHoursToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :hours, :float
  end
end
