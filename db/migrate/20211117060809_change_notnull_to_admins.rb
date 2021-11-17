class ChangeNotnullToAdmins < ActiveRecord::Migration[5.2]
  def up
    change_column_null :admins, :email, false
    change_column_null :admins, :password, false
  end

  def down
    change_column_null :admins, :email, true
    change_column_null :admins, :password, true
  end
end
