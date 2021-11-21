class Item < ApplicationRecord
  
  belongs_to :category
  enum is_active: { stop: 0, sale: 1 }
  
  attachment :image
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :price_without_tax, presence: true
  
end
