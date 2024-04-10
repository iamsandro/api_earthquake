class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :external_id
      t.string :type
      t.integer :mag_type, null: false
      t.decimal :magnitude, null: false
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false
      t.string :title, null: false
      t.boolean :tsunami
      t.string :time
      t.string :place, null: false
      t.string :external_url, null: false


      t.timestamps
    end
  end
end
