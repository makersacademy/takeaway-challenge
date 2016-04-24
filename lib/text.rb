require 'twilio-ruby'
require_relative "./order.rb"
class Text
  # put your own credentials here
  def initialize
    account_sid = 'ACdb8b93314f2f67e8f52e597c58c51d5d'
    auth_token = ''
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create({
    	:from => '+441925320189',
    	:to => '',
      :body => 'testing'
    })
  end
end
