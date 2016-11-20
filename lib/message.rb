require 'rubygems'
require 'twilio-ruby'

class Message

  def text
    delivery_time = Time.now + (60 * 60)

    account_sid = "AC3cfdffd043d2ad9ad31516f46690499e"
    auth_token = "bb85005e7205713451e05fe49588764f"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+441772441327"

    number = "+447588686168"
    client.account.messages.create(
      :from => from,
      :to => number,
      :body => "Thank you! Your order was placed and is being delivered by our best directionally challenged learner driver. It will be delivered before  #{delivery_time.strftime('%H:%M')}.")
    "Thank you for your order. A text message confirming the order is on its way."
  end

end
