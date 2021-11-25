class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,  presence: true
  validates :first_name, presence: true
  # カタカナ制限
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  # 電話番号はハイフンなしの10桁もしくは11桁のみ登録可能とする
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '10桁か11桁の電話番号を入力してください。'}
  # 郵便番号はハイフンなしの7桁のみ登録可能とする
  validates :postcode,  presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  
  def user_address
        '〒'+postcode+' '+address+' '+first_name+last_name
  end

end
