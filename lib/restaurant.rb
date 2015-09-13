require 'twilio-ruby'
require 'dotenv'
require_relative 'menu.rb'
Dotenv.load

class Restaurant
  include Menu

  def initialize
    @name = 'Bella'
  end

  def take_away
    delivery = Time.now + 3600
    delivery_time = delivery.strftime("%H:%M")

     @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

     message = @client.account.messages.create(
       :from => ENV['TWILIO_NUM'],
       :to => ENV['NUM'],
       :body => "Thank you! Your order was placed and will be delivered before #{delivery_time}."
     )
  end
end
