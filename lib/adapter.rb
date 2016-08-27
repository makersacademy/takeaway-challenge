require 'twilio-ruby'

# Understands how to interact with Twilio API
class Adapter
  def initialize
    @sid = ENV['TWILIO_ACCOUNT_SID']
    @token = ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @phone_number = ENV['TEST_NUMBER']
  end

  def send_sms(message)
    client = Twilio::REST::Client.new sid, token
    client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: message
    )
  end

  def download_inbound_messages
    client = Twilio::REST::Client.new sid, token
    inbound = []
    messages = client.account.messages.list
      messages.each do |message|
        inbound << [message.from, message.body]
      end
    inbound.select{ |f| f != ENV['TWILIO_NUMBER'] }
  end

  def update_messages
    client = Twilio::REST::Client.new sid, token
    to_delete = []
    messages = client.account.messages.list
    messages.each{|message| to_delete << message.sid}
    to_delete.each do |sid|
      message = client.account.messages.get(sid)
      message.redact
    end
  end

  private

  attr_reader :sid, :token, :twilio_number, :phone_number
end
