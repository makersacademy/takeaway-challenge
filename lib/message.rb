require 'twilio-ruby'

# sends a text message confirming an order
class Message
  attr_reader :time_order

  def initialize
    @account_sid = 'xxxxxxxxxx'
    @auth_token = 'xxxxxxxxxx'
    @twilio_number = 'xxxxxxxxxx'
    @customer_number = 'xxxxxxxxxx'
  end

  def send_message(price)
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    calculate_time
    message = @client.account.messages.create(
       :from => @twilio_number,
       :to => @customer_number,
       :body => "So delicious, and no animals?! Here is one happy piggy. \u{1F437}
       Total cost will be £#{price}, and arrives at #{@time_order}. Enjoy!"
    )
    message.to
  end

  private
  def calculate_time
    time2 = Time.now + (30 * 60)
    @time_order = "#{time2.hour}:#{time2.min}"
  end
end
