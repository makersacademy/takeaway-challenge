require 'rubygems'
require 'twilio-ruby'

class Messenger

account_sid = 'AC8132f92d2bdc365339186ca2d6f46225'
auth_token = '920dfb649573f2bc4b854f12e0e7f93b'
client = Twilio::REST::Client.new account_sid, auth_token

from = "+441202286077" # Your Twilio number

customer = {
"+447411252150" => "Rachael",
 }

  def send_sms
  customer.each do |key, value|
    client.account.messages.create(
      :from => from,
      :to => key,
      :body => "Hello #{value}, your order has been completed and should be with you shortly"
    )
    puts "Sent message to #{value}"
  end
end
end
