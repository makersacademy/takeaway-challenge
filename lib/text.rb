require 'twilio-ruby'

class Text

  def initialize
    account_sid = "AC64322cfcf8a859f886271ef8833365b9"
    auth_token = "fbc762a21a7e7bf33ea60d1c78a20398"
  end


def send_text
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Thanks for the order. Your food will be with you at #{time}!",
    to: "+447740097914",    # Replace with your phone number
    from: "+441158244546")  # Replace with your Twilio number

puts message.sid
end

private

  def time
    t = Time.now + 3600
    t.strftime("%H:%M")
  end

end
