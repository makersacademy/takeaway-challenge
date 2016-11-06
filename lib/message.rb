require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def send_text(to)
    @client.messages.create(
    to: to,
    from: ENV['NUMBER_FROM'],
    body: "Your order will be delivered before #{time} on #{date}."
    )
  end

  private

  def time
    (Time.new + (60 * 60)).strftime('%H:%M')
  end

  def date
    Time.new.strftime('%d %b %Y')
  end

end
