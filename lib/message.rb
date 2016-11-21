require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Message

  def text
    Dotenv.load
    delivery_time = Time.now + (3600)

    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token


    client.account.messages.create(
      :from => ENV["FROM"],
      :to => ENV["TO"],
      :body => "Thank you! Your order was placed and is being delivered by our best directionally challenged learner driver. It will be delivered before  #{delivery_time.strftime('%H:%M')}.")
    "Thank you for your order. A text message confirming the order is on its way."
  end

end
