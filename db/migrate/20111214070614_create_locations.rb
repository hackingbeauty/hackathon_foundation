class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :type_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :connection_type
      t.integer :coordinate_id

      t.timestamps
    end
  end
end
