require 'twilio-ruby'

class Texting

  attr_reader :delivery_time

  SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  T_NUMBER = ENV['TWILIO_NUMBER']
  NUMBER = ENV['MY_NUMBER']


  def initialize
    @delivery_time = delivery_time

    @account_sid = SID
    @auth_token = AUTH_TOKEN
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = T_NUMBER
    @to = NUMBER

  end

  def delivery_time
    "#{Time.new.hour + 1}.#{Time.new.min}"
  end

  def send_text
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Your tea should arrive before #{@delivery_time} (^ - ^)"
    )
  end

  def confirmation
    "A text has been sent with your delivery time!"
  end



end
