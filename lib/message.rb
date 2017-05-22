require 'twilio-ruby'
require 'dotenv/load'

# sends a text message confirming an order
class Message
  attr_reader :time_order

  def initialize
    @acc_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
  end

  def send_message(price)
    @client = Twilio::REST::Client.new @acc_sid, @auth_token

    calculate_time
    message = @client.account.messages.create(
       :from => ENV['TWILIO_NUMBER'],
       :to => ENV['CUSTOMER_NUMBER'],
       :body => "So delicious, and no animals?! Here is one happy piggy. \u{1F437}
       Total cost will be £#{price}, and arrives at #{@time_order}. Enjoy!"
    )
    message.to
  end

  private
  def calculate_time
    time2 = Time.now + (30 * 60)
    @time_order = time2.strftime("%H:%M")
  end
end
