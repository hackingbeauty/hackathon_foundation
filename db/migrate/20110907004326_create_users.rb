class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :primary_key => true
      t.string :name
      t.string :authentication_id
      t.string :info
      t.string :encrypted_password
      t.string :salt
      t.timestamps
    end
    add_index :users, [:email,:authentication_id]
  end
end