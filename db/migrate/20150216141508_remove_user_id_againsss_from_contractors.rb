class RemoveUserIdAgainsssFromContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :user_id, :integer
  end
end
