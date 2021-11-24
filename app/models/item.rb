class Item < ApplicationRecord
  
  belongs_to :category
  belongs_to :cart_item
  
  enum is_active: { stop: false, sale: true }
  
  attachment :image
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :price_without_tax, presence: true
  
end
