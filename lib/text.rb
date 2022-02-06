# require 'twilio-ruby'
# require 'dotenv/load'

class Text

 attr_reader :account_sid, :auth_token

  def initialize
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @account_sid = ENV['TWILIO_ACCOUNT_SID']  
  end

  def send_text(message = "insert text")
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.api.account.messages.create(
      from: '+440000000000',
      to: '+44000000000',
      body: message
    )
    true
  end
end

class Messaging
    # repeating myself, consider a class for from/to perhaps?
    attr_reader :to, :from, :message
  
    def initialize(message_type, from, to, message)
      @message_type = message_type
      @from = from
      @to = to
      @message = message
    end
  
    def send
      @message_type.send(@from, @to, @message)
    end
  
  end