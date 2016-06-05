require 'twilio-ruby'
require 'dotenv'
require 'yaml'
Dotenv.load

class TextLogs

  def run_logs(client=nil)
    extract_inbound(client)
  end

  def received
    @received.to_yaml
  end

  private

  SID = ENV['TWILIO_ACCOUNT_SID']
  TOKEN = ENV['TWILIO_AUTH_TOKEN']

  def extract_inbound(client=nil)
    @client = client || Twilio::REST::Client.new(SID, TOKEN)
    @selection = client || @client.account.sms.messages.list.select do |sms|
      sms.direction == "inbound"
    end
    decypher_texts(client)
  end

  def decypher_texts(client=nil)
    @received = []
    @selection.each do |sms|
      @received << client || [sms.from, sms.body]
      @received << "----------------------"
    end
  end
end
