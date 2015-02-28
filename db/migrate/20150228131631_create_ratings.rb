class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :professionalism_rating
      t.integer :quality_rating

      t.timestamps
    end
  end
end
