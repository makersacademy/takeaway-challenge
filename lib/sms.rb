# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SMS
  def initialize
    @account_sid = 'AC3d8670509df17ad7546b9ec2bcf013dd'
    @auth_token = 'e67c55c82113398cd2ae19a7bb538173'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = '+441522246322' # Your Twilio number
    @to = '+447986371299' # Your mobile phone number
  end

  def send
    client.messages.create(
      from: from,
      to: to,
      body: "Hey friend!"
    )
    end
  
  private

  attr_reader :from, :to, :body, :account_sid, :auth_token, :client
end
