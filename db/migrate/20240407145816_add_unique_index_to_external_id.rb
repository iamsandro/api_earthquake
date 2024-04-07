class AddUniqueIndexToExternalId < ActiveRecord::Migration[7.0]
  def change
    add_index :features, :external_id, unique: true
  end
end
