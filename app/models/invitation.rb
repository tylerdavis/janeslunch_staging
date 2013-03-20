class Invitation < ActiveRecord::Base
  # belongs_to :sender, :class_name => 'User'
  # has_one :recipient, :class_name => 'User'
  belongs_to :user

  attr_accessible :user_id, :group_id, :user_attributes

  validates_presence_of :email, :on => :create, :message => "can't be blank"
  before_create :recipient_already_has_token
  accepts_nested_attributes_for :user


  private

  def generate_token
    self.token = Digest::SHA1::hexdigest([Time.now, rand].join) 
  end

  def recipient_already_has_token
    exsisting_user_with_token = User.find_by_email(recipient_email) && invitation_token != nil
    if exsisting_user_with_token
      @invitation_token = self.invitation_token
    else
      generate_token
    end
  end


end
