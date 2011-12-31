class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :primary_key => true
      t.string :name
      t.string :facebook_id
      t.string :info
      t.timestamps
    end
    add_index :users, [:email,:facebook_id]
  end
end
