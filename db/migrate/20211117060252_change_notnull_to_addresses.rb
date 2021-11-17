class ChangeNotnullToAddresses < ActiveRecord::Migration[5.2]
  def up
    change_column_null :addresses, :customer_id, false
    change_column_null :addresses, :postcode, false
    change_column_null :addresses, :address, false
    change_column_null :addresses, :full_name, false
  end

  def down
    change_column_null :addresses, :customer_id, true
    change_column_null :addresses, :postcode, true
    change_column_null :addresses, :address, true
    change_column_null :addresses, :full_name, true
  end
end
