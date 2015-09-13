require 'twilio-ruby'
require_relative '../.env.rb'

class TwilioAPI

  def order_confirmation
    account_sid = ENV[:account_sid]
    auth_token = ENV[:auth_token]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create({
      :from => ENV[:twilio],
      :to => ENV[:recipient],
      :body => confirmation
    })
  end

  def delivery_time
    hour_from_now = Time.now + (60*60)
    delivery_time = hour_from_now.strftime("%H:%M")
  end

  def confirmation
    "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end
end