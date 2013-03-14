class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :ordr_account_id, :card_nickname, :card_last_four, :email, :password, :password_confirmation, :remember_me, :invitation_token, :address_attributes

  has_and_belongs_to_many :groups
  has_many :invitations #:class_name => self.to_s, :as => :invited_by
  has_one :ordr_account
  belongs_to :address
  accepts_nested_attributes_for :address

  def billing_address
    Ordrin::Data::Address.new(self.address.addr, self.address.addr2, self.address.city, self.address.state, self.address.zip, self.address.phone)
  end

  def ordr_login
    return Ordrin::Data::UserLogin.new(email, encrypted_password)
  end

  def credit_card(name, expiry_month, expiry_year, bill_address, number, cvc)
    Ordrin::Data::CreditCard.new(name, expiry_month, expiry_year, bill_address, number, cvc)
  end


  def update_ordr_account()
    if self.ordr_account_id == nil || self.ordr_account_id == ''
      api_response = $ordrin.user.create(ordr_login, first, last)
    else
      api_response = $ordrin.user.update(ordr_login, first, last)
    end
    puts api_response
    if api_response['msg'] == 'user saved'
      self.ordr_account_id = api_response['user_id']
    end
  end


  def update_ordr_cc(cc)
    ordr_cc = credit_card(cc['name'], cc['expiry'][0], cc['expiry'][1], billing_address, cc['number'], cc['cvc'])
    last4 = cc['number'].slice(-4,4)
    begin
      api_response = $ordrin.user.set_credit_card(ordr_login, last4, ordr_cc)
      if api_response['msg'].downcase == 'credit card saved'
        self.card_nickname = last4
      end
    rescue
      self.card_nickname = ''
    end
  end

end
