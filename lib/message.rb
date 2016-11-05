require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(to)
    @client.messages.create(
    to: to,
    from: ENV['NUMBER_FROM'],
    body: "Thank you! Your order was placed and will be delivered before #{Time.new + (60 * 60)}."
    )
  end

  # def time
  #   time_new = Time.new
  #   @time_in_hour = time_new + (60 * 60)
  #   @time_in_hour
  # end
end
