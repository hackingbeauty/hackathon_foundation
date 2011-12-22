class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :coordinate_id
      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :coordinate_id
    add_index :visits, [:user_id, :coordinate_id], :unique => true
    
  end
end
