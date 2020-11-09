require 'twilio-ruby'
require_relative 'numbers.rb'

class Text

  attr_reader :from, :to

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = Numbers::TWILIO_NUMBER
    @to = Numbers::MY_NUMBER
  end

  def confirm_order
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered within an hour"
    )
  end

end
