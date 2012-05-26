class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zip
      t.integer :country_id

      t.timestamps
    end
  end
end
