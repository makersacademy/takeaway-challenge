require 'bundler'
Bundler.require()

account_sid = 'AC.......' # Could use ENV['TWILIO_ACCOUNT_SID']
auth_token = '........' # Could use ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

@clint.messages.create(
  to: '+440000000000',
  from: '+44twilio number',
  body: 'Text message'
)

# Receives instruction from the interface to send
# a text message to the customer, and sends that
# message on to the API
class Reassurer
  def initialize
    @time = (Time.now + 3600).strftime("%H:%M:%S")
  end

  def reassure
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  private

  attr_reader :time
end
