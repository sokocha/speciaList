class AddUserIdWithUniquenessToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :user_id, :integer, unique: true
  end
end
