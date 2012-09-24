class AddPasswordResetSentAtToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :auth_token
    add_column :users, :password_reset_sent_at, :datetime
  end
end
