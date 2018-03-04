class FixColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :friendships, :accepted, :accepted_requester_id
    add_column :friendships, :accepted_requested_id, :boolean
  end
end
