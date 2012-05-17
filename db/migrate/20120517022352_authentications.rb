class Authentications < ActiveRecord::Migration
    def change
        create_table :authentications do |t|
        t.string :uid, :primary_key => true
        t.string :provider
        t.timestamps
        end
        add_index :authentications, [:uid]
    end
end
