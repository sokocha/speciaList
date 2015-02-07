class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.integer :wage
      t.boolean :certified
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
