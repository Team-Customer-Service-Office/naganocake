class Order < ApplicationRecord
    
    
    belongs_to :customer
    has_many :order_detail
    
    enum payment_method: { credit_card: 0, transfer: 1 }
      
    enum order_status: { wait:0, confirm:1, production:2, preparation:3, shipped:4 }
      
  
    def postcode_address
        '〒' + postcode + ' ' + address
    end
    
end
