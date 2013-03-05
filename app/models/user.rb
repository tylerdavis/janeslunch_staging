class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :groups
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  has_one :ordr_account

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first, :last, :addr, :addr2, :city, :state, :zip, :phone, :card_nickname, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  attr_accessible :invitation_token


  def billing_address
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

  def ordr_login
    Ordrin::Data::UserLogin.new(email, encrypted_password)
  end

  def update_ordr_account
    if ordr_account_id == nil
      ordr_user = $ordrin.user.create(ordr_login, first, last)
      self.ordr_account_id = ordr_user['user_id']
    else
      ordr_user = $ordrin.user.update(ordr_login, first, last)
    end
    return ordr_user
  end

  def create_credit_card

  end


end
