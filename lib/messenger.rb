require 'dotenv'
Dotenv.load('../.env')

class Messenger

  def message
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    time = (Time.now + 1 * 60 * 60).strftime('%r')
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thanks for ordering from Paradise Takeaway, you should recieve your food just before #{time}",
      to: "+447548600019", # Replace with your phone number
      from: "+447480824308 ") # Replace with your Twilio number

  end

end
