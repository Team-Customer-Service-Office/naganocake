class RemoveEncryptedPasswordFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :encrypted_password, :string
    remove_column :customers, :reset_password_token, :string
    remove_column :customers, :reset_password_sent_at, :datetime
    remove_column :customers, :remember_created_at, :datetime
    remove_column :customers, :reset_password_token, :index
  end
end
