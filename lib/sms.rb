require 'twilio-ruby'

class Sms
account_sid = "AC38a465ca854392e6c03a80b7d2cd85d8"
auth_token = "41af0e426342269d5f45d22d854798e7"

@client = Twilio::REST::Client.new account_sid, auth_token
@time = (Time.now + (60*60)).strftime("%H:%M")

def send_text
  @client.account.messages.create(
      to: "+447850371032",
    from: "+447850371032",
    body: "Thank you! Your order was placed and will be delivered before #{@time}.")
end
end
