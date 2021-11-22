class AddEncryptedPasswordToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :reset_password_token, :string
  end
end
