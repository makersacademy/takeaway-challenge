require 'twilio-ruby'

# Understands how to interact with Twilio API
class Adapter
  def initialize(client = Twilio::REST::Client)
    @sid = ENV['TWILIO_ACCOUNT_SID']
    @token = ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @phone_number = ENV['TEST_NUMBER']
    @client = client.new(@sid, @token)
  end

  def send_sms(message)
    client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: message
    )
  end

  def download_inbound_messages
    inbound = []
    messages = client.account.messages.list
      messages.each do |message|
        inbound << [message.from, message.body]
      end
    inbound.select{ |f,_b| f != twilio_number }
  end

  def update_messages
    to_redact = []
    messages = client.account.messages.list
    messages.each{|message| to_redact << message.sid}
    to_redact.each do |sid|
      message = client.account.messages.get(sid)
      message.redact
    end
  end

  private

  attr_reader :twilio_number, :phone_number, :client
end
