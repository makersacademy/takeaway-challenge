require 'twilio-ruby'

class Customer

  ACCOUNT_SID = 'ACa5ef8ead3ef15b82f3e25c23c9504fa5'
  AUTH_TOKEN = 'b8c8ffa5636d5b69488e8a210dc3a1f2'

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def send_confirmation_message
    @client.account.messages.create({
      :from => '+441695302059',
      :to => '+4407572437603',
      :body => 'Hello Lewis',
    })
  end
end