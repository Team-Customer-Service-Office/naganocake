class Address < ApplicationRecord
  
    # belongs_to :customer_id
    belongs_to :customer

    validates :postcode, presence: true, length: {maximum: 7}
    validates :address, presence: true
    validates :full_name, presence: true


    def full_address
        '〒' + postcode + ' ' + address + ' ' + full_name
    end

end
