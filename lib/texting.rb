require 'twilio-ruby'

class Texting

  attr_reader :delivery_time

  NUMBER = '+447969797101'

  def initialize(send_to_number = NUMBER)
    @delivery_time = delivery_time

    @account_sid = 'AC39add806aa7238c6a3a1985d07d48fee'
    @auth_token = '4b64bcec1af317515d12218801a5c491'
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = '+447723445237' # Your Twilio number
    @to = send_to_number # Your mobile phone number
  end

  def delivery_time
    "#{Time.new.hour + 1}.#{Time.new.min}"
  end

  def send_text
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Your tea should arrive before #{@delivery_time} (^ v ^)"
    )
  end

  def confirmation
    "A text has been sent with your delivery time!"
  end



end
