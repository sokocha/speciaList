class AddUserIdUniqesToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :user_id, :integer
    add_index :contractors, :user_id, unique: true
  end
end
