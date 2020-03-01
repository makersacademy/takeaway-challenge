require 'rubygems'
# require 'twilio-ruby'



class Order
  attr_reader :order
  def initialize
    @order = []
    @client
  end
  def print_order
    puts "Your current order:"
    @order.each { |item|
      puts "#{item[:item]} X#{item[:quantity]}"
    }
  end
  def end_order
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    # message = @client.messages
    #   .create(
    #      body: 'Thank you for ordering with us, your order is being prepared and will be with you in one hour',
    #      from: ''
    #      to: ''
    #    )

    puts message.sid
  end
end
