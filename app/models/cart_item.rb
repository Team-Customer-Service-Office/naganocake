class CartItem < ApplicationRecord
    
    has_many :item, dependent: :destroy
    
    
end
