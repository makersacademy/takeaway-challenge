require 'twilio-ruby'

class Messenger

  def initialize
    @account_sid = "ACb489f10e61ac0362e458eb441c529c50"
    @auth_token = "8cadc1eaeca68e215f7ea26fdd27aae0"
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def complete_order(total)
    send_sms("Thank you! Your order totalling £#{total} was placed and will be delivered before #{delivery_time}")
  end

  def send_sms(sms)
    message = @client.messages.create(
    body: sms,
    to: "+447863777269",
    from: "+447481346169")
  end

  def delivery_time (current_time = Time.now)
    @current_time = current_time
    # Time.new.hour + 1 == 24 ? hour = 00 : hour = Time.new.hour
    "#{'%02d' % midnight_compensate}:#{'%02d' % current_time.min}"
  end

  def midnight_compensate
    @current_time.hour + 1 == 24 ? 00 : @current_time.hour + 1
  end
end

# puts message.sid
