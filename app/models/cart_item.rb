class CartItem < ApplicationRecord
    
    has_many :items, dependetn: :deestroy
    
    
end
