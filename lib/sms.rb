require 'twilio-ruby'

class Sms
# attr_reader :from, :to, :message
account_sid = 'AC94b4ffbae5e8af03a905186d78282c2b'
auth_token = '87daaf5c1e647a7a6cbe8a6cc3afb79a'
client = Twilio::REST::Client.new(account_sid, auth_token)
from = '+447481346381' # Your Twilio number
to = '+447500602857' # Your mobile phone number # set ENV VARS before commit 

  def initialize(client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
    @from = ENV['TWILIO_PHONE']
    @to = ENV['TWILIO_DESTINATION_PHONE']
    # @message = message
  end

  def send
    @client.messages.create(
    from: @from,
    to: @to,
    body: @message
    )
  end

end
