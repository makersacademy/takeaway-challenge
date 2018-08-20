require 'twilio-ruby'
require 'dotenv'

class Messenger

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def completed_order(total)
    send_sms("Thank you! Your order totalling £#{total} was placed and will be\
 delivered before #{delivery_time}")
  end

  private

  def send_sms(sms)
    @client.messages.create(
    body: sms,
    to: ENV['CUSTOMER_NUMBER'],
    from: ENV['TWILIO_NUMBER'])
  end

  def delivery_time(current_time = Time.now)
    @current_time = current_time
    "#{'%02d' % midnight_compensate}:#{'%02d' % current_time.min}"
  end

  def midnight_compensate
    @current_time.hour + 1 == 24 ? 00 : @current_time.hour + 1
  end
end
