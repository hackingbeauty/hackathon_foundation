class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
