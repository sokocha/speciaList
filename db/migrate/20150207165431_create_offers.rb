class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :status
      t.integer :listing_id
      t.integer :user_id

      t.timestamps
    end
  end
end
