require 'twilio-ruby'
require_relative 'environment'

class FoodConnect
  attr_reader :account_sid, :auth_token
  
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']  
    @auth_token = ENV['TWILIO_AUTH_TOKEN'] 
    client
  end

  def client
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(client = @client)
    message = client.messages.create(
        to: ENV['TO_NUMBER'], 
        from: ENV['FROM_NUMBER'],
        body: "Thank you! Your order was placed and will be delivered before #{Time.new.strftime("%k:%M")}"
      )  
  end

end
