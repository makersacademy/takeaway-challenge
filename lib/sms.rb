require 'twilio-ruby'

class Sms

  attr_reader :sms

def send_confirmation_sms(delivery_time)
  puts "Thank you for ordering, your order will be delivered by #{delivery_time}"

  # # To find these visit https://www.twilio.com/user/account
  # account_sid = "ACb693d3ea979cfd57fc8aba3e2ded5de2"
  # auth_token = "dece234fb75725e55695d47f52389d2a"
  #
  # @client = Twilio::REST::Client.new account_sid, auth_token
  #
  # @message = @client.messages.create(
  #   to: "+447863555051",
  #   from: "+441143032703",
  #   body: "Thank you for ordering, your order will be delivered by #{delivery_time}"
  # )
  end
end
