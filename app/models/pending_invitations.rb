class PendingInvitations < ActiveRecord::Base
  attr_accessible :group_id, :user_id
end
