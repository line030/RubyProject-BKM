class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :forename, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :enabled, :boolean, :default => 1
    add_column :users, :address_id, :integer
  end
end
