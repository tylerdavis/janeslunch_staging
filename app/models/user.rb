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
  attr_accessible :first, :last, :ordr_account_id, :addr, :addr2, :city, :state, :zip, :phone, :card_nickname, :card_last_four, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  attr_accessible :invitation_token



end
