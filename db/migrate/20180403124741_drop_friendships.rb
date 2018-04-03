class DropFriendships < ActiveRecord::Migration[5.1]
  def up
    drop_table :friendships
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
