class ChangeNotnullToCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :postcode, false
    change_column_null :customers, :address, false
    change_column_null :customers, :phone_number, false
    change_column_null :customers, :is_deleted, false
  end
  
  def down
    change_column_null :customers, :last_name, true
    change_column_null :customers, :first_name, true
    change_column_null :customers, :last_name_kana, true
    change_column_null :customers, :first_name_kana, true
    change_column_null :customers, :postcode, true
    change_column_null :customers, :address, true
    change_column_null :customers, :phone_number, true
    change_column_null :customers, :is_deleted, true
  end
end
