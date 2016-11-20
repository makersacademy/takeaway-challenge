# require_relative 'twilio-ruby'

class Delivery

  attr_reader :delivery_time

  def initalize
    @delivery_time = Time.now + 1*60*60
  end

  def delivery_text
    # account_sid = "AC1f92a5b3d10fa61a14ef3256b404b059"
    # auth_token = "0be04ec9c867f8fcd1e916761508e2fb"
    # @client = Twilio::REST::Client.new account_sid, auth_token
    # message = @client.account.messages.create(:body => "Hello your delivery will arrive at #{delivery_time} Thank you!",
    # :to => "+07732425586",
    # :from => "+441289466048")
    # puts message.sid
  end

end
