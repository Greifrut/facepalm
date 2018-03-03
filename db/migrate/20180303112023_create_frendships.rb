class CreateFrendships < ActiveRecord::Migration[5.1]
  def change
    create_table :frendships do |t|
      t.integer :requester_id
      t.integer :requested_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
