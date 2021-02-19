require_relative 'takeaway'
require 'rubygems'
require 'twilio-ruby'

class Sms
  attr_accessor :phone_number, :time

  def initialize(phone_number)
    @phone_number = phone_number
    send_message
  end

  private
  def send_message
    account_sid = ENV['################################']
    auth_token = ENV['#################################']
    @client = ::Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
    body: "Hello, your order has been place, thank you!
    You will receive your order at #{time}",
    to: @phone_number,
    from: "+447723950804")
  end

  def delivery_time
    @time = Time.now + 1 * 60 * 60
  end

end
