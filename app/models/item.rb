class Item < ApplicationRecord
  
  belongs_to :category
  enum is_active: { stop: false, sale: true }
  
  attachment :image
  
  validates :name, {presence: true}
  validates :description, {presence: true}
  validates :price_without_tax, {presence: true}
  
end
