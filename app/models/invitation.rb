class Invitation < ActiveRecord::Base
  validates_uniqueness_of :email
  belongs_to :group
  has_many :users
  after_save :email_invite_if_not_user

  private
    def email_invite_if_not_user
      unless User.find_by_email(email)
        UserMailer.send_invite(self).deliver
      end
    end
end
