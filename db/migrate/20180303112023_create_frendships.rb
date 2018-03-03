class CreateFrendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :requested_id
      t.boolean :accepted

      t.timestamps
    end
    add_index :friendships, :requested_id, name: "index_friendships_on_requested_id", using: :btree
    add_index :friendships, [:requester_id, :requested_id], name: "index_friendships_on_requester_id_and_requested_id", unique: true, using: :btree
    add_index :friendships, :requester_id, name: "index_friendships_on_requester_id", using: :btree
  end
end
