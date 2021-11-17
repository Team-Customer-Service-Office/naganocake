class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.string :image, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_without_tax, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
