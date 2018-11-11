require 'twilio-ruby'

class Text_sender

ACCOUNT_SID = 'AC04bc3c411d276059731f2bb3cb259375'
AUTH_TOKEN = 'a113ded30d75e81269b8cd4a41e12096'

  def initialize(client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN))
    @account_sid = ACCOUNT_SID
    @auth_token = AUTH_TOKEN
    @clent = clent
  end

  def text_confirmation
    @client.messages.create(
    from: +12282313459
    to: +44 07447923172
    body: "Thank you! Your order was placed and will be delivered before" +
          " #{delivery_time}.")
  end

  def delivery_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end


end