require 'twilio-ruby'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = { chicken_noodle_soup: 4.95,
      duck_spring_rolls: 4.95,
      crispy_duck: 8.95,
      singapore_fried_noodles: 7.95,
      steamed_rice: 2.95 }
  end

  def complete_order(order_total)
    send_sms("Thank you! Your order total of £#{order_total} was placed and will be delivered before #{delivery_time}")
  end

  def delivery_time
    current_time = Time.now
    delivery_hour = current_time.hour + 1
    delivery_minute = current_time.min
    "#{delivery_hour}:#{delivery_minute}"
  end

  private

  def send_sms(message_to_send)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
        :from => '441358202027',
        :to => '+447868303463',
        :body => message_to_send
        )
    message_to_send
  end

end
