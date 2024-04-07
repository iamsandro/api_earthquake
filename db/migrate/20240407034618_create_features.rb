class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :external_id
      t.string :type
      t.integer :mag_type
      t.decimal :magnitude
      t.decimal :longitude
      t.decimal :latitude
      t.string :title
      t.string :string
      t.boolean :tsunami
      t.string :time
      t.string :place
      t.string :external_url


      t.timestamps
    end
  end
end
