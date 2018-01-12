require 'twilio-ruby'

class Texter
  def initialize(account_sid, auth_token, takeaway_number,client_class = Twilio::REST::Client, time_class = Time)
    @client = client_class.new account_sid, auth_token
    @time_class = time_class
    @takeaway_number = takeaway_number
  end

  def text customer_number
    text = "Thank you! Your order was placed and will be delivered before #{hour_from_now}."
    @client.api.account.messages.create(
      from: @takeaway_number,
      to: customer_number,
      body: text
    )
  end
private
  def hour_from_now
    (@time_class.now + 3600).strftime("%H:%M")
  end

end
