class DeleteColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :accepted_requester_id
    rename_column :friendships, :accepted_requested_id, :accepted
  end
end
