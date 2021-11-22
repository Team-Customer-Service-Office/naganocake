class Address < ApplicationRecord
    
    belongs_to :customer_id
    
    validates :postcode, presence: true, length: {maximum: 7}
    validates :address, presence: true
    validates :full_name, presence: true
    
    
    def full_address
        '〒' + postcode + ' ' + address + ' ' + name
    end
    
end
