class Item < ApplicationRecord
  
  belongs_to :category
  has_many :cart_item
  
  
  
  enum is_active: { stop: false, sale: true }
  
  attachment :image
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :price_without_tax, presence: true
  
  
 def with_tax_price
    (price_without_tax * 1.08).floor
 end
  
  
  
end
