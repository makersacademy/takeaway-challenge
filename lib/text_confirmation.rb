require 'twilio-ruby'

class TextConfirmation
  def initialize
    @my_mobile = ENV['MY_MOBILE']
    my_auth_token = ENV['TWILIO_TOKEN']
    account_sid = "ACb008b1d4a2bc236d7b06178ccc9a2042"
    auth_token = "#{my_auth_token}"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    time = Time.now + 3600
    @client.messages.create(
    from: "+16614855243",
    to: "+#{@my_mobile}",
    body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end
end