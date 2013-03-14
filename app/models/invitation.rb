class Invitation < ActiveRecord::Base
  belongs_to :user
  has_one :recipient

  validates :recipient_already_has_token



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
