require 'twilio-ruby'
class Text
  def send_text(message)
    account_sid = ENV['TWILIOSID']
    auth_token = ENV['TWILIOAUTH'] # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        body: message,
        to: "+447810878636",
        from: "++441158244614")
  end
end
