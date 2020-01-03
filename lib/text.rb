require 'twilio-ruby'
require 'dotenv'
Dotenv.load('./.env')

module Text

  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']


  @client = Twilio::REST::Client.new(@account_sid, @auth_token)

  @from = ENV["TWILIO_FROM_NUMBER"]
  @to = ENV["TWILIO_TO_NUMBER"]

  @delivery_time = (Time.now + (60 * 60)).strftime("%k:%M")


  def self.send
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order will be delivered by #{@delivery_time}"
    )
  end
end
