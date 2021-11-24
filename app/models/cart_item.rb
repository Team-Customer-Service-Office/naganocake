class CartItem < ApplicationRecord
    
    has_many :item, dependent: :destroy
    belongs_to :customer_id
    
end
