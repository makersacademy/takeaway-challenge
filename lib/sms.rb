require 'twilio-ruby'

class SMS

  ACCOUNT_SID = "AC5345f9ffccfe1257302bfc1e0b703c4d"
  AUTH_TOKEN = "26aed32b0cec45d31eeffd1cd2ea9e52"

  def send_text
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    @client.messages.create(
      from: "+441633530244",
      to: "+447847470091",
      body: "Your order has been confirmed, and will be delivered at #{Time.now + 60*60}"
    )
  end

end
