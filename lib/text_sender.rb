require_relative '../.env.rb'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Delivery

  attr_reader :sender, :client

  def initialize
    @sender = "441496877050"
    @client = Twilio::REST::Client.new(ENV[:ACCOUNT_SID], ENV[:AUTH_TOKEN])
  end

  def delivery_time
    delivery_time = (Time.new + 3600).strftime("%H:%M")
  end

  def text_customer
  	@client.account.messages.create({
  	    :body => "Thank you for your order. It will be delivered before #{delivery_time}",
  	    :to => ENV[:NUMBER],
  	    :from => sender})
    'You will reciece a text confimation shortly'
  end

end
