class RemoveClientIdFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :client_id, :integer
  end
end
