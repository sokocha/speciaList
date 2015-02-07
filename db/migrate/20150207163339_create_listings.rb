class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :budget
      t.text :description
      t.string :image
      t.string :status, :default => "uncontracted"
      t.integer :client_id
      t.integer :category_id

      t.timestamps
    end
  end
end
