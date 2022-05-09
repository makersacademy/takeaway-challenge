require_relative 'order'
require 'twilio-ruby'

class Text

  attr_accessor :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
    send_text
    puts "Thank you for your order. Estimated delivery time will be texted to #{@phone_number}."
  end

  private
  def send_text
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
        body: "Thank you for your order.
              Our 1 hour delivery means
              you should receive your order
              by #{delivery_time}",
        to: @phone_number,
        from: "+16175536756")
  end

  def delivery_time
    hour = Time.now.hour
    minute = Time.now.min
    "#{hour + 1}:0#{minute}" if minute < 10
    "#{hour + 1}:#{minute}"
  end

end
