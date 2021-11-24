class Order < ApplicationRecord
    
    
    belongs_to :costomer
    has_many :order_detail

    
    validates :postcode, presence: true, length: {maximum: 7}
    validates :address, presence: true
    validates :full_name, presence: true
    validates :payment_method, presence: true
    
    enum payment_method: { credit_card: 0, transfer: 1 }
      
    enum order_status: { wait:0, confirm:1, production:2, preparation:3, shipped:4 }
      
  
    def postcode_address
        '〒' + postcode + ' ' + address
    end
    
end
