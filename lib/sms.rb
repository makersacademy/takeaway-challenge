require_relative 'takeaway'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Sms

  def initialize
  account_sid = 'ACdb8b93314f2f67e8f52e597c58c51d5d'
  auth_token = '5786bb0c0154b56831a5d9f9aceba342'
  @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(message)
  @client.account.messages.create({
      :from => '+441925320189',
      :to => '+447795975016',
      :body => message
  })
  end
end
