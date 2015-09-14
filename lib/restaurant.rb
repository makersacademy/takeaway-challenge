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
    send_text_confirmation
  end

  private

  def estimated_delivery_time
    delivery = Time.now + 3600
    delivery.strftime("%H:%M")
  end

  def send_text_confirmation
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    message = @client.account.messages.create(
      :from => ENV['TWILIO_NUM'],
      :to => ENV['NUM'],
      :body => "Thank you! Your order was placed and will be delivered before #{estimated_delivery_time}."
    )
 end
end
