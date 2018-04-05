class AddIndex < ActiveRecord::Migration[5.1]
  def change
    
  end
    add_index :friendships, [:user_id, :friend_id], unique: true
    add_index :friendships, :user_id
    add_index :friendships, :friend_id
end
