class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :groups


  # Setup accessible (or protected) attributes for your model
  attr_accessible :first, :last, :card_nickname, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def address_for_ordr
    Ordrin::Data::Address(addr, city, state, zip, phone, addr2='')
  end

end
