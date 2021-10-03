require 'dotenv/load'
require 'twilio-ruby'

class Order
  attr_accessor :items
  attr_reader :client

  def initialize
    @items = []
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send_confirmation
    @client.messages.create(
      from: ENV["TWILIO_NUM"], 
      to: ENV["MY_MOB_NUM"], 
      body: "Order placed at: #{Time.new.strftime("%H:%M")}\n\nThank you for placing an order! Your delivery will be with you by: #{(Time.new + 60 * 60).strftime("%H:%M")}"
    )
  end
end