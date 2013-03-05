class OrdrAccount < ActiveRecord::Base
  belongs_to :user
  attr_accessible :addr, :addr2, :card_nick, :city, :first, :last, :phone, :state, :user_id, :zip
end
