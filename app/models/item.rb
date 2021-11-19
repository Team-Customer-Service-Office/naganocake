class Item < ApplicationRecord
  
  belongs_to :category
  enum is_active: { stop: 0, sale: 1 }
end
